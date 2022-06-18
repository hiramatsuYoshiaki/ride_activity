import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
// import 'package:ride_activity/model/status.dart';
import 'package:webviewx/webviewx.dart';

import '../model/rider_activity.dart';
import '../application_state.dart';
import '../model/status.dart';
import 'package:intl/intl.dart';
import 'package:image_picker_web/image_picker_web.dart';

class ActivityDone extends StatefulWidget {
  const ActivityDone({
    Key? key,
    required this.setActivityState,
    required this.selectedActivity,
    required this.setActual,
  }) : super(key: key);
  final void Function(ActivityState status) setActivityState;
  final Activities selectedActivity;
  final void Function(DateTime rideDate, List<String> ridePhotos, bool rideDone)
      setActual;

  @override
  _ActivityDoneState createState() => _ActivityDoneState();
}

class _ActivityDoneState extends State<ActivityDone> {
  late WebViewXController webviewController;
  final _formKey = GlobalKey<FormState>(debugLabel: '_ActivityDoneState');
  // final _distanceController = TextEditingController();
  TextEditingController _dateController = TextEditingController();
  TextEditingController _timeController = TextEditingController();
  // final _avelageController = TextEditingController();
  // final _elevationController = TextEditingController();
  final _rideURLController = TextEditingController();
  final _ridePhotosController = TextEditingController();
  List<String> _ridePhotos = [
    'img8360.jpg',
    'img8372.jpg',
    'img8414.jpg',
    'img8426.jpg',
    'img8438.jpg',
    'img8447.jpg',
  ];
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
  // final _pickedVideos = <dynamic>[];
  String _imageInfo = '';
  Future<void> _pickImage() async {
    final fromPicker = await ImagePickerWeb.getImageAsWidget();
    if (fromPicker != null) {
      setState(() {
        _pickedImages.clear();
        _pickedImages.add(fromPicker);
        print(fromPicker);
      });
    }
  }

  Future<void> _pickMultiImages() async {
    final images = await ImagePickerWeb.getMultiImagesAsWidget();
    setState(() {
      _pickedImages.clear();
      if (images != null) _pickedImages.addAll(images);
      print('_pickMultiImages-----------------------------------');
      // print('images');
      // print(images);
      print('_pickedImages');
      print(_pickedImages);
    });
  }

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
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 32),
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
                                return null;
                              },
                            )),
                        const SizedBox(height: 16),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 32),
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

                          child: Container(
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
                                children: _pickedImages
                                    .map(
                                      (img) => CircleAvatar(
                                        // backgroundImage: NetworkImage('$img'),
                                        // backgroundImage: NetworkImage('$img'),
                                        backgroundImage: img.image,
                                        minRadius: 50,
                                        maxRadius: 50,
                                        // child: img,
                                      ),
                                    )
                                    .toList(),
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
                              )),
                        ),
                        const SizedBox(height: 8),
                        Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 32),
                            child: Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  ElevatedButton(
                                    onPressed:
                                        //() {},
                                        _pickImage,
                                    child: const Text('Select Image'),
                                  ),
                                  const SizedBox(width: 16),
                                  ElevatedButton(
                                    onPressed:
                                        // () {},
                                        _pickMultiImages,
                                    child: const Text('Select Multi Images'),
                                  ),
                                  const SizedBox(width: 16),
                                ])),
                        const SizedBox(height: 32),
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
                                      DateTime rideDate = DateTime(
                                          _date.year,
                                          _date.month,
                                          _date.day,
                                          _time.hour,
                                          _time.minute);
                                      widget.setActual(
                                          rideDate, _ridePhotos, true);
                                      print(_ridePhotos);
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
      height: 500, //サイズは適当
      width: 500, //サイズは適当
      onWebViewCreated: (controller) => webviewController = controller,
    );
  }
}
