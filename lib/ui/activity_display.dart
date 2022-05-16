import 'package:flutter/material.dart';
import 'package:ride_activity/application_state.dart';
import 'package:ride_activity/model/status.dart';

class ActivityDisplay extends StatefulWidget {
  const ActivityDisplay({
    Key? key,
    required this.setActivityState,
    required this.riderActivities,
    // required this.riderInfo,
  }) : super(key: key);
  final void Function(ActivityState status) setActivityState;
  final List<RiderActivities> riderActivities;
  // final RiderInfo riderInfo;

  @override
  _ActivityDisplayState createState() => _ActivityDisplayState();
}

class _ActivityDisplayState extends State<ActivityDisplay> {
  @override
  Widget build(BuildContext context) {
    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      Text('Activity Display '),
      SizedBox(height: 8),
      Text('Activity Rider Info '),
      SizedBox(height: 8),
      Text('Activity Rider Activity '),
      for (var activity in widget.riderActivities)
        Text('${activity.activityTitle}'),
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
    ]);
  }
}
