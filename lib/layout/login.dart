import 'dart:convert';

import 'package:NCS/comm/setting/notification_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class LogIn extends StatefulWidget {
  const LogIn({Key? key}) : super(key: key);

  @override
  State<LogIn> createState() => _LogInState();
}

class _LogInState extends State<LogIn> {
  // 언어 선택 콤보박스
  // ignore: prefer_final_fields
  var _valueMap = {'KOR': '한국어', 'ENG': 'English', 'VET': 'Vietnamese'};
  // ignore: prefer_final_fields
  var _valueList = ['KOR', 'ENG', 'VET'];
  // ignore: prefer_final_fields
  String _selectValue = 'KOR';

  // 파이어베이스 토큰
  String newToken = '';

  // 처음 화면 불러올때 데이터 셋팅
  setInit() async {
    // SecureStorage 유저Id 정보 가져오기
    dynamic userData = await SecureStorage.getUserData();

    // 파이어베이스 토큰 정보 가져오기
    newToken = (await NotificationController.getToken())!;

    // UserId 정보가 있으면 TextField에 UserId자동 입력 & 체크박스 체크
    if (userData != null) {
      Map userDataMap = jsonDecode(userData);

      edt_oper_comp_cd.text = userDataMap['oper_comp_cd'];
      edt_user_id.text = userDataMap['user_id'];
      setState(() {
        _isIdSaved = true;
      });
    }
  }

  @override
  void initState() {
    super.initState();
    setInit();
  }

  TextEditingController edt_oper_comp_cd = TextEditingController();
  TextEditingController edt_user_id = TextEditingController();
  TextEditingController edt_user_pw = TextEditingController();

  // 비밀번호 숨김 (true/false)
  bool passwordVisible = true;
  // 체크박스
  bool _isAutoLogin = false;
  bool _isIdSaved = false;

  // 로그인할때 필요한 변수(Map) 선언
  // ignore: prefer_final_fields
  Map<String, dynamic> _paramMap = {
    'PARAM': {
      'oper_comp_cd': '',
      'user_id': '',
      'user_pw': '',
      'user_lang_cd': '',
      'pagingLimit': '100',
      'currentPage': '1'
    }
  };

