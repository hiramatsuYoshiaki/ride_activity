import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

import '../model/rider_activity.dart';
import '../model/status.dart';
import 'package:intl/intl.dart';

class ActivityAddElement extends StatefulWidget {
  const ActivityAddElement({
    Key? key,
    required this.currentUser,
    required this.setActivityState,
    required this.selectedActivity,
    required this.addPlan,
  }) : super(key: key);

  final User? currentUser;
  final void Function(ActivityState status) setActivityState;
  final void Function(Activities selectedActivity) addPlan;
  final Activities selectedActivity;

  @override
  _ActivityAddElementState createState() => _ActivityAddElementState();
}

class _ActivityAddElementState extends State<ActivityAddElement> {
  final _formKey = GlobalKey<FormState>(debugLabel: '_ActivityAddState');
  final _activityTitleController = TextEditingController();
  // final _activityTitleController = TextEditingController(text: "your Text");
  final _dateController = TextEditingController();
  final _timeController = TextEditingController();
  final _distanceController = TextEditingController();
  final _startPointController = TextEditingController();
  final _wayPointController = TextEditingController();
  final _finishPointController = TextEditingController();
  final _couseURLController = TextEditingController();

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
    _couseURLController.text = widget.selectedActivity.plan.couseURL.toString();
  }

  DateTime _date = DateTime.now();
  Future<Null> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
        context: context,
        initialDate: _date,
        firstDate: DateTime(2022),
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

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Container(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: const Text('アクティビティを追加',
                      style: TextStyle(color: Colors.black, fontSize: 18.0))),
              const SizedBox(height: 16),
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
                    if (value.length > 21) {
                      return 'タイトル名は２０文字以内です';
                    }
                    return null;
                  },
                ),
              ),
              const SizedBox(height: 16),
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
                    // Expanded(
                    //     flex: 2,
                    //     child: ElevatedButton(
                    //       onPressed: () => _selectTime(context),
                    //       child: const Text('日付選択'),
                    //     ))
                  ],
                ),
              ),
              const SizedBox(height: 16),
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
              const SizedBox(height: 16),
              // Padding(
              //   padding: const EdgeInsets.symmetric(horizontal: 16),
              //   child: Container(
              //       padding: const EdgeInsets.all(50.0),
              //       child: Column(
              //         children: <Widget>[
              //           Center(child: Text("${_date}")),
              //           ElevatedButton(
              //             onPressed: () => _selectDate(context),
              //             child: const Text('日付選択'),
              //           )
              //         ],
              //       )),
              // ),
              // const SizedBox(height: 16),
              // Padding(
              //   padding: const EdgeInsets.symmetric(horizontal: 16),
              //   child: Container(
              //       padding: const EdgeInsets.all(50.0),
              //       child: Column(
              //         children: <Widget>[
              //           Center(child: Text("${_time}")),
              //           new ElevatedButton(
              //             onPressed: () => _selectTime(context),
              //             child: new Text('時間選択'),
              //           )
              //         ],
              //       )),
              // ),
              // const SizedBox(height: 16),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: TextFormField(
                  controller: _distanceController,
                  decoration: const InputDecoration(
                    labelText: '距離',
                    hintText: '距離を入力してください',
                    // helperText: '必須'
                  ),
                  validator: (value) {
                    if (value!.isEmpty) {
                      return '距離は必須です';
                    }
                    if (value.length > 21) {
                      return '距離は２０文字以内です';
                    }
                    return null;
                  },
                ),
              ),
              const SizedBox(height: 16),
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
                    if (value.length > 21) {
                      return 'スタートは２０文字以内です';
                    }
                    return null;
                  },
                ),
              ),
              const SizedBox(height: 16),
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
                    if (value.length > 21) {
                      return '経由は２０文字以内です';
                    }
                    return null;
                  },
                ),
              ),
              const SizedBox(height: 16),
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
                    if (value.length > 21) {
                      return 'ゴールは２０文字以内です';
                    }
                    return null;
                  },
                ),
              ),
              const SizedBox(height: 16),
              Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: TextFormField(
                    // keyboardType: TextInputType.number,
                    // inputFormatters: <TextInputFormatter>[FilteringTextInputFormatter.digitsOnly],
                    controller: _couseURLController,
                    decoration: const InputDecoration(
                      labelText: 'Garmin Connectの共有リンクアドレス',
                      // hintText:
                      //     'https://connect.garmin.com/modern/activity/embed/123456',
                      // 'https://connect.garmin.com/modern/activity/embed/8763155713'
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
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    ElevatedButton(
                        onPressed: () {
                          widget.setActivityState(ActivityState.display);
                        },
                        child: const Text('キャンセル')),
                    const SizedBox(width: 16),
                    ElevatedButton(
                        onPressed: () {
                          if (_formKey.currentState!.validate()) {
                            widget.addPlan(Activities(
                                plan: RiderActivities(
                                    uid: widget.currentUser!.uid,
                                    activityTitle:
                                        _activityTitleController.text,
                                    // date: DateTime.utc(2022, 03, 03, 12, 30, 00),
                                    // date: DateTime.parse(
                                    //     '2022-01-01 01:00:00'), //iso
                                    date: DateTime(_date.year, _date.month,
                                        _date.day, _time.hour, _time.minute),
                                    distance:
                                        int.parse(_distanceController.text),
                                    done: false,
                                    startPoint: _startPointController.text,
                                    wayPoint: _wayPointController.text,
                                    finishPoint: _finishPointController.text,
                                    couseURL: _couseURLController.text),
                                actual: ActualRide(
                                  rideURL: '',
                                  ridePhotos: [],
                                ),
                                menber: Menber(rider: [])));
                            // widget.registerAccount(
                            //   _emailController.text,
                            //   _displayNameController.text,
                            //   _passwordController.text,
                            // );
                            // widget.setActual();
                            // widget.setNewCouceURL(_couseURLController.text);
                          }
                        },
                        child: const Text('入力')),
                    const SizedBox(width: 30),
                  ],
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
