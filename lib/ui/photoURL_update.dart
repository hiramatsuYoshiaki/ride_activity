import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:ride_activity/model/status.dart';
import 'dart:async';
import 'dart:io';
import 'package:image_picker/image_picker.dart';
import 'package:flutter/foundation.dart';

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
  // File? _image;
  List<XFile>? _imageFileList;

  void _setImageFileListFromFile(XFile? value) {
    _imageFileList = value == null ? null : <XFile>[value];
  }

  dynamic _pickImageError;
  final ImagePicker _picker = ImagePicker();

  // Future getImageFromCamera() async {
  //   final pickedFile = await picker.getImage(source: ImageSource.camera);

  //   setState(() {
  //     _image = File(pickedFile.path);
  //   });
  // }

  Future getImageFromGallery() async {
    try {
      final XFile? pickedFile = await _picker.pickImage(
        source: ImageSource.gallery,
        // maxWidth: maxWidth,
        // maxHeight: maxHeight,
        // imageQuality: quality,
      );
      setState(() {
        _setImageFileListFromFile(pickedFile);
      });
    } catch (e) {
      setState(() {
        _pickImageError = e;
      });
    }
  }

  Future getImageMultiFromGallery() async {
    try {
      final List<XFile>? pickedFileList = await _picker.pickMultiImage(
          // maxWidth: maxWidth,
          // maxHeight: maxHeight,
          // imageQuality: quality,
          );
      setState(() {
        _imageFileList = pickedFileList;
      });
    } catch (e) {
      setState(() {
        _pickImageError = e;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding:
              const EdgeInsets.only(top: 16, right: 8, left: 8, bottom: 16),
          child: Column(
            children: [
              Text(
                'Aveter Update',
                style: TextStyle(
                    fontSize: 32,
                    fontWeight: FontWeight.w600,
                    color: Colors.blue[600]),
              ),
              const SizedBox(height: 8),
              widget.user!.photoURL == null
                  ? const CircleAvatar(
                      backgroundImage: NetworkImage(
                          'assets/images/undraw_profile_pic_ic5t.png'),
                      minRadius: 50,
                      maxRadius: 80,
                    )
                  : CircleAvatar(
                      backgroundImage: NetworkImage('${widget.user!.photoURL}'),
                      minRadius: 50,
                      maxRadius: 80,
                    ),
              const SizedBox(height: 8),
              Text('アバター変更',
                  style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.w600,
                      color: Colors.grey[600])),
              const SizedBox(height: 8),
              Text('新しいアバターを選択してください',
                  style: TextStyle(fontSize: 16, color: Colors.grey[600])),
              const SizedBox(height: 16),
            ],
          ),
        ),
        Padding(
            padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    // FloatingActionButton(
                    //   // onPressed: getImageFromCamera,
                    //   onPressed: () {},
                    //   tooltip: 'Pick Image From Camera',
                    //   child: const Icon(Icons.add_a_photo),
                    // ),
                    FloatingActionButton(
                      onPressed: getImageFromGallery,
                      tooltip: 'ファイルから画像を選択',
                      child: const Icon(Icons.photo_library),
                    ),
                    FloatingActionButton(
                      onPressed: getImageMultiFromGallery,
                      tooltip: 'ファイルから複数画像を選択',
                      child: const Icon(Icons.library_add),
                    ),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                      alignment: Alignment.center,
                      width: 200,
                      height: 200,
                      child: _imageFileList == null
                          ? Text('画像が選択されてません')
                          : CircleAvatar(
                              backgroundImage:
                                  NetworkImage(_imageFileList![0].path),
                              minRadius: 50,
                              maxRadius: 80,
                            )),
                ),
                // Padding(
                //   padding: const EdgeInsets.all(8.0),
                //   child:
                // _imageFileList == null
                //     ? Text('画像が選択されてません')
                //     :
                // Expanded(
                //     child:
                // ListView.builder(
                // shrinkWrap: true,
                // key: UniqueKey(),
                // itemBuilder: (BuildContext context, int index) {
                // Why network for web?
                // See https://pub.dev/packages/image_picker#getting-ready-for-the-web-platform
                // return kIsWeb
                //     ? Image.network(
                //         _imageFileList![index].path)
                //     : Image.file(
                //         File(_imageFileList![index].path));
                // return Text('${index}');
                //     return Text('aaaaaa');
                //   },
                //   itemCount: _imageFileList!.length,
                // ),
                // ),
                // ),
              ],
            )),
        Padding(
            padding: EdgeInsets.symmetric(horizontal: 8),
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
                    onPressed: _imageFileList != null
                        ? () {
                            widget.setProfileState(ProfileState.display);
                          }
                        : null,
                    child: const Text('アバター変更')),
              ],
            )),
        Padding(
            padding: EdgeInsets.symmetric(horizontal: 8),
            child: Column(children: [
              SizedBox(height: 32),
              Text(' multi image area'),
            ]))
      ],
    );
  }
}
