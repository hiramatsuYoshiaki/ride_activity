import 'package:flutter/material.dart';
import 'package:email_validator/email_validator.dart';
import '../model/status.dart';
import 'header_widget.dart';

class EmailForm extends StatefulWidget {
  const EmailForm(
      {
      // required this.email,
      // required this.password,
      required this.setLoginState,
      required this.verifyEmail,
      Key? key});

  // final String email;
  // final String password;

  final void Function(String email) verifyEmail;
  final void Function(ApplicationLoginState status) setLoginState;

  @override
  _EmailFormState createState() => _EmailFormState();
}

class _EmailFormState extends State<EmailForm> {
  final _formKey = GlobalKey<FormState>(debugLabel: '_EmailFromState');
  final _emailController = TextEditingController();
  // final _passwordController = TextEditingController();
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
                  img: 'undraw_Access_account_re_8spm.png',
                  subTitle: 'メールアドレスの確認をします。',
                  discription: 'メールアドレスを入力してください。')
              // HeaderTitleWidget(title: 'LOGIN'),
              // const SizedBox(height: 8),
              // Image.asset(
              //   'assets/undraw_Mobile_login_re_9ntv.png',
              //   fit: BoxFit.fitWidth,
              // ),
              // const SizedBox(height: 8),
            ],
          ),
        ),
        Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: TextFormField(
                    controller: _emailController,
                    decoration: const InputDecoration(
                        labelText: 'メールアドレス', hintText: 'メールアドレスを入力してください'),
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
                const SizedBox(height: 30),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      TextButton(
                        onPressed: () {
                          widget.setLoginState(ApplicationLoginState.register);
                        },
                        child: const Text('アカウント作成'),
                      ),
                      const SizedBox(width: 16),
                      ElevatedButton(
                          onPressed: () {
                            // widget
                            //     .setLoginState(ApplicationLoginState.loggedOut);
                            Navigator.pop(context);
                            // Navigator.of(context).pushNamed("/home");
                            // Navigator.of(context)
                            //     .push(MaterialPageRoute(builder: (context) {
                            //   return HomePage();
                            // }));
                          },
                          child: const Text('キャンセル')),
                      const SizedBox(width: 16),
                      ElevatedButton(
                          onPressed: () {
                            if (_formKey.currentState!.validate()) {
                              widget.verifyEmail(_emailController.text);
                            }
                          },
                          child: const Text('次へ')),
                      const SizedBox(width: 30),
                    ],
                  ),
                ),
                const SizedBox(height: 30),
              ],
            ))
      ],
    );
  }
}
