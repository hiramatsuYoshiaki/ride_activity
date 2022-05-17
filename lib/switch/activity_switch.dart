import 'package:flutter/material.dart';
import 'package:ride_activity/application_state.dart';
import 'package:ride_activity/ui/activity_add.dart';
import 'package:ride_activity/ui/activity_detail.dart';
import 'package:ride_activity/ui/activity_display.dart';
import 'package:ride_activity/ui/activity_edit.dart';
import 'package:ride_activity/ui/activity_remove.dart';
import '../../model/status.dart';
import '../model/rider_activity.dart';
import '../model/rider_info.dart';
import '../pages/home.dart';

class ActivitySwitch extends StatelessWidget {
  const ActivitySwitch({
    Key? key,
    required this.activityState,
    required this.setActivityState,
    required this.riderActivities,
    required this.riderInfo,
    required this.addRiderActivity,
  }) : super(key: key);
  final ActivityState activityState;
  final void Function(ActivityState status) setActivityState;
  final List<RiderActivities> riderActivities;
  final RiderInfo riderInfo;
  final void Function(RiderActivities activities) addRiderActivity;

  @override
  Widget build(BuildContext context) {
    // return Container(
    //   child: Text('ActivitySwitch'),
    // );
    switch (activityState) {
      case ActivityState.display:
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Text('Display rider Activity list')
            Expanded(
                child: ActivityDisplay(
              setActivityState: setActivityState,
              riderActivities: riderActivities,
              riderInfo: riderInfo,
            )),
          ],
        );
      case ActivityState.activityDetail:
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Text('activityDetail')
            Expanded(child: ActivityDetail(setActivityState: setActivityState))
          ],
        );
      case ActivityState.activityAdd:
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Text('activityAdd')
            Expanded(
                child: ActivityAdd(
              setActivityState: setActivityState,
              addRiderActivity: addRiderActivity,
            ))
          ],
        );
      case ActivityState.activityEdit:
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(child: ActivityEdit(setActivityState: setActivityState))
            // Text('activityEdit')
          ],
        );
      case ActivityState.activityRemove:
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Text('activityRemove')
            Expanded(child: ActivityRemove(setActivityState: setActivityState))
          ],
        );
      default:
        return Column(
          children: [
            Expanded(
                child: TextButton(
              onPressed: () {
                // signOut();
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => HomePage()),
                );
              },
              child: const Text('Error go home'),
            )),
          ],
        );
    }
  }
}
