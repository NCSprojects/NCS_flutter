import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ncs/app/theme/app_color.dart';
import 'package:ncs/features/contents/data/contents_api.dart';
import 'package:ncs/features/contents/presentation/bloc/contents_bloc.dart';
import 'package:ncs/features/exhibits/presentation/widgets/exhibit_container_button.dart';
import 'package:dio/dio.dart';

import '../../../../contents/data/contents_repostiory.dart';

class BigHistoryMain extends StatelessWidget {
  const BigHistoryMain({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) {
        final dio = Dio();
        dio.interceptors.add(LogInterceptor(responseBody: true));

        final api = ContentsApi(dio);
        final repository = ContentsRepository(api: api);
        return ContentsBloc(repository: repository)..add(LoadContentsByFloor(floor: 3));
      },
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Scaffold(
          resizeToAvoidBottomInset: false,
          backgroundColor: AppColor.back,
          body: Center(
            child: BlocBuilder<ContentsBloc, ContentsState>(
              builder: (context, state) {
                if (state is ContentsLoading) {
                  return const CircularProgressIndicator();
                } else if (state is ContentsLoaded) {
                  final content = state.contents;

                  final start = "${content.stdDate!.month.toString().padLeft(2, '0')}/${content.stdDate!.day.toString().padLeft(2, '0')}";
                  final end = "${content.endDate!.month.toString().padLeft(2, '0')}/${content.endDate!.day.toString().padLeft(2, '0')}";

                  return Column(
                    children: [
                      const SizedBox(height: 15),
                      ExhibitContainerButton(
                        imagePath: 'assets/images/science.png',
                        title: content.title ?? '준비중입니다.',
                        duration: '기간: ${start ?? ''}~${end ?? ''}',
                        description: content.content ?? '',
                        mainText: content.mainText ?? '',
                        subText: content.subText ?? '',
                      ),
                    ],
                  );
                } else if (state is ContentsError) {
                  return Text("에러: ${state.message}");
                } else {
                  return const Text("콘텐츠를 불러오는 중입니다...");
                }
              },
            ),
          ),
        ),
      ),
    );
  }
}