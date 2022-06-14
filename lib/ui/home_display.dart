import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../application_state.dart';
import '../component/activity_list.dart';

class HomeDisplay extends StatelessWidget {
  const HomeDisplay({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<ApplicationState>(
        builder: (BuildContext context, appState, _) {
      return ListView.builder(
          itemCount: appState.activities.length,
          itemBuilder: (BuildContext context, int index) {
            return Column(children: [
              // Text(appState.activities[index].plan.activityTitle),
              ActivityList(
                  selectedActivity: appState.activities[index],
                  setHomeSelectedActivity: appState.setHomeSelectedActivity),
            ]);
          });
    });
  }
}
