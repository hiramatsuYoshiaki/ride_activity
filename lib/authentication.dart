import 'package:flutter/material.dart';
// import 'package:ride_activity/application_state.dart';
import 'package:ride_activity/model/status.dart';
import 'model/status.dart';
import 'ui/register_form.dart';
import 'ui/email_form.dart';
import 'ui/password_form.dart';

class Authentication extends StatelessWidget {
  const Authentication(
      {required this.loginState,
      required this.login,
      required this.password,
      required this.account,
      // required this.cansel,
      required this.signout,
      required this.setLoginState,
      required this.verifyEmail,
      required this.email,
      Key? key})
      : super(key: key);
  final ApplicationLoginState loginState;
  final void Function() login;
  final void Function() password;
  final void Function() account;
  // final void Function() cancel;
  final void Function() signout;
  final void Function(ApplicationLoginState status) setLoginState;
  final String? email;

  //firebase
  final void Function(String email) verifyEmail;
  @override
  Widget build(BuildContext context) {
    switch (loginState) {
      case ApplicationLoginState.loggedOut:
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            //EmailForm(
            //  callBack: (email)=> verifyEmal(email);
            //)
            //EmailForm(
            //  callBack: (email)=> verifyEmal(
            //  email,
            //  (e) => _showErrorDialog(context, 'Invalid email', e);
            // );
            //)
            EmailForm(
              email: "",
              password: "",
              setLoginState: setLoginState,
              verifyEmail: (email) => verifyEmail(email),
            )

            // EmailForm(
            // callback: (email) => verifyEmail(
            //     email, (e) => _showErrorDialog(context, 'Invalid email', e)));

            // TextButton(
            //   onPressed: () {
            //     // login();
            //     setLoginState(ApplicationLoginState.emailAdress);
            //     // signOut();
            //     // setLoginState(loginState: ApplicationLoginState ApplicationLoginState.emailAdress);
            //   },
            //   child: const Text('login'),
            // ),
            // const SizedBox(height: 16),
            // TextButton(
            //   onPressed: () {
            //     // login();
            //     setLoginState(ApplicationLoginState.register);
            //     // signOut();
            //     // setLoginState(loginState: ApplicationLoginState ApplicationLoginState.emailAdress);
            //   },
            //   child: const Text('create account'),
            // ),
          ],
        );
      // case ApplicationLoginState.emailAdress:
      //   return Column(
      //     children: [
      //       TextButton(
      //         onPressed: () {
      //           // signOut();
      //           // password();
      //           setLoginState(ApplicationLoginState.password);
      //         },
      //         child: const Text('emailaddress enter'),
      //       ),
      //       SizedBox(height: 16),
      //       TextButton(
      //         onPressed: () {
      //           // signOut();
      //           // password();
      //           setLoginState(ApplicationLoginState.loggedOut);
      //         },
      //         child: const Text('cansel'),
      //       ),
      //     ],
      //   );
      case ApplicationLoginState.register:
        return Column(
          children: [
            RegisterForm(
              email: "",
              displayName: "",
              password: "",
              setLoginState: setLoginState,
            ),
            // SizedBox(height: 32),
            // TextButton(
            //   onPressed: () {
            //     // signOut();
            //     setLoginState(ApplicationLoginState.loggedIn);
            //   },
            //   child: const Text('register'),
            // ),
            // SizedBox(height: 16),
            // TextButton(
            //   onPressed: () {
            //     // signOut();
            //     // password();
            //     setLoginState(ApplicationLoginState.loggedOut);
            //   },
            //   child: const Text('cansel'),
            // ),
          ],
        );
      case ApplicationLoginState.password:
        return Column(
          children: [
            PasswordForm(
              email: email!,
              //login signInwithEmailPassword
            ),
            //     PasswordForm(
            //   email: email!,
            //   login: (email, password) {
            //     signInWithEmailAndPassword(email, password,
            //         (e) => _showErrorDialog(context, 'Failed to sign in', e));
            //   },
            // );

            // TextButton(
            //   onPressed: () {
            //     // account();
            //     // signOut();
            //     setLoginState(ApplicationLoginState.loggedIn);
            //   },
            //   child: const Text('password enter'),
            // ),
            // SizedBox(height: 16),
            // TextButton(
            //   onPressed: () {
            //     // signOut();
            //     // password();
            //     setLoginState(ApplicationLoginState.emailAdress);
            //   },
            //   child: const Text('cansel'),
            // ),
          ],
        );
      case ApplicationLoginState.loggedIn:
        return Column(
          children: [
            TextButton(
              onPressed: () {
                // signOut();
                // signout();
                setLoginState(ApplicationLoginState.loggedOut);
              },
              child: const Text('Logout'),
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
