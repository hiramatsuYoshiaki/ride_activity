import 'package:flutter/material.dart';
import 'package:email_validator/email_validator.dart';
import '../model/status.dart';
import 'header_widget.dart';

class RegisterForm extends StatefulWidget {
  const RegisterForm(
      {required this.email,
      required this.displayName,
      required this.password,
      required this.registerAccount,
      required this.setLoginState,
      Key? key})
      : super(key: key);
  final String email;
  final String displayName;
  final String password;
  final void Function(String email, String displayName, String password)
      registerAccount;
  final void Function(ApplicationLoginState status) setLoginState;

  @override
  _RegisterFormState createState() => _RegisterFormState();
}

class _RegisterFormState extends State<RegisterForm> {
  final _formKey = GlobalKey<FormState>(debugLabel: '_RegisterFormState');
  final _emailController = TextEditingController();
  final _displayNameController = TextEditingController();
  final _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: const [
              HeaderAuthWidget(
                  title: 'ACCOUNT',
                  img: 'undraw_Add_user_re_5oib.png',
                  subTitle: 'アカウントを作成しましょう。',
                  discription: 'メールアドレス、アカウント名、パスワードを入力してください。')
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 32),
                  child: TextFormField(
                    controller: _emailController,
                    decoration: const InputDecoration(
                      labelText: 'メールアドレス',
                      hintText: 'メールアドレスを入力してください',
                      // helperText: 'メールアドレス必須'
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
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 32),
                  child: TextFormField(
                    controller: _displayNameController,
                    decoration: const InputDecoration(
                      labelText: 'アカウント名',
                      hintText: 'アカウント名を入力してください',
                      // helperText: '必須'
                    ),
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'アカウント名は必須です';
                      }
                      if (value.length > 21) {
                        return 'アカウント名は２０文字以内です';
                      }
                      return null;
                    },
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 32),
                  child: TextFormField(
                    controller: _passwordController,
                    decoration: const InputDecoration(
                        labelText: 'パスワード',
                        hintText: 'パスワードを入力してください',
                        helperText: '8文字以上、大文字と数字を1つ以上使ってください'),
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
                    },
                  ),
                ),
                const SizedBox(height: 32),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 32),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      ElevatedButton(
                          onPressed: () {
                            widget
                                .setLoginState(ApplicationLoginState.loggedOut);
                          },
                          child: const Text('キャンセル')),
                      const SizedBox(width: 16),
                      ElevatedButton(
                          onPressed: () {
                            if (_formKey.currentState!.validate()) {
                              widget.registerAccount(
                                _emailController.text,
                                _displayNameController.text,
                                _passwordController.text,
                              );
                            }
                          },
                          child: const Text('アカウント作成')),
                      const SizedBox(width: 30),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
