import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'header_widget.dart';
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
              ConstrainedBox(
                constraints: BoxConstraints(minWidth: 300, maxWidth: 1200),
                child: Container(
                  alignment: Alignment.center,
                  padding: const EdgeInsets.all(8),
                  child: GridView.extent(
                      primary: false,
                      maxCrossAxisExtent: 300,
                      padding: const EdgeInsets.all(4),
                      mainAxisSpacing: 4,
                      crossAxisSpacing: 4,
                      shrinkWrap: true,
                      physics: NeverScrollableScrollPhysics(),
                      children: <Widget>[
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
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  const Text("Account",
                                      style: TextStyle(
                                          fontSize: 24,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.black45)),
                                  const Text("アカウント管理",
                                      style: TextStyle(
                                          fontSize: 16,
                                          fontWeight: FontWeight.normal,
                                          color: Colors.black87)),
                                ],
                              ),
                            ),
                          ),
                          color: Colors.teal[100],
                        ),
                        Container(
                          padding: const EdgeInsets.all(8),
                          child: Center(
                            child: TextButton(
                              onPressed: () {
                                Navigator.push(context, MaterialPageRoute(
                                  builder: (context) {
                                    return HomePage();
                                  },
                                ));
                              },
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  const Text("Feed",
                                      style: TextStyle(
                                          fontSize: 24,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.black45)),
                                  const Text("ライド予定",
                                      style: TextStyle(
                                          fontSize: 16,
                                          fontWeight: FontWeight.normal,
                                          color: Colors.black87)),
                                ],
                              ),
                            ),
                          ),
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
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  const Text("Activity",
                                      style: TextStyle(
                                          fontSize: 24,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.black45)),
                                  const Text("ライド一覧",
                                      style: TextStyle(
                                          fontSize: 16,
                                          fontWeight: FontWeight.normal,
                                          color: Colors.black87)),
                                ],
                              ),
                            ),
                          ),
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
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  const Text("Rider",
                                      style: TextStyle(
                                          fontSize: 24,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.black45)),
                                  const Text("ライダー情報",
                                      style: TextStyle(
                                          fontSize: 16,
                                          fontWeight: FontWeight.normal,
                                          color: Colors.black87)),
                                ],
                              ),
                            ),
                          ),
                          color: Colors.teal[400],
                        ),
                      ]),
                ),
              )
            ],
          ),
        ),
      ],
    );
  }
}
