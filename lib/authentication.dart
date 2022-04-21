import 'package:flutter/material.dart';
// import 'package:ride_activity/application_state.dart';
import 'package:ride_activity/model/status.dart';
import 'package:ride_activity/ui/logged_in.dart';
import 'model/status.dart';
import 'ui/register_form.dart';
import 'ui/email_form.dart';
import 'ui/password_form.dart';
import 'ui/welcom.dart';

class Authentication extends StatelessWidget {
  const Authentication(
      {required this.loginState,
      required this.verifyEmail,
      required this.email,
      required this.signInWithEmailAndPassword,
      required this.registerAccount,
      required this.signOut,
      required this.setLoginState,
      required this.user,
      Key? key})
      : super(key: key);
  final ApplicationLoginState loginState;

  final String? email;
  final void Function(String email, String password) signInWithEmailAndPassword;
  final void Function(String emai, String displayName, String password)
      registerAccount;
  final void Function() signOut;
  final void Function(ApplicationLoginState status) setLoginState;
  final String? user;

  //firebase
  final void Function(String email) verifyEmail;
  @override
  Widget build(BuildContext context) {
    switch (loginState) {
      case ApplicationLoginState.loggedOut:
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            EmailForm(
              // email: "",
              // password: "",
              setLoginState: setLoginState,
              verifyEmail: (email) => verifyEmail(email),
            )
          ],
        );
      case ApplicationLoginState.register:
        return Column(
          children: [
            RegisterForm(
              email: "",
              displayName: "",
              password: "",
              registerAccount: registerAccount,
              setLoginState: setLoginState,
            ),
          ],
        );
      case ApplicationLoginState.password:
        return Column(
          children: [
            PasswordForm(
              email: email!,
              // login: (email, password) {
              //   signInWithEmailAndPassword(email, password);
              // }),
              login: signInWithEmailAndPassword,
              setLoginState: setLoginState,
            ),
          ],
        );
      case ApplicationLoginState.welcom:
        return Column(
          children: [
            Welcom(
              user: user,
              setLoginState: setLoginState,
            ),
          ],
        );
      case ApplicationLoginState.loggedIn:
        return Column(
          children: [
            LoggedIn(
              user: user,
              signOut: signOut,
            ),
          ],
        );
      default:
        return Column(
          children: [
            TextButton(
              onPressed: () {
                // signOut();
              },
              child: const Text('Error go home'),
            ),
          ],
        );
    }
  }
}
