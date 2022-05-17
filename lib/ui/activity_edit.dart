import 'package:flutter/material.dart';
import 'package:ride_activity/model/status.dart';

class ActivityEdit extends StatefulWidget {
  const ActivityEdit({
    Key? key,
    required this.setActivityState,
  }) : super(key: key);
  final void Function(ActivityState status) setActivityState;

  @override
  _ActivityEditState createState() => _ActivityEditState();
}

class _ActivityEditState extends State<ActivityEdit> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('Activity Edit '),
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
        SizedBox(height: 8),
        ElevatedButton(
            onPressed: () {
              widget.setActivityState(ActivityState.display);
            },
            child: Text('List')),
      ],
    );
  }
}
