import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:ride_activity/model/status.dart';
import 'header_widget.dart';
import 'package:email_validator/email_validator.dart';

class DisplayNameUpdate extends StatefulWidget {
  const DisplayNameUpdate({
    Key? key,
    required this.user,
    required this.setProfileState,
    required this.updateDisplayName,
  }) : super(key: key);
  final User? user;
  final void Function(ProfileState status) setProfileState;
  final void Function(String displayName) updateDisplayName;

  @override
  _DisplayNameUpdateState createState() => _DisplayNameUpdateState();
}

class _DisplayNameUpdateState extends State<DisplayNameUpdate> {
  final _formKey = GlobalKey<FormState>(debugLabel: '_DisplayNameUpdateState');
  final _displayNameController = TextEditingController();

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
                  title: 'Update Name',
                  img: 'undraw_Add_user_re_5oib.png',
                  subTitle: 'アカウント名変更',
                  discription: '新しいアカウント名を入力してください')
            ],
          ),
        ),
        Padding(
          padding: EdgeInsets.all(8.0),
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
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
                              // print('On press _displayNameController.text');
                              // print(_displayNameController.text);
                              widget.updateDisplayName(
                                _displayNameController.text,
                              );
                            }
                          },
                          child: const Text('アカウント変更')),
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
