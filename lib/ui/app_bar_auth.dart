import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:ride_activity/model/status.dart';
import '../pages/auth.dart';
import '../application_state.dart';

class AppBarAuth extends StatelessWidget implements PreferredSizeWidget {
  const AppBarAuth({Key? key})
      : preferredSize = const Size.fromHeight(kToolbarHeight),
        super(key: key);
  @override
  final Size preferredSize; // default is 56.0
  Widget build(BuildContext context) {
    return AppBar(title: Text('Ride Activity'), actions: <Widget>[
      Consumer<ApplicationState>(builder: (context, appState, _) {
        return TextButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => AuthPage()),
            );
            // Navigator.of(context).pushNamed('/auth');
          },
          child: appState.loginState == ApplicationLoginState.loggedOut
              ? Text('LOGIN')
              : Text('LOGOUT'),
          style: TextButton.styleFrom(
            padding: const EdgeInsets.all(16.0),
            primary: Colors.white,
            textStyle: const TextStyle(fontSize: 16),
          ),
        );
      })
    ]);
  }
}
