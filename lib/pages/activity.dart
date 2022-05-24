import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:ride_activity/switch/activity_switch.dart';
import '../ui/app_bar_auth.dart';
import '../ui/app_bar_bottom.dart';
import '../application_state.dart';
import '../switch/activity_switch.dart';

class ActivityPage extends StatelessWidget {
  const ActivityPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const AppBarAuth(
        titleText: 'Activity',
      ),
      body: Center(
          child: ConstrainedBox(
        constraints: BoxConstraints(maxWidth: 1200),
        child: Container(
          padding: const EdgeInsets.all(8),
          color: Colors.green[100],
          alignment: Alignment.center,
          child: Column(
            children: [
              Expanded(
                  child: Consumer<ApplicationState>(
                      builder: (BuildContext context, appState, _) =>
                          ActivitySwitch(
                              activityState: appState.activityState,
                              setActivityState: appState.setActivityState,
                              //rideActivities--->activities
                              // riderActivities: appState.riderActivities,
                              activities: appState.activities,

                              //
                              riderInfo: appState.riderInfo,
                              //addRiderActivity-->addActivity
                              // addRiderActivity: appState.addRiderActivity,
                              addActivity: appState.addActivity,
                              setSelectedActivity: appState.setSelectedActivity,
                              selectedActivity: appState.selectActivity,
                              setActual: appState.setActual)))
              // Consumer<ApplicationState>(
              //   builder: (context, appState, _) => UserProfile(
              //         profileState: appState.profileState,
              //         currentUser: appState.getCurrentUser,
              //         setProfileState: appState.setProfileState,
              //         updateDisplayName: appState.updateDisplayName,
              //         updateEmail: appState.updateEmail,
              //         accountDelete: appState.accountDelete,
              //       )),

              // const Text('Consumer activity_contents'),
            ],
          ),
        ),
      )),
      bottomNavigationBar: const AppBarBottom(),
    );
  }
}

// class ActivityPage extends StatelessWidget {
//   const ActivityPage({Key? key}) : super(key: key);
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBarAuth(
//         titleText: 'Activity',
//       ),

//       body: Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           Container(
//             alignment: Alignment.center,
//             padding: const EdgeInsets.all(8),
//             child: const Text("Container width: 600 height: 300"),
//             color: Colors.purple[100],
//             width: 600.0,
//             height: 300.0,
//           ),
//           ConstrainedBox(
//             constraints: BoxConstraints(maxWidth: 300),
//             child: Container(
//               padding: const EdgeInsets.all(8),
//               child: const Text(
//                   "ConstrainedBox maxWidth: 300------------------------------------------------------------------------------------------------------------------------------"),
//               color: Colors.purple[200],
//             ),
//           ),
//           ConstrainedBox(
//             constraints: BoxConstraints(minWidth: 300, maxWidth: 600),
//             child: Container(
//               padding: const EdgeInsets.all(8),
//               child: const Text("ConstrainedBox minWidth: 300, maxWidth: 600"),
//               color: Colors.purple[300],
//             ),
//           ),
//           //expand
//           ConstrainedBox(
//             constraints: BoxConstraints.expand(height: 100),
//             child: Container(
//               padding: const EdgeInsets.all(8),
//               child: const Text(
//                   "BoxConstraints.expand(height: 100) 指定したプロパティはその長さで固定され、未指定のプロパティはできる限り広がります。"),
//               color: Colors.purple[400],
//             ),
//           ),
//           ConstrainedBox(
//             constraints: BoxConstraints.loose(const Size(600.0, 100.0)),
//             child: Container(
//               padding: const EdgeInsets.all(8),
//               child: const Text(
//                   "BoxConstraints.loose(const Size(600.0, 100.0) 最大値よりも親Widgetが小さい場合はサイズがマックス【0.0】まで小さくなります。"),
//               color: Colors.purple[500],
//             ),
//           ),
//           Flexible(
//             child: Container(
//               padding: const EdgeInsets.all(8),
//               child: const Text("He'd have you all unravel at the"),
//               color: Colors.red[100],
//             ),
//           ),
//           Expanded(
//             child: Container(
//               padding: const EdgeInsets.all(8),
//               child: const Text("He'd have you all unravel at the"),
//               color: Colors.yellow[100],
//             ),
//           ),
//           Container(
//             padding: const EdgeInsets.all(8),
//             child: const Text("He'd have you all unravel at the"),
//             color: Colors.teal[100],
//           ),
//           Container(
//             padding: const EdgeInsets.all(8),
//             child: const Text('Heed not the rabble'),
//             color: Colors.teal[200],
//           ),
//           Container(
//             padding: const EdgeInsets.all(8),
//             child: const Text('Sound of screams but the'),
//             color: Colors.teal[300],
//           ),
//           Container(
//             padding: const EdgeInsets.all(8),
//             child: const Text(
//                 'Who scream aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa'),
//             color: Colors.teal[400],
//           ),
//         ],
//       ),
//       bottomNavigationBar: AppBarBottom(),
//     );
//   }
// }
