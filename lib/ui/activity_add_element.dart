import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

import '../model/rider_activity.dart';
import '../model/status.dart';

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
  final _dateController = TextEditingController();
  final _distanceController = TextEditingController();
  final _startPointController = TextEditingController();
  final _wayPointController = TextEditingController();
  final _finishPointController = TextEditingController();
  final _couseURLController = TextEditingController();
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
                  padding: const EdgeInsets.symmetric(horizontal: 32),
                  child: const Text('アクティビティを追加',
                      style: TextStyle(color: Colors.black, fontSize: 18.0))),
              Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 32),
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
              const SizedBox(height: 32),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 32),
                child: TextFormField(
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
              const SizedBox(height: 32),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 32),
                child: TextFormField(
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
                    if (value.length > 21) {
                      return '日付は２０文字以内です';
                    }
                    return null;
                  },
                ),
              ),
              const SizedBox(height: 32),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 32),
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
              const SizedBox(height: 32),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 32),
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
              const SizedBox(height: 32),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 32),
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
              const SizedBox(height: 32),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 32),
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
              const SizedBox(height: 32),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 32),
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
                                    date: DateTime.parse(
                                        '2022-01-01 01:00:00'), //iso
                                    distance: 0,
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
