import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:ride_activity/model/status.dart';
import 'header_widget.dart';

class RemoveAccount extends StatefulWidget {
  const RemoveAccount({
    Key? key,
    required this.user,
    required this.setProfileState,
  }) : super(key: key);
  final User? user;
  final void Function(ProfileState status) setProfileState;
  @override
  _RemoveAccountState createState() => _RemoveAccountState();
}

class _RemoveAccountState extends State<RemoveAccount> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // Text('RemoveAccount'),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              HeaderAuthWidget(
                  title: 'Remove Account',
                  img: 'undraw_Cancel_re_pkdm.png',
                  subTitle: 'アカウント削除',
                  discription: 'アカウントを削除します')
            ],
          ),
        ),
        ElevatedButton(
            onPressed: () {
              widget.setProfileState(ProfileState.display);
            },
            child: Text('削除')),
      ],
    );
  }
}
