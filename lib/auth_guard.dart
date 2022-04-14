import 'package:flutter/material.dart';
import 'package:ride_activity/model/status.dart';

class AuthGuard extends StatelessWidget {
  final ApplicationLoginState loginState;
  final Widget guard;
  final Widget child;
  AuthGuard({
    required this.loginState,
    required this.guard,
    required this.child,
    Key? key,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    // return Scaffold(
    //     body: Center(
    //   child: Column(
    //     mainAxisAlignment: MainAxisAlignment.center,
    //     children: [
    //       const Text('Auth Guard'),
    //     ],
    //   ),
    // ));
    if (loginState == ApplicationLoginState.loggedIn) {
      return child;
    }
    return guard;
  }
}
