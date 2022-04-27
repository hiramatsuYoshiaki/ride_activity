import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:ride_activity/pages/auth.dart';
import '../pages/home.dart';
import '../pages/rider.dart';
import '../pages/account.dart';
import '../pages/activity.dart';
import '../application_state.dart';

class AppBarBottom extends StatelessWidget {
  const AppBarBottom({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return BottomAppBar(
      color: Colors.blue[600],
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: <Widget>[
          IconButton(
            tooltip: 'Home',
            icon: const Icon(
              Icons.home,
              color: Colors.white,
            ),
            onPressed: () {
              // Navigator.push(
              //   context,
              //   MaterialPageRoute(
              //     builder: (context) {
              //       return HomePage();
              //     },
              //   ),
              // );
              Navigator.of(context).pushNamed('/home');
            },
          ),
          IconButton(
            tooltip: 'Activity',
            icon: const Icon(
              Icons.directions_bike,
              color: Colors.white,
            ),
            onPressed: () {
              // Navigator.push(
              //   context,
              //   MaterialPageRoute(
              //     builder: (context) {
              //       return HomePage();
              //     },
              //   ),
              // );
              Navigator.of(context).pushNamed('/activity');
            },
          ),
          IconButton(
            tooltip: 'Account',
            icon: const Icon(
              Icons.account_circle,
              color: Colors.white,
            ),
            onPressed: () {
              // Navigator.push(
              //   context,
              //   MaterialPageRoute(
              //     builder: (context) {
              //       return HomePage();
              //     },
              //   ),
              // );
              Navigator.of(context).pushNamed('/account');
            },
          ),

          // Consumer<ApplicationState>(builder: (context, appState, _) {
          //   return appState.getCurrentUser != null
          //       ? IconButton(
          //           tooltip: 'Account',
          //           icon: const Icon(
          //             Icons.account_circle,
          //             color: Colors.white,
          //           ),
          //           onPressed: () {
          //             Navigator.push(
          //               context,
          //               MaterialPageRoute(
          //                 builder: (context) {
          //                   return AccountPage();
          //                 },
          //               ),
          //               // Navigator.of(context).pushNamed('/home');
          //             );
          //           },
          //         )
          //       : Text('');
          // }),
          // Consumer<ApplicationState>(builder: (context, appState, _) {
          //   return appState.getCurrentUser != null
          //       ? IconButton(
          //           tooltip: 'Account',
          //           icon: const Icon(
          //             Icons.directions_bike,
          //             color: Colors.white,
          //           ),
          //           onPressed: () {
          //             Navigator.push(
          //               context,
          //               MaterialPageRoute(
          //                 builder: (context) {
          //                   return ActivityPage();
          //                 },
          //               ),
          //               // Navigator.of(context).pushNamed('/home');
          //             );
          //           },
          //         )
          //       : Text('');
          // }),
          // Consumer<ApplicationState>(builder: (context, appState, _) {
          //   return IconButton(
          //     tooltip: 'Account',
          //     icon: const Icon(
          //       Icons.account_circle,
          //       color: Colors.white,
          //     ),
          //     onPressed: () {
          //       Navigator.push(
          //         context,
          //         MaterialPageRoute(
          //           builder: (context) {
          //             return appState.getCurrentUser == null
          //                 ? AuthPage()
          //                 : AccountPage();
          //           },
          //         ),
          //         // Navigator.of(context).pushNamed('/home');
          //       );
          //     },
          //   );
          // }),
        ],
      ),
    );
  }
}
