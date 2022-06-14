import 'package:flutter/material.dart';
import 'package:ride_activity/ui/home_display.dart';

import '../model/rider_activity.dart';
import '../model/status.dart';
import '../pages/home.dart';
import '../ui/home_detail.dart';

class HomeSwitch extends StatelessWidget {
  const HomeSwitch({
    Key? key,
    required this.homeState,
    required this.setHomeState,
    // required this.setHomeSelectedActivity
  }) : super(key: key);
  final HomeState homeState;
  final void Function(HomeState status) setHomeState;
  // final void Function(Activities activity,HomeState status) setHomeSelectedActivity;

  @override
  Widget build(BuildContext context) {
    // return Container(
    //   child: Text('Home Switch'),
    switch (homeState) {
      case HomeState.display:
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [Expanded(child: HomeDisplay())],
        );
      case HomeState.homeDetail:
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [Expanded(child: HomeDetail())],
        );
      case HomeState.homeParticipation:
        return Text('Participation');
      default:
        return Column(
          children: [
            Expanded(
                child: TextButton(
              onPressed: () {
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
