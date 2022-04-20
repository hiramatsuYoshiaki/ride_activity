import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:ride_activity/authentication.dart';
// import 'package:ride_activity/model/status.dart';
import 'package:ride_activity/ui/app_bar_auth.dart';
import '../ui/app_bar_auth.dart';
import '../application_state.dart';
// import '../model/status.dart';

class AuthPage extends StatelessWidget {
  const AuthPage({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarAuth(),
      body: ListView(
        children: [
          Consumer<ApplicationState>(
              builder: (context, appState, _) => Authentication(
                    loginState: appState.loginState,
                    password: appState.password,
                    account: appState.account,
                    signout: appState.signout,
                    setLoginState: appState.setLoginState,
                    verifyEmail: appState.verifyEmail,
                    email: appState.email,
                    login: appState.login,
                  )),
          // Consumer<ApplicationState>(builder: (context, appState, _) {
          //   return appState.getUser == ""
          //       ? TextButton(
          //           onPressed: () {
          //             appState.setUser(user: 'test_user');
          //           },
          //           child: Text('LOGIN'))
          //       : TextButton(
          //           onPressed: () {
          //             appState.setUser(user: '');
          //           },
          //           child: Text('LOGOUT'));
          // })
        ],
      ),
    );
  }
}