  login(BuildContext context) async {
    if (edt_oper_comp_cd.text.isEmpty) {
      showSnackBar(context, '운영사코드를 입력하세요.');
      return;
    } else if (edt_user_id.text.isEmpty) {
      showSnackBar(context, 'ID를 입력하세요.');
      return;
    } else if (edt_user_pw.text.isEmpty) {
      showSnackBar(context, 'PASSWORD를 입력하세요.');
      return;
    } else {
      // 텍스트 필드에 입력한 데이터 셋팅
      _paramMap['PARAM']['user_lang_cd'] = _selectValue;
      _paramMap['PARAM']['oper_comp_cd'] = edt_oper_comp_cd.text;
      _paramMap['PARAM']['user_id'] = edt_user_id.text;
      _paramMap['PARAM']['user_pw'] = edt_user_pw.text;

      final requestMapString =
      await client.getUserInfo('application/json', _paramMap);
      Map requestMap = jsonDecode(requestMapString);

      var error_code = requestMap['COMMON']['ERROR_CODE'];

      if (error_code == '0000') {
        Map<String, dynamic> userInfos = requestMap['MAP']['USER_INFO'];
        userInfos['user_lang_cd'] = _selectValue;

        // Map to JsonString
        var loginUser = jsonEncode(UserInfo.fromJson(userInfos).toJson());

        // 유저정보 SecureStorage에 저장
        SecureStorage.setUserInfo(loginUser);

        saveDataSetting(_paramMap);

        // 자동 로그인
        _isAutoLogin
        // 자동 로그인 SecureStorage에 저장
            ? SecureStorage.setAutoLogin(_isAutoLogin.toString())
            : null;

        // 유저Id 저장
        if (_isIdSaved) {
          Map userData = {
            'oper_comp_cd': edt_oper_comp_cd.text,
            'user_id': edt_user_id.text,
          };

          String userDataString = jsonEncode(userData);

          // 유저Id SecureStorage에 저장
          SecureStorage.setUserData(userDataString);
        } else {
          // 유저Id SecureStorage에서 삭제
          SecureStorage.deleteUserData();
        }
        // _isIdSaved
        //     // 유저Id SecureStorage에 저장
        //     ? SecureStorage.setUserId(edt_user_id.text)
        //     // 유저Id SecureStorage에서 삭제
        //     : SecureStorage.deleteUserId();

        // firebase Token 저장
        _paramMap['PARAM']['token'] = newToken;
        SecureStorage.setUserToken(newToken);
        client.setUserToken('application/json', _paramMap);

        // 홈으로 이동
        Navigator.pushNamedAndRemoveUntil(
            context, '/home_wms', (route) => false);
      } else if (error_code == '9999') {
        showSnackBar(context, requestMap['COMMON']['MESSAGE_CODE']);
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () {
        return onWillPop();
      },
      child: Scaffold(
        body: GestureDetector(
          onTap: () {
            FocusScope.of(context).unfocus();
          },
          child: Container(
            color: Color(0xFF3668FF),
            width: double.infinity,
            height: double.infinity,
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Padding(padding: EdgeInsets.only(top: 120)),
                  Center(
                    child: SvgPicture.asset(
                      'assets/logos/logo_wt.svg',
                      width: 230,
                      fit: BoxFit.contain,
                    ),
                  ),
                  Padding(padding: EdgeInsets.only(top: 80)),
                  Form(
                    child: Theme(
                      data: ThemeData(),
                      child: Container(
                        padding: EdgeInsets.only(left: 20, right: 20),
                        child: Column(
                          children: [
                            BuildTextFieldTheme(
                              DropdownButtonFormField<String?>(
                                decoration: InputDecoration(
                                  alignLabelWithHint: true,
                                  contentPadding: EdgeInsets.only(left: 0),
                                  border: OutlineInputBorder(
                                      borderSide: BorderSide.none),
                                  focusedBorder: OutlineInputBorder(
                                      borderSide: BorderSide.none),
                                ),
                                dropdownColor: Color(0xFF3668FF),
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 15,
                                ),
                                icon: Padding(
                                  padding: EdgeInsets.all(8),
                                  child: SvgPicture.asset(
                                      'assets/icons/ico_under_down_wt.svg'),
                                ),
                                value: _selectValue,
                                items: _valueList
                                    .map<DropdownMenuItem<String?>>((i) {
                                  return DropdownMenuItem<String?>(
                                    value: i,
                                    child: Text(
                                      _valueMap[i] ?? '',
                                      style: TextStyle(
                                        color: Colors.white,
                                      ),
                                    ),
                                  );
                                }).toList(),
                                onChanged: null, // 나중에 활성화 필요
                                // (value) async {
                                //   _selectValue = value!;
                                // },
                              ),
                            ),
                            SizedBox(height: 20),
                            BuildTextFieldTheme(
                              BuildTextField(
                                controller: edt_oper_comp_cd,
                                hintText: 'COMPANY CODE',
                                keyboardType: TextInputType.text,
                                textCase: TextCase.upper,
                              ),
                            ),
                            SizedBox(height: 20),
                            BuildTextFieldTheme(
                              BuildTextField(
                                controller: edt_user_id,
                                hintText: 'ID',
                                keyboardType: TextInputType.text,
                                textCase: TextCase.lower,
                              ),
                            ),
                            SizedBox(height: 20),
                            BuildTextFieldTheme(
                              Row(
                                children: [
                                  Expanded(
                                    child: BuildTextField(
                                      controller: edt_user_pw,
                                      hintText: 'PASSWORD',
                                      keyboardType:
                                      TextInputType.visiblePassword,
                                      obscureText: passwordVisible,
                                      method: () => login(context),
                                    ),
                                  ),
                                  IconButton(
                                    icon: Icon(
                                        color: Colors.white,
                                        size: 20,
                                        passwordVisible
                                            ? Icons.visibility_off
                                            : Icons.visibility),
                                    onPressed: () {
                                      setState(() {
                                        passwordVisible = !passwordVisible;
                                      });
                                    },
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        BuildCheckbox(
                          isCheck: _isAutoLogin,
                          hintText: 'Auto Login',
                          method: () {
                            setState(() {
                              _isAutoLogin = !_isAutoLogin;
                            });
                          },
                        ),
                        Padding(padding: EdgeInsets.only(left: 10)),
                        BuildCheckbox(
                          isCheck: _isIdSaved,
                          hintText: 'Remember me',
                          method: () {
                            setState(() {
                              _isIdSaved = !_isIdSaved;
                            });
                          },
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.fromLTRB(20, 30, 20, 0),
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          foregroundColor: Color(0xFF3668FF),
                          backgroundColor: Colors.white,
                          textStyle: TextStyle(fontSize: 30),
                          shape: StadiumBorder(),
                          minimumSize: Size.fromHeight(55)),
                      child: Text('LOGIN'),
                      onPressed: () {
                        login(context);
                      },
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  // user Widget
  BuildTextFieldTheme(Widget widget) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 15, vertical: 5),
      clipBehavior: Clip.antiAlias,
      decoration: ShapeDecoration(
        color: Colors.white.withOpacity(0.20000000298023224),
        shape: RoundedRectangleBorder(
          side: BorderSide(
            width: 0.50,
            color: Colors.white,
          ),
          borderRadius: BorderRadius.circular(7),
        ),
      ),
      child: widget,
    );
  }
}

enum TextCase {
  upper,
  lower,
}

class BuildTextField extends StatefulWidget {
  const BuildTextField({
    super.key,
    required this.controller,
    required this.keyboardType,
    required this.hintText,
    this.method,
    this.obscureText = false,
    this.textCase,
  });

  final TextEditingController controller;
  final TextInputType keyboardType;
  final String hintText;
  final VoidCallback? method;
  final bool? obscureText;
  final TextCase? textCase;

  @override
  State<BuildTextField> createState() => _BuildTextFieldState();
}

class _BuildTextFieldState extends State<BuildTextField> {
  CaseType() {
    switch (widget.textCase!) {
      case TextCase.upper:
        return UpperCaseTextFormatter();
      case TextCase.lower:
        return LowerCaseTextFormatter();
    }
  }

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: widget.controller,
      onSubmitted: (value) {
        if (widget.method != null) {
          widget.method!();
        }
      },
      decoration: InputDecoration(
        hintText: widget.hintText,
        hintStyle: TextStyle(color: Colors.white),
        border: InputBorder.none,
      ),
      cursorColor: Colors.white,
      style: TextStyle(color: Colors.white),
      keyboardType: widget.keyboardType,
      obscureText: widget.obscureText!,
      textInputAction: TextInputAction.next,
      inputFormatters: [
        if (widget.textCase != null) CaseType(),
      ],
    );
  }
}

class BuildCheckbox extends StatefulWidget {
  const BuildCheckbox({
    super.key,
    required this.isCheck,
    required this.hintText,
    required this.method,
  });

  final bool isCheck;
  final String hintText;
  final VoidCallback method;

  @override
  State<BuildCheckbox> createState() => _BuildCheckboxState();
}

class _BuildCheckboxState extends State<BuildCheckbox> {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Checkbox(
          value: widget.isCheck,
          onChanged: (value) {
            widget.method();
          },
          checkColor: Color(0xFF3668FF),
          activeColor: Colors.white,
          fillColor: MaterialStateColor.resolveWith(
                (Set<MaterialState> states) {
              return Colors.white;
            },
          ),
        ),
        GestureDetector(
          onTap: () {
            widget.method();
          },
          child: Text(
            widget.hintText,
            style: TextStyle(color: Colors.white),
          ),
        ),
      ],
    );
  }
}