import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
// import 'package:ride_activity/model/status.dart';
import 'package:webviewx/webviewx.dart';

import '../model/rider_activity.dart';
import '../application_state.dart';
import '../model/status.dart';
import 'package:intl/intl.dart';
import 'package:image_picker_web/image_picker_web.dart';
import 'dart:html' as html;

import 'package:mime_type/mime_type.dart';
import 'package:path/path.dart' as Path;
// import 'package:path/path.dart';

//del
import 'package:firebase_storage/firebase_storage.dart';
import 'package:firebase_core/firebase_core.dart';

class ActivityDone extends StatefulWidget {
  const ActivityDone({
    Key? key,
    required this.setActivityState,
    required this.selectedActivity,
    required this.setActual,
  }) : super(key: key);
  final void Function(ActivityState status) setActivityState;
  final Activities selectedActivity;
  final void Function(String rideLinkURL, DateTime rideDate,
      List<MediaInfo> ridePhotos, bool rideDone, String id) setActual;
  // final void Function(String rideLinkURL, DateTime rideDate,
  //     List<Image> ridePhotos, bool rideDone) setActual;
  // final void Function(String rideLinkURL, DateTime rideDate,
  //     List<Uint8List> ridePhotos, bool rideDone) setActual;
  //
  //imagePickerWeb
  // html.File _cloudFile;
  // var _fileBytes;
  // Image _imageWidget;

  @override
  _ActivityDoneState createState() => _ActivityDoneState();
}

class _ActivityDoneState extends State<ActivityDone> {
  MediaInfo? _imageInfo;
  // html.File? _cloudFile;
  // var _fileBytes;
  // Image? _imageWidget;
  // late html.File _cloudFile;
  // var _fileBytes;
  // late Image _imageWidget;
  late WebViewXController webviewController;
  final _formKey = GlobalKey<FormState>(debugLabel: '_ActivityDoneState');
  // final _distanceController = TextEditingController();
  TextEditingController _dateController = TextEditingController();
  TextEditingController _timeController = TextEditingController();
  // final _avelageController = TextEditingController();
  // final _elevationController = TextEditingController();
  final _rideURLController = TextEditingController();
  // final _ridePhotosController = TextEditingController();
  // List<String> _ridePhotos = [
  //   'img8360.jpg',
  //   'img8372.jpg',
  //   'img8414.jpg',
  //   'img8426.jpg',
  //   'img8438.jpg',
  //   'img8447.jpg',
  // ];
  @override
  void dispose() {
    webviewController.dispose();
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
    // _activityTitleController.text =
    //     widget.selectedActivity.plan.activityTitle.toString();
    _dateController.text =
        DateFormat('yyyy年M月d日').format(widget.selectedActivity.plan.date);
    _timeController.text =
        DateFormat('h時m分').format(widget.selectedActivity.plan.date);
    // _distanceController.text = widget.selectedActivity.plan.distance.toString();
    // _startPointController.text =
    //     widget.selectedActivity.plan.startPoint.toString();
    // _wayPointController.text = widget.selectedActivity.plan.wayPoint.toString();
    // _finishPointController.text =
    //     widget.selectedActivity.plan.finishPoint.toString();
    // _couseURLController.text = widget.selectedActivity.plan.couseURL.toString();
    // _rideTypeController.text = widget.selectedActivity.plan.rideType.toString();
    // _prefactureItemController.text = '';
    // _tagItemController.text = '';

    // _ridePhotosController.text = '';
    // _rideURLController.text = '';
  }

