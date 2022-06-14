import 'package:flutter/material.dart';

import '../model/rider_activity.dart';

class ActivityGarminmap extends StatelessWidget {
  const ActivityGarminmap({
    Key? key,
    required this.selectedActivity,
  }) : super(key: key);
  final Activities selectedActivity;

  @override
  Widget build(BuildContext context) {
    return Container(child: Text(selectedActivity.plan.activityTitle));
  }
}
