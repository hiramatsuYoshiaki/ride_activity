import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/services.dart';
// import 'package:validators/validators.dart';
import 'package:select_form_field/select_form_field.dart';

import '../model/rider_activity.dart';
import '../model/status.dart';
import '../model/select_items.dart';
import '../model/prefacturs.dart';
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
  TextEditingController _activityTitleController = TextEditingController();
  // final _activityTitleController = TextEditingController(text: "your Text");
  TextEditingController _dateController = TextEditingController();
  TextEditingController _timeController = TextEditingController();
  TextEditingController _distanceController = TextEditingController();
  TextEditingController _startPointController = TextEditingController();
  TextEditingController _wayPointController = TextEditingController();
  TextEditingController _finishPointController = TextEditingController();
  TextEditingController _couseURLController = TextEditingController();
  TextEditingController _rideTypeController = TextEditingController();
  TextEditingController _prefactureItemController = TextEditingController();
  TextEditingController _tagItemController = TextEditingController();
  String _valueChanged = '';
  String _valueToValidate = '';
  String _valueSaved = '';
  List<String> prefs = [];
  List<String> tags = [];

  @override
  void initState() {
    super.initState();
    _activityTitleController.text =
        widget.selectedActivity.plan.activityTitle.toString();
    _dateController.text =
        DateFormat('yyyy???M???d???').format(widget.selectedActivity.plan.date);
    _timeController.text =
        DateFormat('h???m???').format(widget.selectedActivity.plan.date);
    _distanceController.text = widget.selectedActivity.plan.distance.toString();
    _startPointController.text =
        widget.selectedActivity.plan.startPoint.toString();
    _wayPointController.text = widget.selectedActivity.plan.wayPoint.toString();
    _finishPointController.text =
        widget.selectedActivity.plan.finishPoint.toString();
    _couseURLController.text = widget.selectedActivity.plan.couseURL.toString();
    _rideTypeController.text = widget.selectedActivity.plan.rideType.toString();
    _prefactureItemController.text = '';
    _tagItemController.text = '';
  }

  DateTime _date = DateTime.now();
  Future<Null> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
        context: context,
        initialDate: _date,
        firstDate: DateTime(2020),
        lastDate: DateTime.now().add(const Duration(days: 360)));
    if (picked != null) setState(() => _date = picked);
    // _dateController.text = DateFormat('yyyy???M???d??? hh???mm???').format(_date);
    _dateController.text = DateFormat('yyyy???M???d???').format(_date);
  }

  TimeOfDay _time = TimeOfDay.now();

  Future<Null> _selectTime(BuildContext context) async {
    final TimeOfDay? picked = await showTimePicker(
      context: context,
      initialTime: _time,
    );
    if (picked != null) setState(() => _time = picked);

    _timeController.text = DateFormat('h???m???').format(
        DateTime(_date.year, _date.month, _date.day, _time.hour, _time.minute));
  }

  // List<Prefacturs> prefactursItems = <Prefacturs>[];
  // prefactursItems = makePrefactureSelectItems();

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
        child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Container(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: const Text('??????????????????????????????',
                      style: TextStyle(color: Colors.black, fontSize: 18.0))),
              const SizedBox(height: 8),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: TextFormField(
                  // initialValue: 'Title',
                  // initialValue:
                  // widget.selectedActivity.plan.activityTitle.toString(),
                  controller: _activityTitleController,
                  decoration: const InputDecoration(
                    labelText: '????????????',
                    hintText: '???????????????????????????????????????',
                    // helperText: '??????'
                  ),
                  validator: (value) {
                    if (value!.isEmpty) {
                      return '??????????????????????????????';
                    }
                    if (value.length > 51) {
                      return '??????????????????50??????????????????';
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
                            labelText: '??????',
                            hintText: '?????????????????????????????????',
                            // helperText: '??????'
                          ),
                          validator: (value) {
                            if (value!.isEmpty) {
                              return '?????????????????????';
                            }
                            return null;
                          },
                        )),
                    Expanded(
                        flex: 2,
                        child: ElevatedButton(
                          onPressed: () => _selectDate(context),
                          child: const Text('????????????'),
                        ))
                    // Expanded(
                    //     flex: 2,
                    //     child: ElevatedButton(
                    //       onPressed: () => _selectTime(context),
                    //       child: const Text('????????????'),
                    //     ))
                  ],
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
                          controller: _timeController,
                          decoration: const InputDecoration(
                            labelText: '??????',
                            hintText: '?????????????????????????????????',
                            // helperText: '??????'
                          ),
                          validator: (value) {
                            if (value!.isEmpty) {
                              return '?????????????????????';
                            }
                            return null;
                          },
                        )),
                    Expanded(
                        flex: 2,
                        child: ElevatedButton(
                          onPressed: () => _selectTime(context),
                          child: const Text('????????????'),
                        ))
                    // Expanded(
                    //     flex: 2,
                    //     child: ElevatedButton(
                    //       onPressed: () => _selectTime(context),
                    //       child: const Text('????????????'),
                    //     ))
                  ],
                ),
              ),
              const SizedBox(height: 8),
              // Padding(
              //   padding: const EdgeInsets.symmetric(horizontal: 16),
              //   child: Container(
              //       padding: const EdgeInsets.all(50.0),
              //       child: Column(
              //         children: <Widget>[
              //           Center(child: Text("${_date}")),
              //           ElevatedButton(
              //             onPressed: () => _selectDate(context),
              //             child: const Text('????????????'),
              //           )
              //         ],
              //       )),
              // ),
              // const SizedBox(height: 8),
              // Padding(
              //   padding: const EdgeInsets.symmetric(horizontal: 16),
              //   child: Container(
              //       padding: const EdgeInsets.all(50.0),
              //       child: Column(
              //         children: <Widget>[
              //           Center(child: Text("${_time}")),
              //           new ElevatedButton(
              //             onPressed: () => _selectTime(context),
              //             child: new Text('????????????'),
              //           )
              //         ],
              //       )),
              // ),
              // const SizedBox(height: 8),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: TextFormField(
                  controller: _distanceController,
                  decoration: const InputDecoration(
                    labelText: '??????(Km)',
                    hintText: '?????????????????????????????????',
                    // helperText: '??????'
                  ),
                  maxLength: 7,
                  keyboardType: TextInputType.number,
                  // inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                  inputFormatters: <TextInputFormatter>[
                    FilteringTextInputFormatter.allow(RegExp('[0-9]')),
                  ],
                  validator: (value) {
                    if (value!.isEmpty) {
                      return '?????????????????????';
                    }
                    if (int.parse(value) <= 0) {
                      return '?????????1km????????????';
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
                    labelText: '????????????',
                    hintText: '?????????????????????????????????????????????',
                    // helperText: '??????'
                  ),
                  validator: (value) {
                    if (value!.isEmpty) {
                      return '???????????????????????????';
                    }
                    if (value.length > 51) {
                      return '??????????????????50??????????????????';
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
                    labelText: '??????',
                    hintText: '???????????????????????????????????????',
                    // helperText: '??????'
                  ),
                  validator: (value) {
                    if (value!.isEmpty) {
                      return '?????????????????????';
                    }
                    if (value.length > 51) {
                      return '?????????51??????????????????';
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
                    labelText: '?????????',
                    hintText: '??????????????????????????????????????????',
                    // helperText: '??????'
                  ),
                  validator: (value) {
                    if (value!.isEmpty) {
                      return '????????????????????????';
                    }
                    if (value.length > 51) {
                      return '????????????51??????????????????';
                    }
                    return null;
                  },
                ),
              ),
              const SizedBox(height: 8),
              Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: TextFormField(
                    // keyboardType: TextInputType.number,
                    // inputFormatters: <TextInputFormatter>[FilteringTextInputFormatter.digitsOnly],
                    controller: _couseURLController,
                    decoration: const InputDecoration(
                      labelText: 'Garmin Connect??????????????????????????????',
                      // hintText:
                      //     'https://connect.garmin.com/modern/activity/embed/123456',
                      // 'https://connect.garmin.com/modern/activity/embed/8763155713'
                    ),
                    validator: (value) {
                      if (value!.isEmpty) {
                        return '??????????????????????????????????????????';
                      }
                      String pattern2 = r'^<iframe[^>]*>\s*<\/iframe>';
                      // String pattern2 = r'/^<iframe[^>]*>\s*<\/iframe>/';
                      RegExp regExp2 = RegExp(pattern2);
                      if (!regExp2.hasMatch(value)) {
                        return '??????????????????????????????????????????????????????';
                      }

                      return null;
                    },
                  )),
              const SizedBox(height: 8),
              //prefacture
              //rideType
              Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: SelectFormField(
                    // type: SelectFormFieldType.dialog,
                    type: SelectFormFieldType.dropdown,
                    controller: _rideTypeController,
                    // initialValue: 'trainingShort',
                    // icon: Icon(Icons.format_shapes),
                    labelText: '????????????????????????',
                    changeIcon: false,
                    dialogTitle: '????????????????????????',
                    dialogCancelBtn: '???????????????',
                    enableSearch: true,
                    dialogSearchHint: '??????',
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
                        return '???????????????????????????????????????';
                      }
                    },
                    onSaved: (val) =>
                        setState(() => _rideTypeController.text = val ?? ''),
                  )),
              // Text('onChanged: $_valueChanged'),
              // Text('validator: $_valueToValidate'),
              // Text('onSaved: $_valueSaved'),
              const SizedBox(height: 8),
              const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 16),
                  child: Text('??????(???????????????????????????????????????)',
                      style: TextStyle(fontSize: 12, color: Colors.grey))),
              const SizedBox(height: 4),
              //prefacture
              Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: Wrap(
                    runSpacing: 8,
                    spacing: 8,
                    children: prefs
                        .map((pref) => Container(
                            padding: const EdgeInsets.all(4),
                            decoration: BoxDecoration(
                              border: Border.all(color: Colors.grey),
                              borderRadius: BorderRadius.circular(4),
                            ),
                            // child: Text(
                            //   '$pref ',
                            //   style: const TextStyle(fontSize: 16.0),
                            // )
                            child: TextButton.icon(
                              onPressed: () {
                                setState(() => prefs.remove(pref));
                              },
                              icon: const Icon(
                                Icons.close,
                                size: 12.0,
                                color: Colors.grey,
                              ),
                              label: Text('$pref ',
                                  style: const TextStyle(color: Colors.black)),
                            )))
                        .toList(),
                  )),
              Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: Row(
                    children: [
                      Expanded(
                          child: SelectFormField(
                        type: SelectFormFieldType.dialog, // or dialog
                        // type: SelectFormFieldType.dropdown, // or dialog
                        controller: _prefactureItemController,
                        // initialValue: 'trainingShort',
                        // icon: Icon(Icons.format_shapes),
                        enabled: true,
                        labelText: '????????????',
                        hintText: '????????????????????????',
                        changeIcon: false,
                        dialogTitle: '????????????',
                        dialogCancelBtn: '???????????????',
                        enableSearch: true,
                        dialogSearchHint: '??????',
                        items: makePrefactureSelectItems(),
                        onChanged: (val) => setState(
                            () => _prefactureItemController.text = val),
                        // validator: (val) {
                        //   if (val!.isEmpty || val == '') {
                        //     return '???????????????????????????????????????';
                        //   }
                        //   return null;
                        // },
                        onSaved: (val) => setState(
                            () => _prefactureItemController.text = val ?? ''),
                      )),
                      ElevatedButton(
                          onPressed: () {
                            // setState(() =>
                            //     prefs.add(_prefactureItemController.text)
                            //     );
                            setState(() {
                              prefs.add(_prefactureItemController.text);
                              _prefactureItemController.clear();
                            });
                          },
                          child: const Text('??????')),
                    ],
                  )),

              // Text('Rider menber'),
              const SizedBox(height: 16),
              Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: Wrap(
                    runSpacing: 8,
                    spacing: 8,
                    children: tags
                        .map((tag) => Container(
                            padding: const EdgeInsets.all(4),
                            decoration: BoxDecoration(
                              border: Border.all(color: Colors.grey),
                              borderRadius: BorderRadius.circular(4),
                            ),
                            // child: Text(
                            //   '$tag ',
                            //   style: const TextStyle(fontSize: 16.0),
                            // )
                            child: TextButton.icon(
                              onPressed: () {
                                setState(() => tags.remove(tag));
                              },
                              icon: const Icon(
                                Icons.close,
                                size: 12.0,
                                color: Colors.grey,
                              ),
                              label: Text('$tag ',
                                  style: const TextStyle(color: Colors.black)),
                            )))
                        .toList(),
                  )),
              const SizedBox(height: 8),
              const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 16),
                  child: Text('Tag(????????????????????????????????????????????????????????????)',
                      style: TextStyle(fontSize: 12, color: Colors.grey))),
              Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: Row(children: [
                    Expanded(
                      child: TextFormField(
                        controller: _tagItemController,
                        decoration: const InputDecoration(
                          labelText: 'Tag',
                          hintText: '?????????????????????????????????',
                          // helperText: '??????'
                        ),
                        validator: (value) {
                          if (value!.isEmpty) {
                            return null;
                          } else {}
                          if (value.length > 21) {
                            return '????????????21??????????????????';
                          }
                          return null;
                        },
                      ),
                    ),
                    ElevatedButton(
                        onPressed: () {
                          setState(() {
                            tags.add(_tagItemController.text);
                            _tagItemController.clear();
                          });
                        },
                        child: const Text('??????')),
                  ])),

              const SizedBox(height: 32),

              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    ElevatedButton(
                        onPressed: () {
                          // setState(() {
                          //   _formKey.currentState!.reset();
                          // });

                          _activityTitleController.clear();
                          _dateController.clear();
                          _timeController.clear();
                          _distanceController.clear();
                          _startPointController.clear();
                          _wayPointController.clear();
                          _finishPointController.clear();
                          _couseURLController.clear();
                          _rideTypeController.clear();
                          prefs = [];
                          tags = [];
                        },
                        child: const Text('?????????')),
                    const SizedBox(width: 16),
                    ElevatedButton(
                        onPressed: () {
                          widget.setActivityState(ActivityState.display);
                        },
                        child: const Text('???????????????')),
                    const SizedBox(width: 16),
                    ElevatedButton(
                        onPressed: () {
                          if (_formKey.currentState!.validate()) {
                            // print(_couseURLController.text);
                            var strArrey =
                                _couseURLController.text.split(RegExp(r"\s"));
                            // print(strArrey[1]);
                            // strArrey.forEach((element) { })
                            var url = '';
                            strArrey.asMap().forEach((int i, String value) {
                              // print('Index: $i --> Value: $value');
                              String pattern5 =
                                  r'https://connect.garmin.com/modern/course/embed/.*';
                              RegExp regExp5 = RegExp(pattern5);
                              if (regExp5.hasMatch(value)) {
                                // print('match---$value');
                                url = value;
                              }
                            });
                            var srt3 = url.split(RegExp(r"'"));
                            // var srt3 = strArrey[1].split(RegExp(r"'"));
                            // print(srt3);
                            // print(srt3[1]);

                            widget.addPlan(Activities(
                              plan: RiderActivities(
                                uid: widget.currentUser!.uid,
                                activityTitle: _activityTitleController.text,
                                // date: DateTime.utc(2022, 03, 03, 12, 30, 00),
                                // date: DateTime.parse(
                                //     '2022-01-01 01:00:00'), //iso
                                date: DateTime(_date.year, _date.month,
                                    _date.day, _time.hour, _time.minute),
                                distance: int.parse(_distanceController.text),
                                done: false,
                                startPoint: _startPointController.text,
                                wayPoint: _wayPointController.text,
                                finishPoint: _finishPointController.text,
                                // couseURL: _couseURLController.text),
                                couseURL: srt3[1],
                                prefacture: prefs,
                                rideType: _rideTypeController.text,
                              ),
                              actual: ActualRide(
                                rideURL: '',
                                ridePhotos: [],
                              ),
                              menber: Menber(rider: []),
                              shared: true,
                              tags: tags,
                              createdAt: DateTime.now(),
                              updateAt: DateTime.now(),
                              status: 'active',
                              id: '',
                            ));
                            // widget.registerAccount(
                            //   _emailController.text,
                            //   _displayNameController.text,
                            //   _passwordController.text,
                            // );
                            // widget.setActual();
                            // widget.setNewCouceURL(_couseURLController.text);
                          }
                        },
                        child: const Text('??????')),
                    const SizedBox(width: 36),
                  ],
                ),
              ),
            ],
          ),
        ),
      ],
    ));
  }
}
