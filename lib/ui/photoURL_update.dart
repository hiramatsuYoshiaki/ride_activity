import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:ride_activity/model/status.dart';

class PhotourlUpdate extends StatefulWidget {
  const PhotourlUpdate({
    Key? key,
    required this.user,
    required this.setProfileState,
  }) : super(key: key);
  final User? user;
  final void Function(ProfileState status) setProfileState;

  @override
  _PhotourlUpdateState createState() => _PhotourlUpdateState();
}

class _PhotourlUpdateState extends State<PhotourlUpdate> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text('PhotourlUpdate'),
        ElevatedButton(
            onPressed: () {
              widget.setProfileState(ProfileState.display);
            },
            child: Text('変更')),
      ],
    );
  }
}
