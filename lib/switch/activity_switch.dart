import 'package:flutter/material.dart';
// import 'package:ride_activity/application_state.dart';
import 'package:ride_activity/ui/activity_add.dart';
import 'package:ride_activity/ui/activity_detail.dart';
import 'package:ride_activity/ui/activity_display.dart';
import 'package:ride_activity/ui/activity_done.dart';
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
    // required this.riderActivities,
    required this.activities,
    required this.riderInfo,
    // required this.addRiderActivity,
    required this.addActivity,
    required this.setSelectedActivity,
    required this.selectedActivity,
  }) : super(key: key);
  final ActivityState activityState;
  final void Function(ActivityState status) setActivityState;
  // final List<RiderActivities> riderActivities;
  final List<Activities> activities;
  final RiderInfo riderInfo;
  // final void Function(RiderActivities activities) addRiderActivity;
  final void Function(Activities activities) addActivity;
  final void Function(Activities activity, ActivityState status)
      setSelectedActivity;
  final Activities selectedActivity;

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
                    // riderActivities: riderActivities,
                    activities: activities,
                    riderInfo: riderInfo,
                    setSelectedActivity: setSelectedActivity)),
          ],
        );
      case ActivityState.activityDetail:
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Text('activityDetail')
            Expanded(
                child: ActivityDetail(
                    setActivityState: setActivityState,
                    selectedActivity: selectedActivity))
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
              // addRiderActivity: addRiderActivity,
              addActivity: addActivity,
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
      case ActivityState.activityDone:
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Text('activityRemove')
            Expanded(child: ActivityDone(setActivityState: setActivityState))
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
