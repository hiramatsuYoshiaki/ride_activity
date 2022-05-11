import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:ride_activity/model/status.dart';
import 'header_widget.dart';

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
        // Text('PhotourlUpdate'),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              HeaderAuthWidget(
                  title: 'Aveter Update',
                  img: 'undraw_female_avatar_w3jk.png',
                  // img: 'undraw_male_avatar_323b.png',
                  subTitle: 'アバター変更',
                  discription: '新しいアバターを選択してください')
            ],
          ),
        ),
        Padding(
            padding: EdgeInsets.symmetric(horizontal: 32),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                ElevatedButton(
                    onPressed: () {
                      widget.setProfileState(ProfileState.display);
                    },
                    child: Text('キャンセル')),
                const SizedBox(width: 16),
                ElevatedButton(
                    onPressed: () {
                      widget.setProfileState(ProfileState.display);
                    },
                    child: const Text('アバター変更')),
              ],
            )),
      ],
    );
  }
}
