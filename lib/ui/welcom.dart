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
                  title: 'EMAIL VERIFY',
                  img: 'undraw_Personal_email_re_4lx7.png',
                  subTitle: '${widget.user}',
                  discription: 'メールの認証をしてください。'),
              const SizedBox(height: 16),
              // Padding(
              //   padding: const EdgeInsets.symmetric(horizontal: 32),
              //   child: Row(
              //     mainAxisAlignment: MainAxisAlignment.end,
              //     children: [
              //       ElevatedButton(
              //           onPressed: () {
              //             widget.setLoginState(ApplicationLoginState.loggedOut);
              //           },
              //           child: const Text('キャンセル')),
              //       const SizedBox(width: 16),
              //       ElevatedButton(
              //           onPressed: () {
              //             if (_formKey.currentState!.validate()) {
              //               widget.registerAccount(
              //                 _emailController.text,
              //                 _displayNameController.text,
              //                 _passwordController.text,
              //               );
              //             }
              //           },
              //           child: const Text('アカウント作成')),
              //       const SizedBox(width: 30),
              //     ],
              //   ),
              // ),

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
