import 'package:flutter/material.dart';
import 'package:ride_activity/application_state.dart';
import 'package:ride_activity/ui/activity_display.dart';
import '../../model/status.dart';
import '../pages/home.dart';

class ActivitySwitch extends StatelessWidget {
  const ActivitySwitch({
    Key? key,
    required this.activityState,
    required this.setActivityState,
    required this.riderActivities,
    // required this.riderInfo,
  }) : super(key: key);
  final ActivityState activityState;
  final void Function(ActivityState status) setActivityState;
  final List<RiderActivities> riderActivities;
  // final RiderInfo riderInfo;

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
            ActivityDisplay(
              setActivityState: setActivityState,
              riderActivities: riderActivities,
              // riderInfo: riderActivities,
            ),
          ],
        );
      case ActivityState.activityDetail:
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [Text('activityDetail')],
        );
      case ActivityState.activityAdd:
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [Text('activityAdd')],
        );
      case ActivityState.activityEdit:
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [Text('activityEdit')],
        );
      case ActivityState.activityRemove:
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [Text('activityRemove')],
        );
      default:
        return Column(
          children: [
            TextButton(
              onPressed: () {
                // signOut();
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => HomePage()),
                );
              },
              child: const Text('Error go home'),
            ),
          ],
        );
    }
  }
}