  DateTime _date = DateTime.now();
  Future<Null> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
        context: context,
        initialDate: _date,
        firstDate: DateTime(2020),
        lastDate: DateTime.now().add(const Duration(days: 360)));
    if (picked != null) setState(() => _date = picked);
    // _dateController.text = DateFormat('yyyy年M月d日 hh時mm分').format(_date);
    _dateController.text = DateFormat('yyyy年M月d日').format(_date);
  }

  TimeOfDay _time = TimeOfDay.now();

  Future<Null> _selectTime(BuildContext context) async {
    final TimeOfDay? picked = await showTimePicker(
      context: context,
      initialTime: _time,
    );
    if (picked != null) setState(() => _time = picked);

    _timeController.text = DateFormat('h時m分').format(
        DateTime(_date.year, _date.month, _date.day, _time.hour, _time.minute));
  }

  final _pickedImages = <Image>[];
  final _pickedImagesInfo = <MediaInfo>[];
  // final _pickedbytes = <Uint8List>[];
  // final _pickedVideos = <dynamic>[];
  // String _imageInfo = '';
  // Future<void> _pickImage() async {
  //   final fromPicker = await ImagePickerWeb.getImageAsWidget();
  //   if (fromPicker != null) {
  //     setState(() {
  //       _pickedImages.clear();
  //       _pickedImages.add(fromPicker);
  //     });
  //   }
  // }

  uploadFile(MediaInfo mediaInfo, String ref, String fileName) {
    print('uploadFile');
    // try {
    //   String mimeType = mime(basename(mediaInfo.fileName));
    //   var metaData = UploadMetadata(contentType: mimeType);
    //   StorageReference storageReference = storage().ref(ref).child(fileName);

    //   UploadTask uploadTask = storageReference.put(mediaInfo.data, metaData);
    //   var imageUri;
    //   uploadTask.future.then((snapshot) => {
    //         Future.delayed(Duration(seconds: 1)).then((value) => {
    //               snapshot.ref.getDownloadURL().then((dynamic uri) {
    //                 imageUri = uri;
    //                 print('Download URL: ${imageUri.toString()}');
    //               })
    //             })
    //       });
    // } catch (e) {
    //   print('File Upload Error: $e');
    // }
  }

  imagePicker() {
    print('imagePicker');
    // return ImagePickerWeb.getImageInfo.then((MediaInfo mediaInfo) {
    //   uploadFile(mediaInfo, 'images', mediaInfo.fileName);
    // });
  }

  Future<void> _pickImage() async {
    //MediaInfo type
    var fileInfo = await ImagePickerWeb.getImageInfo; //get image
    if (fileInfo?.data == null) return; // user did not choose image.
    setState(() {
      _imageInfo = fileInfo; // save image
      // print('fileName: ${fileInfo!.fileName}');
      _pickedImagesInfo.add(fileInfo!);
    });
  }

  Future<void> _pickMultiImages() async {
    final images = await ImagePickerWeb.getMultiImagesAsWidget();
    setState(() {
      _pickedImages.clear();
      if (images != null) _pickedImages.addAll(images);
    });
  }
  // firebase strage upload putData---------------------------------------
  // Future<void> _uploadImage() async {
  //   // print('uploadImage');
  //   if (_imageInfo == null) return;
  //   final firebaseStorageLocation =
  //       FirebaseStorage.instance.ref().child('images');
  //   final imageInfo = _imageInfo as MediaInfo;
  //   _imageInfo as MediaInfo;
  //   final firebasefileLocation = firebaseStorageLocation
  //       .child('${DateTime.now()}_${imageInfo.fileName!}');
  //   await firebasefileLocation.putData(
  //       imageInfo.data!,
  //       SettableMetadata(
  //         contentType: "image/jpeg",
  //         customMetadata: {
  //           "location": "Yosemite, CA, USA",
  //           "activity": "Hiking",
  //         },
  //       ));
  //   final urlToUseLater = await firebasefileLocation.getDownloadURL();
  //   print('urlToUseLater $urlToUseLater');
  // }

  // Future<void> _getMultipleImageInfos() async {
  //   print('getMultipleImageInfos');
  //   var mediaData = await ImagePickerWeb.getImageInfo;
  //   print('mediaData runtimeType: ${mediaData.runtimeType}');
  //   print(mediaData.toString());
  //   print('fileName: ${mediaData!.fileName}');
  //   String? mimeType = mime(Path.basename(mediaData.fileName.toString()));
  //   print('mimeType: $mimeType');

  //   print('mediaData runtimeType: ${mediaData.data.runtimeType}');
  //   print('mediaData: ${mediaData.data}');
  //   List<int> imageBytes = [];
  //   imageBytes.addAll(mediaData.data!.toList());

  //   html.File mediaFile = html.File(
  //       imageBytes, mediaData.fileName.toString(), {'type': mimeType});
  //   print(mediaFile.lastModified);
  //   print(mediaFile.lastModifiedDate);
  //   print(mediaFile.name);
  //   print(mediaFile.relativePath);

  //   if (mediaFile != null) {
  //     setState(() {
  //       _cloudFile = mediaFile;
  //       _fileBytes = mediaData.data;
  //       _imageWidget = Image.memory(mediaData.data!);
  //     });
  //   }
  //   print('_cloudFile:  $_cloudFile');
  //   print('_fileBytes:  $_fileBytes');
  //   print('_imageWidget:  $_imageWidget');
  // }

  @override
  Widget build(BuildContext context) {
    return Consumer<ApplicationState>(
        builder: (BuildContext context, appState, _) => SingleChildScrollView(
                child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Container(
                    padding: const EdgeInsets.all(10.0),
                    // child: Consumer<ApplicationState>(
                    //     builder: (BuildContext context, appState, _) =>
                    //         _buildWebViewX(appState.selectActivity)
                    // )
                    child: _buildWebViewX(appState.selectActivity)),
                SizedBox(height: 16),
                Form(
                    key: _formKey,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        const Padding(
                          padding: EdgeInsets.symmetric(horizontal: 32),
                          child: Text('実走データ'),
                        ),
                        Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 32),
                            child: TextFormField(
                              // keyboardType: TextInputType.number,
                              // inputFormatters: <TextInputFormatter>[FilteringTextInputFormatter.digitsOnly],
                              controller: _rideURLController,
                              decoration: const InputDecoration(
                                labelText: 'Garmin Connectの共有リンクアドレス',
                                hintText:
                                    "<iframe src='https://connect.garmin.com/modern/activity/embed/0000000000' title='河津桜ライド2022' width='465' height='500' frameborder='0'></iframe>",
                                //<iframe src='https://connect.garmin.com/modern/activity/embed/8442710466' title='河津桜ライド2022' width='465' height='500' frameborder='0'></iframe>
                              ),
                              validator: (value) {
                                if (value!.isEmpty) {
                                  return '共有リンクアドレスは必須です';
                                }
                                String pattern2 =
                                    r'^<iframe[^>]*>\s*<\/iframe>';
                                // String pattern2 = r'/^<iframe[^>]*>\s*<\/iframe>/';
                                RegExp regExp2 = RegExp(pattern2);
                                if (!regExp2.hasMatch(value)) {
                                  return 'コース追加のコードを入力してください';
                                }
                                return null;
                              },
                            )),
                        const SizedBox(height: 16),
                        const Padding(
                          padding: EdgeInsets.symmetric(horizontal: 32),
                          child: Text('実走スタート時間'),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 32),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Expanded(
                                  flex: 8,
                                  child: TextFormField(
                                    enabled: false,
                                    controller: _dateController,
                                    decoration: const InputDecoration(
                                      labelText: '日付',
                                      hintText: '日付を入力してください',
                                      // helperText: '必須'
                                    ),
                                    validator: (value) {
                                      if (value!.isEmpty) {
                                        return '日付は必須です';
                                      }
                                      return null;
                                    },
                                  )),
                              Expanded(
                                  flex: 2,
                                  child: ElevatedButton(
                                    onPressed: () => _selectDate(context),
                                    child: const Text('日付選択'),
                                  ))
                            ],
                          ),
                        ),
                        const SizedBox(height: 8),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 32),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Expanded(
                                  flex: 8,
                                  child: TextFormField(
                                    enabled: false,
                                    controller: _timeController,
                                    decoration: const InputDecoration(
                                      labelText: '時刻',
                                      hintText: '時刻を入力してください',
                                    ),
                                    validator: (value) {
                                      if (value!.isEmpty) {
                                        return '時刻は必須です';
                                      }
                                      return null;
                                    },
                                  )),
                              Expanded(
                                  flex: 2,
                                  child: ElevatedButton(
                                    onPressed: () => _selectTime(context),
                                    child: const Text('時刻選択'),
                                  ))
                            ],
                          ),
                        ),
                        const SizedBox(height: 8),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 32),
                          // child: Expanded(child:
                          //     Wrap(
                          //       children: <Widget>[
                          //   SizedBox(
                          //     width: 500,
                          //     height: 200,
                          //     child: ListView.builder(
                          //         scrollDirection: Axis.horizontal,
                          //         itemCount: _pickedImages.length,
                          //         itemBuilder: (_, index) =>
                          //             _pickedImages[index]),
                          // )])),

                          child: _pickedImagesInfo.isNotEmpty
                              ? Container(
                                  padding: const EdgeInsets.all(4),
                                  decoration: BoxDecoration(
                                    border: Border.all(color: Colors.grey),
                                    borderRadius: BorderRadius.circular(4),
                                  ),
                                  width: double.infinity,
                                  child: Wrap(
                                    alignment: WrapAlignment.center,
                                    direction: Axis.horizontal,
                                    runSpacing: 8,
                                    spacing: 8,
                                    // children: _pickedImages
                                    //     .map((img) => SizedBox(
                                    //         width: 300,
                                    //         height: 200,
                                    //         child: Container(
                                    //             decoration: BoxDecoration(
                                    //               border: Border.all(
                                    //                   color: Colors.grey),
                                    //               borderRadius:
                                    //                   BorderRadius.circular(4),
                                    //             ),
                                    //             child: img)))
                                    //     .toList(),
                                    // children: _pickedImages
                                    //     .map(
                                    //       (img) => CircleAvatar(
                                    //         // backgroundImage: NetworkImage('$img'),
                                    //         // backgroundImage: NetworkImage('$img'),
                                    //         backgroundImage: img.image,
                                    //         minRadius: 50,
                                    //         maxRadius: 50,
                                    //         // child: img,
                                    //       ),
                                    //     )
                                    //     .toList(),

                                    children: _pickedImagesInfo
                                        .map(
                                          (img) => CircleAvatar(
                                            backgroundImage:
                                                MemoryImage(img.data!),
                                            minRadius: 50,
                                            maxRadius: 50,
                                          ),
                                        )
                                        .toList(),
                                    // children: [
                                    //   Container(
                                    //     child: _pickedImagesInfo.isNotEmpty
                                    //         ?
                                    //         : Text('画像が選択されていません'),
                                    //     // _pickedImagesInfo
                                    //     //     .map((img) => Image.memory(
                                    //     //           img.data!,
                                    //     //           width: 180,
                                    //     //         ))
                                    //     //     .toList(),
                                    //   )
                                    // ],

                                    // children: _pickedImages
                                    //     .map(
                                    //       (img) => CircleAvatar(
                                    //         radius: 50.0,
                                    //         child: ClipRRect(
                                    //           // child: Image.asset('profile-generic.png'),
                                    //           child: img,
                                    //           // Image(image: MemoryImage(Uint8List#a9e19, scale: 1), frameBuilder: null, loadingBuilder: null, alignment: Alignment.center, this.excludeFromSemantics: false, filterQuality: low)
                                    //           borderRadius:
                                    //               BorderRadius.circular(100.100),
                                    //         ),
                                    //       ),
                                    //     )
                                    //     .toList(),
                                    // children: _pickedImages
                                    //     .map((img) =>
                                    //         // ClipOval(
                                    //         //       child: SizedBox.fromSize(
                                    //         //         size: Size.fromRadius(
                                    //         //             48), // Image radius
                                    //         //         child: img,
                                    //         //       ),
                                    //         //     )
                                    //         Container(
                                    //           padding:
                                    //               EdgeInsets.all(8), // Border width
                                    //           // decoration: BoxDecoration(
                                    //           //     color: Colors.red,
                                    //           //     shape: BoxShape.circle),
                                    //           child: ClipOval(
                                    //             child: SizedBox.fromSize(
                                    //               size: Size.fromRadius(
                                    //                   48), // Image radius
                                    //               child: img,
                                    //             ),
                                    //           ),
                                    //         ))
                                    //     .toList(),
                                  ))
                              : const Text('画像を選択してください'),
                        ),
                        const SizedBox(height: 8),
                        Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 32),
                            child: Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  //ImagePickerWeb.getMultiImagesAsWidget useing
                                  // ElevatedButton(
                                  //   onPressed:
                                  //       // () {},
                                  //       _pickMultiImages,
                                  //   child: const Text('Select Multi Images'),
                                  // ),
                                  // const SizedBox(width: 16),
                                  ElevatedButton(
                                      onPressed: _pickImage,
                                      child: Text('画像を選択')),
                                  const SizedBox(width: 16),
                                  // ElevatedButton(
                                  //     onPressed: _imageInfo == null
                                  //         ? null
                                  //         : _uploadImage,
                                  //     // onPressed: () {},
                                  //     child: Text('画像を追加')),
                                  // const SizedBox(width: 16),

                                  // const SizedBox(width: 16),
                                  // ElevatedButton(
                                  //   onPressed:
                                  //       //() {},
                                  //       _getMultipleImageInfos,
                                  //   child: const Text(
                                  //       'Select Multi Images with Infos'),
                                  // ),
                                  const SizedBox(width: 16),
                                ])),
                        const SizedBox(height: 32),
                        // Container(
                        //   child: _imageInfo != null
                        //       ? Image.memory(
                        //           _imageInfo!.data!,
                        //           width: 180,
                        //         )
                        //       : const Text('画像が選択されていません'),
                        // ),
                        // Container(
                        //     child: _imageWidget ?? const Text('画像が選択されていません')),
                        // const SizedBox(height: 32),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 32),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              ElevatedButton(
                                  onPressed: () {
                                    widget.setActivityState(
                                        ActivityState.display);
                                  },
                                  child: const Text('キャンセル')),
                              const SizedBox(width: 16),
                              ElevatedButton(
                                  onPressed: () {
                                    if (_formKey.currentState!.validate()) {
                                      // widget.registerAccount(
                                      //   _emailController.text,
                                      //   _displayNameController.text,
                                      //   _passwordController.text,
                                      // );

                                      print(_rideURLController.text);
                                      var strArrey = _rideURLController.text
                                          .split(RegExp(r"\s"));
                                      var url = '';
                                      strArrey
                                          .asMap()
                                          .forEach((int i, String value) {
                                        // print('Index: $i --> Value: $value');
                                        // <iframe src='https://connect.garmin.com/modern/activity/embed/8442710466' title='河津桜ライド2022' width='465' height='500' frameborder='0'></iframe>
                                        String pattern5 =
                                            r'https://connect.garmin.com/modern/activity/embed/.*';
                                        RegExp regExp5 = RegExp(pattern5);
                                        if (regExp5.hasMatch(value)) {
                                          // print('match---$value');
                                          url = value;
                                        }
                                      });
                                      var rideLinkURL = url.split(RegExp(r"'"));
                                      // print(rideLinkURL);
                                      // print(rideLinkURL[1]);
                                      DateTime rideDate = DateTime(
                                          _date.year,
                                          _date.month,
                                          _date.day,
                                          _time.hour,
                                          _time.minute);
                                      // print('_pickedImages');
                                      // print('_pickedImages');
                                      // print(_pickedImages);
                                      // print('_pickedbytes: $_pickedbytes');

                                      // print(
                                      //     'widget.selectedActivity: ${widget.selectedActivity.id}');

                                      widget.setActual(
                                          rideLinkURL[1],
                                          rideDate,
                                          _pickedImagesInfo,
                                          true,
                                          widget.selectedActivity.id);
                                    }
                                  },
                                  child: const Text('実走済み')),
                              const SizedBox(width: 30),
                            ],
                          ),
                        ),
                      ],
                    ))

                // ElevatedButton(
                //     onPressed: () {
                //       widget.setActual();
                //     },
                //     child: Text('done')),
                // SizedBox(height: 8),
                // ElevatedButton(
                //     onPressed: () {
                //       widget.setActivityState(ActivityState.display);
                //     },
                //     child: Text('Cancel')),
              ],
            )));
  }

  Widget _buildWebViewX(Activities selectedActivityData) {
    return WebViewX(
      key: const ValueKey('webviewx'),
      initialContent: selectedActivityData.plan.couseURL,
      initialSourceType: SourceType.url,
      height: 500,
      width: 500,
      onWebViewCreated: (controller) => webviewController = controller,
    );
  }
}
