import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:ride_activity/model/status.dart';
import 'header_widget.dart';
import 'package:email_validator/email_validator.dart';

class EmailUpdate extends StatefulWidget {
  const EmailUpdate({
    Key? key,
    required this.user,
    required this.setProfileState,
    required this.updateEmail,
  }) : super(key: key);
  final User? user;
  final void Function(ProfileState status) setProfileState;
  final void Function(String emailAddress) updateEmail;
  @override
  _EmailUpdateState createState() => _EmailUpdateState();
}

class _EmailUpdateState extends State<EmailUpdate> {
  final _formKey = GlobalKey<FormState>(debugLabel: '_DisplayNameUpdateState');
  final _emailController = TextEditingController();
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
                  title: 'Update E-Mail',
                  img: 'undraw_Email_capture_re_b5ys.png',
                  subTitle: 'メールアドレス変更',
                  discription: '新しいメールアドレスを入力してください')
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
                          hintText: '新しいメールアドレスを入力してください'),
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
                    padding: const EdgeInsets.symmetric(horizontal: 32),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        ElevatedButton(
                            onPressed: () {
                              widget.setProfileState(ProfileState.display);
                            },
                            child: const Text('キャンセル')),
                        const SizedBox(width: 16),
                        ElevatedButton(
                            onPressed: () {
                              if (_formKey.currentState!.validate()) {
                                widget.updateEmail(
                                  _emailController.text,
                                );
                                // widget.setProfileState(ProfileState.display);
                              }
                            },
                            child: Text('変更'))
                      ],
                    ),
                  ),
                ],
              )),
        )
      ],
    );
  }
}
