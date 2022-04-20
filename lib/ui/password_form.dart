import 'package:flutter/material.dart';
import 'package:email_validator/email_validator.dart';
import 'header_widget.dart';

class PasswordForm extends StatefulWidget {
  const PasswordForm({required this.email, Key? key}) : super(key: key);
  final String email;
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
            decoration: InputDecoration(
              labelText: 'パスワード',
              hintText: 'パスワードを入力してください',
              helperText: '8文字以上、大文字と数字を1つ以上使ってください',
            ),
            validator: (value) {
              if (value!.isEmpty) {
                return 'パスワードは必須です';
              }
              if (value != null) {
                String pattern = r'^[a-zA-Z0-9.?/-]{8,}$';
                RegExp regExp = RegExp(pattern);
                if (!regExp.hasMatch(value)) {
                  return '8文字以上の英数字を入力してください';
                }
              }
              if (value != null) {
                String pattern = r'(?=.*[A-Z])';
                RegExp regExp = RegExp(pattern);
                if (!regExp.hasMatch(value)) {
                  return '少なくとも大文字を1つ以上使ってください';
                }
              }
              if (value != null) {
                String pattern = r'(?=.*[0-9])';
                RegExp regExp = RegExp(pattern);
                if (!regExp.hasMatch(value)) {
                  return '少なくとも数字を1つ以上使ってください';
                }
              }
            },
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 16),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              const SizedBox(width: 16),
              ElevatedButton(
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    // widget.login(
                    //   _emailController.text,
                    //   _passwordController.text,
                    // );
                  }
                },
                child: const Text('ログイン'),
              ),
              const SizedBox(width: 30),
            ],
          ),
        ),
        //   ],
        // ),
        // ),
      ],
    );
  }
}
