import 'package:flutter/material.dart';
import 'package:ride_activity/model/status.dart';

class ActivityDone extends StatefulWidget {
  const ActivityDone({
    Key? key,
    required this.setActivityState,
  }) : super(key: key);
  final void Function(ActivityState status) setActivityState;

  @override
  _ActivityDoneState createState() => _ActivityDoneState();
}

class _ActivityDoneState extends State<ActivityDone> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('Activity Done '),
        SizedBox(height: 8),
        ElevatedButton(onPressed: () {}, child: Text('done')),
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
