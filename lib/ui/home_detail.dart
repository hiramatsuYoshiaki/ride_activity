import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../application_state.dart';
import '../component/activity_garminmap.dart';
import '../component/actual_detail.dart';
import '../component/plan_detail.dart';
import '../model/status.dart';

class HomeDetail extends StatefulWidget {
  const HomeDetail({Key? key}) : super(key: key);

  @override
  _HomeDetailState createState() => _HomeDetailState();
}

class _HomeDetailState extends State<HomeDetail> {
  @override
  Widget build(BuildContext context) {
    // return Container(child: Text('HomeDetail '));
    return Consumer<ApplicationState>(
        builder: (BuildContext context, appState, _) {
      return SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            ActivityGarminmap(selectedActivity: appState.selectActivity),
            SizedBox(height: 16),
            appState.selectActivity.plan.done
                ? Container(
                    alignment: Alignment.topLeft,
                    child:
                        ActualDetail(selectedActivity: appState.selectActivity),
                  )
                : Container(
                    alignment: Alignment.topLeft,
                    child:
                        PlanDetail(selectedActivity: appState.selectActivity),
                  ),
            SizedBox(height: 16),
            Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child:
                    Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                  ElevatedButton(
                      onPressed: () {
                        appState.setHomeState(HomeState.display);
                      },
                      child: Text('Back')),
                  SizedBox(width: 4),
                ])),
            SizedBox(height: 32),
          ],
        ),
      );
    });
  }
}
