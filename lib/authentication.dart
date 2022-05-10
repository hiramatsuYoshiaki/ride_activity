import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
// import 'package:ride_activity/application_state.dart';
import 'package:ride_activity/model/status.dart';
import 'package:ride_activity/pages/home.dart';
import 'package:ride_activity/ui/logged_in.dart';
import 'model/status.dart';
import 'ui/register_form.dart';
import 'ui/email_form.dart';
import 'ui/password_form.dart';
import 'ui/welcom.dart';
import 'ui/pass_reset.dart';

class Authentication extends StatelessWidget {
  const Authentication(
      {required this.loginState,
      required this.verifyEmail,
      required this.email,
      required this.signInWithEmailAndPassword,
      required this.registerAccount,
      required this.signOut,
      required this.setLoginState,
      // required this.user,
      required this.currentUser,
      required this.sendEmailVerification,
      required this.passReset,
      Key? key})
      : super(key: key);
  final ApplicationLoginState loginState;

  final String? email;
  // final void Function(String email, String password) signInWithEmailAndPassword;
  final User? currentUser;
  final void Function(
    String email,
    String password,
    void Function(Exception e) error,
  ) signInWithEmailAndPassword;
  // final void Function(String emai, String displayName, String password)
  //     registerAccount;
  final void Function(
    String email,
    String displayName,
    String password,
    void Function(Exception e) error,
  ) registerAccount;
  final void Function() signOut;
  final void Function(ApplicationLoginState status) setLoginState;
  // final String? user;

  //firebase
  final void Function(String email) verifyEmail;
  //sendEmailVerification
  final void Function(void Function(Exception e) error) sendEmailVerification;
  //passReset
  final void Function(String email, void Function(Exception e) error) passReset;
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
              // registerAccount: registerAccount,
              registerAccount: (email, displayName, password) {
                registerAccount(
                    email,
                    displayName,
                    password,
                    (e) => _showErrorDialog(
                        context, 'Failed to create account', e));
              },
              setLoginState: setLoginState,
            ),
          ],
        );
      case ApplicationLoginState.password:
        return Column(
          children: [
            PasswordForm(
              email: email!,
              login: (email, password) {
                signInWithEmailAndPassword(email, password,
                    (e) => _showErrorDialog(context, 'Failed to sign in', e));
              },
              // login: signInWithEmailAndPassword,
              setLoginState: setLoginState,
            ),
          ],
        );
      case ApplicationLoginState.welcom:
        return Column(
          children: [
            Welcom(
              // user: user,
              sendEmailVerification: () {
                sendEmailVerification(
                    (e) => _showErrorDialog(context, 'Failed Send Email', e));
              },
              currentUser: currentUser,
              setLoginState: setLoginState,
            ),
          ],
        );

      case ApplicationLoginState.loggedIn:
        return Column(
          children: [
            LoggedIn(
              user: currentUser,
              signOut: signOut,
            ),
          ],
        );
      case ApplicationLoginState.passReset:
        return Column(
          children: [
            PassReset(
              email: email!,
              passReset: (email) {
                passReset(
                    email,
                    (e) => _showErrorDialog(
                        context, 'Failed ResetPassword Send Email', e));
              },
              setLoginState: setLoginState,
            ),
          ],
        );
      default:
        return Column(
          children: [
            TextButton(
              onPressed: () {
                // signOut();
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => HomePage()),
                );
              },
              child: const Text('Error go home'),
            ),
          ],
        );
    }
  }
}

void _showErrorDialog(BuildContext context, String title, Exception e) {
  showDialog<void>(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text(
            title,
            style: const TextStyle(fontSize: 24),
          ),
          content: SingleChildScrollView(
            child: ListBody(
              children: <Widget>[
                Text(
                  '${(e as dynamic).message}',
                  style: const TextStyle(fontSize: 18),
                )
              ],
            ),
          ),
          actions: <Widget>[
            ElevatedButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text('OK'),
            ),
          ],
        );
      });
}
