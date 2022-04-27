import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:ride_activity/model/status.dart';
import '../ui/app_bar_auth.dart';
import '../ui/app_bar_bottom.dart';
import '../application_state.dart';

class ActivityPage extends StatelessWidget {
  const ActivityPage({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarAuth(),
      body: Column(
        children: [
          Text('ActivityPage'),
          Consumer<ApplicationState>(builder: (context, appState, _) {
            return Text(appState.getCurrentUser!.displayName.toString());
            // return ElevatedButton(
            //     onPressed: () {
            //       appState.signOut();
            //       appState.setLoginState(ApplicationLoginState.loggedOut);
            //       Navigator.push(context, MaterialPageRoute(
            //         builder: (context) {
            //           return HomePage();
            //         },
            //       ));
            //     },
            //     child: const Text('LOGOUT'));
          }),
        ],
      ),
      bottomNavigationBar: AppBarBottom(),
    );
  }
}
