import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:dio/dio.dart';
import 'package:ncs/app/theme/app_color.dart';

import 'package:ncs/app/theme/custom_box_shadow.dart';
import 'package:ncs/app/theme/custom_button.dart';
import 'package:ncs/app/theme/custom_num_input.dart';
import 'package:ncs/app/theme/custom_text_style.dart';
import 'package:ncs/comm/setting/screen_util_setting.dart';
import 'package:ncs/comm/widget/show_snack_bar.dart';
import 'package:ncs/core/utils/host.dart';

import 'package:ncs/features/auth/presentation/bloc/auth_bloc.dart';
import 'package:ncs/features/auth/data/auth_api.dart';
import 'package:ncs/features/auth/data/auth_repository.dart';
import 'package:ncs/features/home/widgets/ticket.dart';

import '../presentation/pages/ticket_view.dart';
import 'main_container_on.dart';

class MainContainerOff extends StatelessWidget {
  const MainContainerOff({super.key});

  @override
  Widget build(BuildContext context) {
    final TextEditingController _controller = TextEditingController();

    return BlocProvider(
      create: (context) {
        // Dio 초기화 및 API, Repository 생성
        final dio = Dio();
        final authApi = AuthApi(dio, baseUrl: "$host/auth");
        final authRepository = AuthRepository(authApi: authApi);
        return AuthBloc(repository: authRepository);
      },
      child: BlocConsumer<AuthBloc, AuthState>(
        listener: (context, state) {
          if (state is AuthSuccess) {
            print("새로운 액세스 토큰: ${state.accessToken}");
            showSnackBar(context, "인증되었습니다.", AppColor.blue);
          } else if (state is AuthFailure) {
            print("오류: ${state.error}");
            showSnackBar(context, "인증되지 않은 번호입니다.", AppColor.red);
          }
        },
        builder: (context, state) {
          if (state is AuthSuccess && state.accessToken.isNotEmpty) {
            return Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: MainContainerOn(
                    visitors: state.visitors,
                  ),
                ),
                TicketView(
                  tickets: List.generate(1, (_) => const Ticket()),
                ),
              ],
            );
          }
          return Center(
            child: Container(
              width: ScreenUtil.widthPercentage(0.8),
              height: ScreenUtil.heightPercentage(0.35),
              decoration: NCSshadow.custom(
                color: Colors.white,
                borderRadius: 15,
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const NCSText(
                    text: '입장 번호 입력하기',
                    fontSize: 20,
                    fontWeight: FontWeight.w600,
                  ),
                  const NCSText(
                    text: '관람권 결제 후 받은 번호 6자리를 입력하고 예약하세요.',
                    fontSize: 10,
                    fontWeight: FontWeight.w300,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(25.0),
                    child: Column(
                      children: [
                        if (state is AuthLoading)
                          const Padding(
                            padding: EdgeInsets.only(top: 8.0),
                            child: CircularProgressIndicator(),
                          ),
                        SizedBox(
                          height: ScreenUtil.heightPercentage(0.045),
                          child: CustomNumInput.numberInputField(
                            context: context,
                            controller: _controller,
                            text: "안내받은 번호 6자리를 입력해주세요.",
                            fontSize: 10,
                            fontWeight: FontWeight.w400,
                            inputFormatters: [
                              FilteringTextInputFormatter.allow(RegExp(r'\d')),
                              LengthLimitingTextInputFormatter(6),
                            ],
                          ),
                        ),
                        const SizedBox(height: 10),
                        SizedBox(
                          height: ScreenUtil.heightPercentage(0.045),
                          child: CustomButton.customButton(
                            text: "확인",
                            onPressed: () {
                              final authCode = _controller.text;
                              // 6자리 숫자 형식 검증
                              if (RegExp(r'^\d{6}$').hasMatch(authCode)) {
                                // 기존 authCode 대신 randomId 필드 사용
                                context.read<AuthBloc>().add(
                                    VerifyAuthCodeEvent(randomId: authCode)
                                );
                              } else {
                                showSnackBar(context, "올바른 6자리 숫자를 입력해주세요.", AppColor.red);
                              }
                            },
                            fontSize: 12,
                            borderRadius: 5,
                          ),
                        ),

                      ],
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}