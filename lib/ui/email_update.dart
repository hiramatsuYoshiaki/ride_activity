import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:ride_activity/model/status.dart';

class EmailUpdate extends StatefulWidget {
  const EmailUpdate({
    Key? key,
    required this.user,
    required this.setProfileState,
  }) : super(key: key);
  final User? user;
  final void Function(ProfileState status) setProfileState;
  @override
  _EmailUpdateState createState() => _EmailUpdateState();
}

class _EmailUpdateState extends State<EmailUpdate> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text('EmailUpdate'),
        ElevatedButton(
            onPressed: () {
              widget.setProfileState(ProfileState.display);
            },
            child: Text('変更')),
      ],
    );
  }
}
