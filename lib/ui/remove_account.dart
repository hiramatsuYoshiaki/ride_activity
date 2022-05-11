import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:ride_activity/model/status.dart';
import 'header_widget.dart';

class RemoveAccount extends StatefulWidget {
  const RemoveAccount({
    Key? key,
    required this.user,
    required this.setProfileState,
    required this.accountDelete,
  }) : super(key: key);
  final User? user;
  final void Function(ProfileState status) setProfileState;
  final void Function() accountDelete;
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
        const SizedBox(height: 32),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 32),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(
                  onPressed: () {
                    widget.setProfileState(ProfileState.display);
                  },
                  child: Text('キャンセル')),
              const SizedBox(width: 16),
              ElevatedButton(
                  onPressed: () {
                    print('push button account delete');
                    widget.accountDelete();
                  },
                  child: Text('アカウント削除'))
            ],
          ),
        )
      ],
    );
  }
}
