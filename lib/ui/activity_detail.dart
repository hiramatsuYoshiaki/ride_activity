import 'package:flutter/material.dart';

import '../model/status.dart';

class ActivityDetail extends StatefulWidget {
  const ActivityDetail({
    Key? key,
    required this.setActivityState,
  }) : super(key: key);
  final void Function(ActivityState status) setActivityState;

  @override
  _ActivityDetailState createState() => _ActivityDetailState();
}

class _ActivityDetailState extends State<ActivityDetail> {
  @override
  Widget build(BuildContext context) {
    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      Text('Activity Detail '),
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
    ]);
  }
}
