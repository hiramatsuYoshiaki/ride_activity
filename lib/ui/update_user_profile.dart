import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

class UpdateUserProfile extends StatefulWidget {
  const UpdateUserProfile({Key? key}) : super(key: key);
  // final User user;

  @override
  _UpdateUserProfileState createState() => _UpdateUserProfileState();
}

class _UpdateUserProfileState extends State<UpdateUserProfile> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: const Text('update user profile'),
    );
  }
}
