import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:ride_activity/model/status.dart';
import 'package:ride_activity/pages/home.dart';
import 'package:ride_activity/ui/app_bar_auth.dart';
import '../ui/app_bar_auth.dart';
import '../application_state.dart';

class LogoutPage extends StatelessWidget {
  const LogoutPage({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarAuth(
        titleText: 'Logout',
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Consumer<ApplicationState>(builder: (context, appState, _) {
              return ElevatedButton(
                  onPressed: () {
                    appState.signOut();
                    appState.setLoginState(ApplicationLoginState.loggedOut);
                    Navigator.push(context, MaterialPageRoute(
                      builder: (context) {
                        return HomePage();
                      },
                    ));
                  },
                  child: const Text('LOGOUT'));
            }),
          ],
        ),
      ),
    );
  }
}
