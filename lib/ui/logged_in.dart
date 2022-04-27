import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'header_widget.dart';
// import '../model/status.dart';
import '../pages/home.dart';
import '../pages/activity.dart';
import '../pages/account.dart';
import '../pages/rider.dart';

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

              Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  GridView.extent(
                      maxCrossAxisExtent: 300,
                      padding: const EdgeInsets.all(4),
                      mainAxisSpacing: 4,
                      crossAxisSpacing: 4,
                      shrinkWrap: true,
                      physics: NeverScrollableScrollPhysics(),
                      children: <Widget>[
                        Container(
                          padding: const EdgeInsets.all(8),
                          color: Colors.teal[100],
                          child: Center(
                              child: TextButton(
                                  onPressed: () {
                                    Navigator.push(context, MaterialPageRoute(
                                      builder: (context) {
                                        return HomePage();
                                      },
                                    ));
                                  },
                                  child: const Text("Home Feed",
                                      style: TextStyle(fontSize: 24)))
                              //     child: const Text(
                              //   "Account",
                              //   style: TextStyle(fontSize: 24),
                              // )

                              ),
                        ),
                        Container(
                          padding: const EdgeInsets.all(8),
                          child: Center(
                              child: TextButton(
                                  onPressed: () {
                                    Navigator.push(context, MaterialPageRoute(
                                      builder: (context) {
                                        return AccountPage();
                                      },
                                    ));
                                  },
                                  child: const Text("Account",
                                      style: TextStyle(fontSize: 24)))),
                          color: Colors.teal[200],
                        ),
                        Container(
                          padding: const EdgeInsets.all(8),
                          child: Center(
                              child: TextButton(
                                  onPressed: () {
                                    Navigator.push(context, MaterialPageRoute(
                                      builder: (context) {
                                        return ActivityPage();
                                      },
                                    ));
                                  },
                                  child: const Text("Activity",
                                      style: TextStyle(fontSize: 24)))),
                          color: Colors.teal[300],
                        ),
                        Container(
                          padding: const EdgeInsets.all(8),
                          child: Center(
                              child: TextButton(
                                  onPressed: () {
                                    Navigator.push(context, MaterialPageRoute(
                                      builder: (context) {
                                        return RiderPage();
                                      },
                                    ));
                                  },
                                  child: const Text("Rider",
                                      style: TextStyle(fontSize: 24)))),
                          color: Colors.teal[400],
                        ),
                      ]),
                ],
              )

              // ElevatedButton(
              //     onPressed: () {
              //       // widget
              //       //     .setLoginState(ApplicationLoginState.loggedOut);
              //       // Navigator.pop(context);
              //       // Navigator.of(context).pushNamed("/home");
              //       Navigator.of(context)
              //           .push(MaterialPageRoute(builder: (context) {
              //         return AccountPage();
              //       }));
              //     },
              //     child: const Text('ACCOUNT')),
              // const SizedBox(height: 32),
              // ElevatedButton(
              //     onPressed: () {
              //       // widget
              //       //     .setLoginState(ApplicationLoginState.loggedOut);
              //       // Navigator.pop(context);
              //       // Navigator.of(context).pushNamed("/home");
              //       Navigator.of(context)
              //           .push(MaterialPageRoute(builder: (context) {
              //         return HomePage();
              //       }));
              //     },
              //     child: const Text('HOME')),
              // const SizedBox(height: 32),
              // ElevatedButton(
              //     onPressed: () {
              //       // widget
              //       //     .setLoginState(ApplicationLoginState.loggedOut);
              //       // Navigator.pop(context);
              //       // Navigator.of(context).pushNamed("/home");
              //       Navigator.of(context)
              //           .push(MaterialPageRoute(builder: (context) {
              //         return ActivityPage();
              //       }));
              //     },
              //     child: const Text('ACTIVITY')),
              // const SizedBox(height: 32),
              // ElevatedButton(
              //     onPressed: () {
              //       widget.signOut();
              //     },
              //     child: const Text('LOGOUT'))
            ],
          ),
        ),
      ],
    );
  }
}
