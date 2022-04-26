import 'package:flutter/material.dart';
import 'package:email_validator/email_validator.dart';
import 'header_widget.dart';
import '../model/status.dart';
import '../pages/home.dart';

class PasswordForm extends StatefulWidget {
  const PasswordForm(
      {required this.email,
      required this.login,
      required this.setLoginState,
      Key? key})
      : super(key: key);
  final String email;
  final void Function(String email, String password) login;
  final void Function(ApplicationLoginState status) setLoginState;
  @override
  _PasswordFormState createState() => _PasswordFormState();
}

class _PasswordFormState extends State<PasswordForm> {
  final _formKey = GlobalKey<FormState>(debugLabel: '_PasswordFormState');
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _emailController.text = widget.email;
  }

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
                  title: 'LOGIN',
                  img: 'undraw_My_password_re_ydq7.png',
                  subTitle: 'パスワードを確認します。',
                  discription: 'パスワードを入力してください。')
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(8),
          child: Form(
              key: _formKey,
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 16),
                      child: Column(
                        children: [
                          TextFormField(
                            enabled: false,
                            controller: _emailController,
                            decoration: InputDecoration(
                              labelText: 'メールアドレス',
                              hintText: 'メールアドレスを入力してください',
                            ),
                            validator: (value) {
                              if (value!.isEmpty) {
                                return 'メールアドレスは必須です';
                              }
                              if (!EmailValidator.validate(value)) {
                                return 'メールの形式が正しくありません';
                              }
                            },
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(16),
                      child: TextFormField(
                        controller: _passwordController,
                        decoration: const InputDecoration(
                          labelText: 'パスワード',
                          hintText: 'パスワードを入力してください',
                          helperText: '8文字以上、大文字と数字を1つ以上使ってください',
                        ),
                        // obscureText: true,
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'パスワードは必須です';
                          }
                          String pattern1 = r'^[a-zA-Z0-9.?/-]{8,}$';
                          RegExp regExp1 = RegExp(pattern1);
                          if (!regExp1.hasMatch(value)) {
                            return '8文字以上の英数字を入力してください';
                          }
                          String pattern2 = r'(?=.*[A-Z])';
                          RegExp regExp2 = RegExp(pattern2);
                          if (!regExp2.hasMatch(value)) {
                            return '少なくとも大文字を1つ以上使ってください';
                          }
                          String pattern3 = r'(?=.*[0-9])';
                          RegExp regExp3 = RegExp(pattern3);
                          if (!regExp3.hasMatch(value)) {
                            return '少なくとも数字を1つ以上使ってください';
                          }
                          return null;
                        },
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 16),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          ElevatedButton(
                              onPressed: () {
                                widget.setLoginState(
                                    ApplicationLoginState.loggedOut);
                              },
                              child: const Text('キャンセル')),
                          const SizedBox(width: 16),
                          ElevatedButton(
                            onPressed: () {
                              if (_formKey.currentState!.validate()) {
                                widget.login(
                                  _emailController.text,
                                  _passwordController.text,
                                );
                              }
                            },
                            child: const Text('ログイン'),
                          ),
                          const SizedBox(width: 30),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 16),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          TextButton(
                            onPressed: () {
                              // if (_formKey.currentState!.validate()) {
                              //   widget.login(
                              //     _emailController.text,
                              //     _passwordController.text,
                              //   );
                              // }
                              widget.setLoginState(
                                  ApplicationLoginState.passReset);
                            },
                            child: const Text('パスワードリセット'),
                          ),
                          const SizedBox(width: 30),
                        ],
                      ),
                    ),
                  ])),
        ),
      ],
    );
  }
}
