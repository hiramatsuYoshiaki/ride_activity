import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:ride_activity/model/status.dart';
import 'package:ride_activity/model/rider_activity.dart';
import 'package:intl/intl.dart';
import 'package:select_form_field/select_form_field.dart';
import 'package:webviewx/webviewx.dart';

import '../model/select_items.dart';

class ActivityEdit extends StatefulWidget {
  const ActivityEdit({
    Key? key,
    required this.setActivityState,
    required this.selectedActivity,
  }) : super(key: key);
  final void Function(ActivityState status) setActivityState;
  final Activities selectedActivity;

  @override
  _ActivityEditState createState() => _ActivityEditState();
}

class _ActivityEditState extends State<ActivityEdit> {
  late WebViewXController webviewController;
  final _formKey = GlobalKey<FormState>(debugLabel: '_ActivityEdit');
  TextEditingController _activityTitleController = TextEditingController();
  TextEditingController _dateController = TextEditingController();
  TextEditingController _timeController = TextEditingController();
  TextEditingController _distanceController = TextEditingController();
  TextEditingController _startPointController = TextEditingController();
  TextEditingController _wayPointController = TextEditingController();
  TextEditingController _finishPointController = TextEditingController();
  TextEditingController _couseURLController = TextEditingController();
  TextEditingController _rideTypeController = TextEditingController();
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

  String _rideType = 'イベント';

