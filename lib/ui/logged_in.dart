import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'header_widget.dart';
import '../model/status.dart';
import '../pages/home.dart';

class LoggedIn extends StatefulWidget {
  const LoggedIn({Key? key, required this.user, required this.signOut})
      : super(key: key);
  final User? user;
  final void Function() signOut;
  @override
  _LoggedInState createState() => _LoggedInState();
}

class _LoggedInState extends State<LoggedIn> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              HeaderAuthWidget(
                  title: 'RIDE ACTIVITY',
                  img: 'undraw_biking_kc4f.png',
                  subTitle: '${widget.user?.displayName}さん',
                  discription: 'ようこそ！'),
              const SizedBox(height: 16),
              ElevatedButton(
                  onPressed: () {
                    // widget
                    //     .setLoginState(ApplicationLoginState.loggedOut);
                    // Navigator.pop(context);
                    // Navigator.of(context).pushNamed("/home");
                    Navigator.of(context)
                        .push(MaterialPageRoute(builder: (context) {
                      return HomePage();
                    }));
                  },
                  child: const Text('START')),
              const SizedBox(height: 32),
              ElevatedButton(
                  onPressed: () {
                    widget.signOut();
                  },
                  child: const Text('LOGOUT'))
            ],
          ),
        ),
      ],
    );
  }
}
