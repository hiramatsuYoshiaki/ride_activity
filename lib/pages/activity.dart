import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:ride_activity/model/status.dart';
import '../ui/app_bar_auth.dart';
import '../ui/app_bar_bottom.dart';
import '../application_state.dart';

class ActivityPage extends StatelessWidget {
  const ActivityPage({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarAuth(
        titleText: 'Activity',
      ),
      // body: Column(
      //   children: [
      //     Text('ActivityPage'),
      //     Consumer<ApplicationState>(builder: (context, appState, _) {
      //       return Text(appState.getCurrentUser!.displayName.toString());
      //     }),
      //   ],
      // ),
      // body: Row(
      //   mainAxisSize: MainAxisSize.min,
      //   mainAxisAlignment: MainAxisAlignment.center,
      //   children: [
      //     Container(
      //       constraints: BoxConstraints(minWidth: 200, maxWidth: 800),
      //       padding: EdgeInsets.all(8),
      //       decoration: BoxDecoration(
      //           color: Colors.blue[500],
      //           borderRadius: BorderRadius.circular(10)),
      //       child: Text('Activities'),
      //     )
      //   ],
      // ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            alignment: Alignment.center,
            padding: const EdgeInsets.all(8),
            child: const Text("Container width: 600 height: 300"),
            color: Colors.purple[100],
            width: 600.0,
            height: 300.0,
          ),
          ConstrainedBox(
            constraints: BoxConstraints(maxWidth: 300),
            child: Container(
              padding: const EdgeInsets.all(8),
              child: const Text(
                  "ConstrainedBox maxWidth: 300------------------------------------------------------------------------------------------------------------------------------"),
              color: Colors.purple[200],
            ),
          ),
          ConstrainedBox(
            constraints: BoxConstraints(minWidth: 300, maxWidth: 600),
            child: Container(
              padding: const EdgeInsets.all(8),
              child: const Text("ConstrainedBox minWidth: 300, maxWidth: 600"),
              color: Colors.purple[300],
            ),
          ),
          //expand
          ConstrainedBox(
            constraints: BoxConstraints.expand(height: 100),
            child: Container(
              padding: const EdgeInsets.all(8),
              child: const Text(
                  "BoxConstraints.expand(height: 100) 指定したプロパティはその長さで固定され、未指定のプロパティはできる限り広がります。"),
              color: Colors.purple[400],
            ),
          ),
          ConstrainedBox(
            constraints: BoxConstraints.loose(const Size(600.0, 100.0)),
            child: Container(
              padding: const EdgeInsets.all(8),
              child: const Text(
                  "BoxConstraints.loose(const Size(600.0, 100.0) 最大値よりも親Widgetが小さい場合はサイズがマックス【0.0】まで小さくなります。"),
              color: Colors.purple[500],
            ),
          ),
          Flexible(
            child: Container(
              padding: const EdgeInsets.all(8),
              child: const Text("He'd have you all unravel at the"),
              color: Colors.red[100],
            ),
          ),
          Expanded(
            child: Container(
              padding: const EdgeInsets.all(8),
              child: const Text("He'd have you all unravel at the"),
              color: Colors.yellow[100],
            ),
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
            child: const Text(
                'Who scream aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa'),
            color: Colors.teal[400],
          ),
        ],
      ),
      bottomNavigationBar: AppBarBottom(),
    );
  }
}