  @override
  void initState() {
    super.initState();
    _activityTitleController.text =
        widget.selectedActivity.plan.activityTitle.toString();
    _dateController.text =
        DateFormat('yyyy年M月d日').format(widget.selectedActivity.plan.date);
    _timeController.text =
        DateFormat('h時m分').format(widget.selectedActivity.plan.date);
    _distanceController.text = widget.selectedActivity.plan.distance.toString();
    _startPointController.text =
        widget.selectedActivity.plan.startPoint.toString();
    _wayPointController.text = widget.selectedActivity.plan.wayPoint.toString();
    _finishPointController.text =
        widget.selectedActivity.plan.finishPoint.toString();
    _rideTypeController.text = widget.selectedActivity.plan.rideType.toString();
    _rideType = widget.selectedActivity.plan.rideType.toString();
    var _couseURL =
        "<iframe src='${widget.selectedActivity.plan.couseURL.toString()} title='ライドタイトル' width='465' height='500' frameborder='0'></iframe>";
    _couseURLController.text = _couseURL;
    // _couseURLController.text = widget.selectedActivity.plan.couseURL.toString();
    _rideTypeController.text = widget.selectedActivity.plan.rideType.toString();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
        child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Container(
                    // padding: const EdgeInsets.symmetric(horizontal: 16),
                    child: const Text('アクティビティを編集',
                        style: TextStyle(color: Colors.black, fontSize: 18.0))),
                const SizedBox(height: 8),
                _buildWebViewX(widget.selectedActivity),
                const SizedBox(width: 30),
                Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    child: TextFormField(
                      controller: _couseURLController,
                      decoration: const InputDecoration(
                        labelText: 'Garmin Connectのコース共有コード',
                      ),
                      validator: (value) {
                        if (value!.isEmpty) {
                          return '共有リンクアドレスは必須です';
                        }
                        String pattern2 = r'^<iframe[^>]*>\s*<\/iframe>';
                        RegExp regExp2 = RegExp(pattern2);
                        if (!regExp2.hasMatch(value)) {
                          return 'コース追加のコードを入力してください';
                        }
                        return null;
                      },
                    )),
                const SizedBox(height: 8),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: TextFormField(
                    // initialValue: 'Title',
                    // initialValue:
                    // widget.selectedActivity.plan.activityTitle.toString(),
                    controller: _activityTitleController,
                    decoration: const InputDecoration(
                      labelText: 'タイトル',
                      hintText: 'タイトルを入力してください',
                      // helperText: '必須'
                    ),
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'タイトル名は必須です';
                      }
                      if (value.length > 51) {
                        return 'タイトル名は50文字以内です';
                      }
                      return null;
                    },
                  ),
                ),
                const SizedBox(height: 8),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
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
              ],
            )),
        const SizedBox(height: 8),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
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
                      // helperText: '必須'
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
              // Expanded(
              //     flex: 2,
              //     child: ElevatedButton(
              //       onPressed: () => _selectTime(context),
              //       child: const Text('日付選択'),
              //     ))
            ],
          ),
        ),
        const SizedBox(height: 8),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: TextFormField(
            controller: _distanceController,
            decoration: const InputDecoration(
              labelText: '距離(Km)',
              hintText: '距離を入力してください',
              // helperText: '必須'
            ),
            maxLength: 7,
            keyboardType: TextInputType.number,
            // inputFormatters: [FilteringTextInputFormatter.digitsOnly],
            inputFormatters: <TextInputFormatter>[
              FilteringTextInputFormatter.allow(RegExp('[0-9]')),
            ],
            validator: (value) {
              if (value!.isEmpty) {
                return '距離は必須です';
              }
              if (int.parse(value) <= 0) {
                return '距離は1km以上です';
              }
              return null;
            },
          ),
        ),
        const SizedBox(height: 8),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: TextFormField(
            controller: _startPointController,
            decoration: const InputDecoration(
              labelText: 'スタート',
              hintText: 'スタート場所を入力してください',
              // helperText: '必須'
            ),
            validator: (value) {
              if (value!.isEmpty) {
                return 'スタートは必須です';
              }
              if (value.length > 51) {
                return 'タイトル名は50文字以内です';
              }
              return null;
            },
          ),
        ),
        const SizedBox(height: 8),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: TextFormField(
            controller: _wayPointController,
            decoration: const InputDecoration(
              labelText: '経由',
              hintText: '経由場所を入力してください',
              // helperText: '必須'
            ),
            validator: (value) {
              if (value!.isEmpty) {
                return '経由は必須です';
              }
              if (value.length > 51) {
                return '経由は51文字以内です';
              }
              return null;
            },
          ),
        ),
        const SizedBox(height: 8),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: TextFormField(
            controller: _finishPointController,
            decoration: const InputDecoration(
              labelText: 'ゴール',
              hintText: 'ゴール場所を入力してください',
              // helperText: '必須'
            ),
            validator: (value) {
              if (value!.isEmpty) {
                return 'ゴールは必須です';
              }
              if (value.length > 51) {
                return 'ゴールは51文字以内です';
              }
              return null;
            },
          ),
        ),
        const SizedBox(height: 8),

        //prefacture
        //rideType
        Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: SelectFormField(
              type: SelectFormFieldType.dialog,
              controller: _rideTypeController,
              // initialValue: 'event',
              // initialValue: _rideTypeController.text.toString(),
              // icon: Icon(Icons.format_shapes),
              labelText: 'セグメントタイプ',
              changeIcon: false,
              dialogTitle: 'セグメントタイプ',
              dialogCancelBtn: 'キャンセル',
              enableSearch: true,
              dialogSearchHint: '検索',
              items: rideTypeItems,
              // onChanged: (val) => setState(() => _valueChanged = val),
              // validator: (val) {
              //   setState(() => _valueToValidate = val ?? '');
              //   return null;
              // },
              // onSaved: (val) => setState(() => _valueSaved = val ?? ''),
              onChanged: (val) =>
                  setState(() => _rideTypeController.text = val),
              validator: (val) {
                // setState(() => _valueToValidate = val ?? '');
                // return null;
                if (val!.isEmpty || val == '') {
                  return 'セグメントタイプは必須です';
                }
                return null;
              },
              onSaved: (val) =>
                  setState(() => _rideTypeController.text = val ?? ''),
            )),
        // Text('onChanged: $_valueChanged'),
        // Text('validator: $_valueToValidate'),
        // Text('onSaved: $_valueSaved'),
        const SizedBox(height: 8),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              // ElevatedButton(
              //     onPressed: () {
              //       // setState(() {
              //       //   _formKey.currentState!.reset();
              //       // });

              //       _activityTitleController.clear();
              //       _dateController.clear();
              //       _timeController.clear();
              //       _distanceController.clear();
              //       _startPointController.clear();
              //       _wayPointController.clear();
              //       _finishPointController.clear();
              //       _couseURLController.clear();
              //       _rideTypeController.clear();
              //     },
              //     child: const Text('クリア')),
              // const SizedBox(width: 16),
              ElevatedButton(
                  onPressed: () {
                    widget.setActivityState(ActivityState.display);
                  },
                  child: const Text('キャンセル')),
              const SizedBox(width: 16),
              ElevatedButton(
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      // print(_couseURLController.text);
                      // var strArrey =
                      //     _couseURLController.text.split(RegExp(r"\s"));
                      // print(strArrey[1]);
                      // var url = '';
                      // strArrey.asMap().forEach((int i, String value) {
                      //   print('Index: $i --> Value: $value');
                      //   String pattern5 =
                      //       r'https://connect.garmin.com/modern/course/embed/.*';
                      //   RegExp regExp5 = RegExp(pattern5);
                      //   if (regExp5.hasMatch(value)) {
                      //     print('match---$value');
                      //     url = value;
                      //   }
                      // });
                      // var srt3 = url.split(RegExp(r"'"));
                      // print(srt3[1]);
                      print(_activityTitleController.text);
                      //   widget.addPlan(Activities(
                      //     plan: RiderActivities(
                      //       uid: widget.currentUser!.uid,
                      //       activityTitle: _activityTitleController.text,
                      //       date: DateTime(_date.year, _date.month, _date.day,
                      //           _time.hour, _time.minute),
                      //       distance: int.parse(_distanceController.text),
                      //       done: false,
                      //       startPoint: _startPointController.text,
                      //       wayPoint: _wayPointController.text,
                      //       finishPoint: _finishPointController.text,
                      //       couseURL: srt3[1],
                      //       prefacture: ['岡山'],
                      //       rideType: _rideTypeController.text,
                      //     ),
                      //     actual: ActualRide(
                      //       rideURL: '',
                      //       ridePhotos: [],
                      //     ),
                      //     menber: Menber(rider: []),
                      //     shared: true,
                      //     tags: ['トレーニング'],
                      //     createdAt: DateTime.now(),
                      //     updateAt: DateTime.now(),
                      //     status: 'active',
                      //   ));
                    }
                    //   widget.addPlan(Activities(
                    //     plan: RiderActivities(
                    //       uid: widget.currentUser!.uid,
                    //       activityTitle: _activityTitleController.text,
                    //       date: DateTime(_date.year, _date.month, _date.day,
                    //           _time.hour, _time.minute),
                    //       distance: int.parse(_distanceController.text),
                    //       done: false,
                    //       startPoint: _startPointController.text,
                    //       wayPoint: _wayPointController.text,
                    //       finishPoint: _finishPointController.text,
                    //       couseURL: srt3[1],
                    //       prefacture: ['岡山'],
                    //       rideType: _rideTypeController.text,
                    //     ),
                    //     actual: ActualRide(
                    //       rideURL: '',
                    //       ridePhotos: [],
                    //     ),
                    //     menber: Menber(rider: []),
                    //     shared: true,
                    //     tags: ['トレーニング'],
                    //     createdAt: DateTime.now(),
                    //     updateAt: DateTime.now(),
                    //     status: 'active',
                    //   ));
                    // }
                  },
                  child: const Text('入力')),
              const SizedBox(width: 30),
            ],
          ),
        ),
        const SizedBox(height: 30),
        // _buildWebViewX(widget.selectedActivity),
        Text('予定コースマップURL------'),
        Text(widget.selectedActivity.plan.couseURL),
        Text('実走コースURL-----'),
        Text(widget.selectedActivity.actual.rideURL),
        Text('予定情報-----'),

        Text(widget.selectedActivity.plan.activityTitle),
        Text(DateFormat('yyyy年M月d日 hh時mm分')
            .format(widget.selectedActivity.plan.date)),
        Text('${widget.selectedActivity.plan.distance} km'),
        Text(widget.selectedActivity.plan.done ? '実走 true' : '予定 false'),
        Text(widget.selectedActivity.plan.startPoint),
        Text(widget.selectedActivity.plan.wayPoint),
        Text(widget.selectedActivity.plan.finishPoint),
        Text(widget.selectedActivity.plan.rideType),
        Wrap(
          runSpacing: 8,
          spacing: 8,
          children: widget.selectedActivity.plan.prefacture
              .map((item) => Text(
                    '$item ',
                    style: const TextStyle(fontSize: 12.0),
                  ))
              .toList(),
        ),

        Text('実走情報-----'),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: widget.selectedActivity.actual.ridePhotos
              .map(
                (photoUrl) =>
                    // CircleAvatar(
                    //   backgroundImage: NetworkImage("assets/images/$photoUrl"),
                    //   minRadius: 50,
                    //   maxRadius: 50,
                    // ),
                    Text(photoUrl),
              )
              .toList(),
        ),
        Text('参加ライダー-----'),
        Container(
            padding: EdgeInsets.all(4),
            alignment: Alignment.center,
            decoration: BoxDecoration(
              border: Border.all(color: Colors.grey),
              borderRadius: BorderRadius.circular(2),
            ),
            child: Column(
              children: [
                Text('参加ライダー', style: TextStyle(fontSize: 12)),
                Wrap(
                  alignment: WrapAlignment.center,
                  runSpacing: 8,
                  spacing: 8,
                  children: widget.selectedActivity.menber.rider
                      .map(
                        (rider) => Text(
                          '$rider ',
                          style: const TextStyle(fontSize: 18.0),
                        ),
                      )
                      .toList(),
                ),
              ],
            )),

        // SizedBox(height: 16),
        // ElevatedButton(
        //     onPressed: () {
        //       widget.setActivityState(ActivityState.activityRemove);
        //     },
        //     child: Text('Remove')),
        // SizedBox(height: 16),
        // ElevatedButton(
        //     onPressed: () {
        //       widget.setActivityState(ActivityState.display);
        //     },
        //     child: Text('List')),
      ],
    ));
  }

  Widget _buildWebViewX(Activities selectedActivityData) {
    return WebViewX(
      key: const ValueKey('webviewx'),
      initialContent: selectedActivityData.plan.done
          ? selectedActivityData.actual.rideURL
          : selectedActivityData.plan.couseURL,
      initialSourceType: SourceType.url,
      height: 500, //サイズは適当
      width: 500, //サイズは適当
      onWebViewCreated: (controller) => webviewController = controller,
    );
  }
}
