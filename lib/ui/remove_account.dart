import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:ride_activity/model/status.dart';

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
        Text('RemoveAccount'),
        ElevatedButton(
            onPressed: () {
              widget.setProfileState(ProfileState.display);
            },
            child: Text('変更')),
      ],
    );
  }
}
