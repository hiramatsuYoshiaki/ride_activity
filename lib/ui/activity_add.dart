import 'package:flutter/material.dart';
import 'package:ride_activity/model/status.dart';

class ActivityAdd extends StatefulWidget {
  const ActivityAdd({
    Key? key,
    required this.setActivityState,
  }) : super(key: key);
  final void Function(ActivityState status) setActivityState;

  @override
  _ActivityAddState createState() => _ActivityAddState();
}

class _ActivityAddState extends State<ActivityAdd> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('Activity Add '),
        SizedBox(height: 8),
        ElevatedButton(
            onPressed: () {
              widget.setActivityState(ActivityState.activityDetail);
            },
            child: Text('Detail')),
        SizedBox(height: 8),
        ElevatedButton(
            onPressed: () {
              widget.setActivityState(ActivityState.activityAdd);
            },
            child: Text('Add')),
        SizedBox(height: 8),
        ElevatedButton(
            onPressed: () {
              widget.setActivityState(ActivityState.activityEdit);
            },
            child: Text('Edit')),
        SizedBox(height: 8),
        ElevatedButton(
            onPressed: () {
              widget.setActivityState(ActivityState.activityRemove);
            },
            child: Text('Remove')),
      ],
    );
  }
}
