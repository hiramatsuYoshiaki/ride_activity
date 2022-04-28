import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:ride_activity/model/status.dart';
import 'package:ride_activity/ui/app_bar_bottom.dart';
import '../ui/app_bar_auth.dart';
import '../ui/app_bar_bottom.dart';
import '../application_state.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarAuth(
        titleText: 'Feed',
      ),
      body:
          // Flexible(
          //   child:
          GridView.extent(
              maxCrossAxisExtent: 300,
              padding: const EdgeInsets.all(4),
              mainAxisSpacing: 4,
              crossAxisSpacing: 4,
              // shrinkWrap: true,
              // physics: NeverScrollableScrollPhysics(),
              children: <Widget>[
            Container(
              padding: const EdgeInsets.all(8),
              child: const Text("He'd have you all unravel at the"),
              color: Colors.teal[100],
            ),
            Container(
              padding: const EdgeInsets.all(8),
              child: const Text('Heed not the rabble'),
              color: Colors.teal[200],
            ),
            Container(
              padding: const EdgeInsets.all(8),
              child: const Text('Sound of screams but the'),
              color: Colors.teal[300],
            ),
            Container(
              padding: const EdgeInsets.all(8),
              child: const Text('Who scream'),
              color: Colors.teal[400],
            ),
            Container(
              padding: const EdgeInsets.all(8),
              child: const Text('Revolution is coming...'),
              color: Colors.teal[500],
            ),
            Container(
              padding: const EdgeInsets.all(8),
              child: const Text('Revolution, they...'),
              color: Colors.teal[600],
            ),
            Container(
              padding: const EdgeInsets.all(8),
              child: const Text("He'd have you all unravel at the"),
              color: Colors.teal[100],
            ),
            Container(
              padding: const EdgeInsets.all(8),
              child: const Text('Heed not the rabble'),
              color: Colors.teal[200],
            ),
            Container(
              padding: const EdgeInsets.all(8),
              child: const Text('Sound of screams but the'),
              color: Colors.teal[300],
            ),
            Container(
              padding: const EdgeInsets.all(8),
              child: const Text('Who scream'),
              color: Colors.teal[400],
            ),
            Container(
              padding: const EdgeInsets.all(8),
              child: const Text('Revolution is coming...'),
              color: Colors.teal[500],
            ),
            Container(
              padding: const EdgeInsets.all(8),
              child: const Text('Revolution, they...'),
              color: Colors.teal[600],
            ),
          ]),
      // ),

      // body: Center(
      //   child: Column(
      //     mainAxisAlignment: MainAxisAlignment.center,
      //     children: [
      //       const Text('HomePage'),
      //       const SizedBox(height: 16),
      //       GridView.extent(
      //           maxCrossAxisExtent: 150,
      //           padding: const EdgeInsets.all(4),
      //           mainAxisSpacing: 4,
      //           crossAxisSpacing: 4,
      //           children: <Widget>[
      //             Text(
      //               'aaa',
      //               style: TextStyle(color: Colors.grey, fontSize: 32),
      //             ),
      //             Text(
      //               'bbb',
      //               style: TextStyle(color: Colors.grey, fontSize: 32),
      //             ),
      //             Text(
      //               'ccc',
      //               style: TextStyle(color: Colors.grey, fontSize: 32),
      //             ),
      //             Text(
      //               'ddd',
      //               style: TextStyle(color: Colors.grey, fontSize: 32),
      //             ),
      //           ])
      //     ],
      //   ),
      // ),
      bottomNavigationBar: AppBarBottom(),
    );
  }
}
