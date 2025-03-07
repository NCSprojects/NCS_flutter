// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:ncs/comm/widget/show_snack_bar.dart';
//
// class InputState {
//   final String inputText;
//   final String? errorMessage;
//
//   InputState({
//     required this.inputText,
//     this.errorMessage,
//   });
//
//   InputState copyWith({
//     String? inputText,
//     String? errorMessage,
//   }) {
//     return InputState(
//       inputText: inputText ?? this.inputText,
//       errorMessage: errorMessage,
//     );
//   }
// }
//
// class InputCubit extends Cubit<InputState> {
//   InputCubit() : super(InputState(inputText: '', errorMessage: null));
//
//   /// 입력값 업데이트
//   void updateInput(String inputText) {
//     emit(state.copyWith(inputText: inputText));
//   }
//
//   /// 입력값 검증
//   void validateInput(BuildContext context) {
//     const String pattern = r'^\d{6}$';
//     final RegExp regExp = RegExp(pattern);
//
//     if (!regExp.hasMatch(state.inputText)) {
//       showSnackBar(context, '숫자 6자리를 입력해주세요.');
//     } else {
//       // 서버 통신 또는 다른 로직 실행 가능
//     }
//   }
//
//   /// 입력값 초기화
//   void clearInput() {
//     emit(state.copyWith(inputText: '', errorMessage: null));
//   }
// }