import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:ride_activity/model/status.dart';
import '../pages/auth.dart';
import '../pages/logout.dart';
import '../application_state.dart';

class AppBarAuth extends StatelessWidget implements PreferredSizeWidget {
  const AppBarAuth({Key? key, required this.titleText})
      : preferredSize = const Size.fromHeight(kToolbarHeight),
        super(key: key);
  final String titleText;
  @override
  final Size preferredSize; // default is 56.0
  Widget build(BuildContext context) {
    return AppBar(
        // title: Text('Ride Activity',
        title: Text(titleText,
            style: Theme.of(context)
                .textTheme
                .headline5
                ?.copyWith(color: Colors.white)),
        actions: <Widget>[
          Consumer<ApplicationState>(builder: (context, appState, _) {
            return (appState.getCurrentUser != null)
                ? TextButton(
                    onPressed: () {
                      // Navigator.of(context).pushNamed('/login');
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => LogoutPage()),
                      );
                    },
                    child: Text(
                      'LOGOUT',
                      style: TextStyle(color: Colors.white),
                    ))
                : TextButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => AuthPage()),
                      );
                    },
                    child:
                        Text('LOGIN', style: TextStyle(color: Colors.white)));
          })
        ]);
  }
}
