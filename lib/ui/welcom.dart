import 'package:flutter/material.dart';
import 'header_widget.dart';
import '../model/status.dart';
import '../pages/home.dart';

class Welcom extends StatefulWidget {
  const Welcom({Key? key, required this.user, required this.setLoginState})
      : super(key: key);
  final String? user;
  final void Function(ApplicationLoginState status) setLoginState;

  @override
  _WelcomState createState() => _WelcomState();
}

class _WelcomState extends State<Welcom> {
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
                  title: 'WELCOM',
                  img: 'undraw_in_real_life_v8fk.png',
                  subTitle: '${widget.user}',
                  discription: 'ログインしています。'),
              const SizedBox(height: 16),
              ElevatedButton(
                  onPressed: () {
                    // widget
                    //     .setLoginState(ApplicationLoginState.loggedOut);
                    // Navigator.pop(context);
                    // Navigator.of(context).pushNamed("/home");
                    widget.setLoginState(ApplicationLoginState.loggedIn);
                    Navigator.of(context)
                        .push(MaterialPageRoute(builder: (context) {
                      return HomePage();
                    }));
                  },
                  child: const Text('START')),
              const SizedBox(height: 32),
              TextButton(
                  onPressed: () {
                    widget.setLoginState(ApplicationLoginState.loggedIn);
                  },
                  child: const Text('LOGOUT')),
            ],
          ),
        ),
      ],
    );
  }
}
