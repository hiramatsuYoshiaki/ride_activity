import 'package:flutter/material.dart';
import 'package:ride_activity/model/status.dart';

import '../model/rider_activity.dart';

class ActivityAdd extends StatefulWidget {
  const ActivityAdd({
    Key? key,
    required this.setActivityState,
    required this.addRiderActivity,
  }) : super(key: key);
  final void Function(ActivityState status) setActivityState;
  final void Function(RiderActivities activities) addRiderActivity;

  @override
  _ActivityAddState createState() => _ActivityAddState();
}

class _ActivityAddState extends State<ActivityAdd> {
  final _formKey = GlobalKey<FormState>(debugLabel: '_ActivityAddState');
  final _activityTitleController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          decoration: new BoxDecoration(
              border: new Border(
                  bottom: BorderSide(width: 1.0, color: Colors.grey))),
          height: 50,
          child: Row(
            children: [
              ElevatedButton(
                  onPressed: () {
                    widget.setActivityState(ActivityState.display);
                  },
                  child: Text('list')),
            ],
          ),
        ),
        Form(
            key: _formKey,
            child: Row(
              children: [
                Expanded(
                    child: TextFormField(
                  controller: _activityTitleController,
                  decoration: const InputDecoration(hintText: 'Title'),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Enter your ride activity title';
                    }
                    return null;
                  },
                )),
                SizedBox(width: 8),
                ElevatedButton(
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        //  widget.addRiderActivity(_activityTitleController.text);
                        widget.addRiderActivity(RiderActivities(
                            id: 'add1',
                            uid: 'add2',
                            activityTitle: _activityTitleController.text,
                            email: 'add1'));
                        _activityTitleController.clear();
                      }
                    },
                    child: Row(
                      children: [
                        Icon(Icons.add),
                        SizedBox(width: 4),
                        Text('Add'),
                      ],
                    ))
              ],
            )),

        // Expanded(child:
        // ListView(
        //   children: [
        //     Container(
        //       decoration: new BoxDecoration(
        //           border: new Border(
        //               bottom: BorderSide(width: 1.0, color: Colors.grey))),
        //       child: ListTile(
        //         title: Text(
        //           "Fun Ride 2022",
        //           style: TextStyle(color: Colors.black, fontSize: 18.0),
        //         ),
        //         onTap: () {
        //           print("onTap called.");
        //         }, // タップ
        //         onLongPress: () {
        //           print("onLongTap called.");
        //         }, // 長押し
        //       ),
        //   ]
        //     ),
        // ),

        // Text('Activity Add '),
        // SizedBox(height: 8),
        // ElevatedButton(
        //     onPressed: () {
        //       widget.setActivityState(ActivityState.activityDetail);
        //     },
        //     child: Text('Detail')),
        // SizedBox(height: 8),
        // ElevatedButton(
        //     onPressed: () {
        //       widget.setActivityState(ActivityState.activityAdd);
        //     },
        //     child: Text('Add')),
        // SizedBox(height: 8),
        // ElevatedButton(
        //     onPressed: () {
        //       widget.setActivityState(ActivityState.activityEdit);
        //     },
        //     child: Text('Edit')),
        // SizedBox(height: 8),
        // ElevatedButton(
        //     onPressed: () {
        //       widget.setActivityState(ActivityState.activityRemove);
        //     },
        //     child: Text('Remove')),
        // SizedBox(height: 8),
      ],
    );
  }
}
