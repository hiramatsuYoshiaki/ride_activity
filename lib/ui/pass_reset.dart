import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'header_widget.dart';
import '../model/status.dart';
import '../pages/home.dart';

class PassReset extends StatefulWidget {
  const PassReset(
      {Key? key,
      required this.email,
      required this.passReset,
      required this.setLoginState})
      : super(key: key);
  final String email;
  final void Function(String email) passReset;
  final void Function(ApplicationLoginState status) setLoginState;

  @override
  _PassResetState createState() => _PassResetState();
}

class _PassResetState extends State<PassReset> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              HeaderAuthWidget(
                  title: 'PASSWORD RESET',
                  img: 'undraw_Forgot_password_re_hxwm.png',
                  subTitle: '${widget.email}',
                  discription: 'パスワードリセット'),
              // const SizedBox(height: 16),
              Padding(
                padding: EdgeInsets.symmetric(vertical: 16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      '１．ボタン［送信］を押してください。',
                      style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w600,
                          color: Colors.grey[800]),
                    ),
                    Padding(
                      padding: EdgeInsets.only(left: 36),
                      child: Text(
                        'パスワードリセットメールを送信します。',
                        style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w400,
                            color: Colors.grey[500]),
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(vertical: 16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      '２．メールを開いてください。',
                      style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w600,
                          color: Colors.grey[800]),
                    ),
                    Padding(
                      padding: EdgeInsets.only(left: 36),
                      child: Text(
                        'Reset your password for project....',
                        style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w400,
                            color: Colors.grey[500]),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(left: 36),
                      child: Text(
                        'メールアプリで送信されたメール開いてください。',
                        style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w400,
                            color: Colors.grey[500]),
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(vertical: 16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      '３．リンクをクリックしてください',
                      style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w600,
                          color: Colors.grey[800]),
                    ),
                    Padding(
                      padding: EdgeInsets.only(left: 36),
                      child: Text(
                        'https://ride-activity.firebaseapp.com/__/auth/action?.........',
                        style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w400,
                            color: Colors.grey[500]),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(left: 36),
                      child: Text(
                        'メールのパスワードリセットするためのリンクアドレスをクリックしてください',
                        style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w400,
                            color: Colors.grey[500]),
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(vertical: 16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      '４．パスワードを入力してください',
                      style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w600,
                          color: Colors.grey[800]),
                    ),
                    Padding(
                      padding: EdgeInsets.only(left: 36),
                      child: Text(
                        'Reset your password',
                        style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w400,
                            color: Colors.grey[500]),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(left: 36),
                      child: Text(
                        '表示されたダイナログの、新しいパスワードを入力して、ボタン［ＳＡＶＥ］を押してください',
                        style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w400,
                            color: Colors.grey[500]),
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(vertical: 16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      '５．完了ダイナログを確認',
                      style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w600,
                          color: Colors.grey[800]),
                    ),
                    Padding(
                      padding: EdgeInsets.only(left: 36),
                      child: Text(
                        'Password changed You can now sign in with your new password',
                        style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w400,
                            color: Colors.grey[500]),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(left: 36),
                      child: Text(
                        'パスワード変更の完了メッセージを確認します。',
                        style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w400,
                            color: Colors.grey[500]),
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(vertical: 16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      '６．ログインする',
                      style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w600,
                          color: Colors.grey[800]),
                    ),
                    Padding(
                      padding: EdgeInsets.only(left: 36),
                      child: Text(
                        'アプリケーションに戻って、新しいパスワードで、再度ログインします。',
                        style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w400,
                            color: Colors.grey[500]),
                      ),
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 32),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  ElevatedButton(
                      onPressed: () {
                        widget.setLoginState(ApplicationLoginState.loggedOut);
                      },
                      child: const Text('キャンセル')),
                  SizedBox(
                    width: 16,
                  ),
                  ElevatedButton(
                      onPressed: () {
                        widget.passReset(widget.email);
                      },
                      child: const Text('送信')),
                ],
              ),

              const SizedBox(height: 32),
            ],
          ),
        ),
      ],
    );
  }
}
