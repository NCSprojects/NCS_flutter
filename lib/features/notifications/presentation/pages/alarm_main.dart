import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ncs/app/theme/app_color.dart';
import 'package:ncs/comm/setting/screen_util_setting.dart';
import 'package:ncs/features/navigation/presentation/widgets/backspace_app_bar.dart';
import 'package:ncs/features/notifications/presentation/bloc/alarm_cubit.dart';
import 'package:ncs/features/notifications/presentation/widgets/alarm_container.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(
    Builder(builder: (context) {
      ScreenUtil.init(context); // 초기화
      return const AlarmMain();
    }),
  );
}

class AlarmMain extends StatelessWidget {
  const AlarmMain({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => AlarmCubit(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Scaffold(
          backgroundColor: AppColor.back,
          appBar: const BackspaceAppBar(),
          body: Column(
            children: [
              const SizedBox(height: 10),
              Expanded(
                child: BlocBuilder<AlarmCubit, AlarmState>(
                  builder: (context, state) {
                    return ListView.builder(
                      itemCount: state.alarms.length,
                      itemBuilder: (context, index) {
                        final alarm = state.alarms[index];
                        final isDismissed =
                            state.dismissedStates[index] ?? false;

                        return AlarmContainer(
                          title: alarm['title']!,
                          description: alarm['description']!,
                          imagePath: alarm['imagePath']!,
                          isDismissed: isDismissed,
                          onDismissed: () {
                            context.read<AlarmCubit>().deleteAlarm(index);
                          },
                          onSwipeUpdate: (dismissed) {
                            context
                                .read<AlarmCubit>()
                                .setDismissed(index, dismissed);
                          },
                        );
                      },
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}