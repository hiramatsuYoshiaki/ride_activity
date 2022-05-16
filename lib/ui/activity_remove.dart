import 'package:flutter/material.dart';
import 'package:ride_activity/model/status.dart';

class ActivityRemove extends StatefulWidget {
  const ActivityRemove({
    Key? key,
    required this.setActivityState,
  }) : super(key: key);
  final void Function(ActivityState status) setActivityState;

  @override
  _ActivityRemoveState createState() => _ActivityRemoveState();
}

class _ActivityRemoveState extends State<ActivityRemove> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('Activity Remove '),
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
