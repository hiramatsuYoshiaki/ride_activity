import 'package:flutter/material.dart';
import 'package:ride_activity/model/rider_activity.dart';
import 'package:webviewx/webviewx.dart';
// import 'package:url_launcher/url_launcher.dart';
import 'package:provider/provider.dart';
// import 'package:webview_flutter/webview_flutter.dart';

import '../application_state.dart';
import '../model/status.dart';

class ActivityDetail extends StatefulWidget {
  const ActivityDetail({
    Key? key,
    required this.setActivityState,
    required this.selectedActivity,
  }) : super(key: key);
  final void Function(ActivityState status) setActivityState;
  final Activities selectedActivity;

  @override
  _ActivityDetailState createState() => _ActivityDetailState();
}

class _ActivityDetailState extends State<ActivityDetail> {
  late WebViewXController webviewController;
  // final Uri _url = Uri.parse('https://flutter.dev');
  // _launchUrl(url) async {
  //   final Uri _url = Uri.parse(url);
  //   if (!await launchUrl(_url)) throw 'Could not launch $_url';
  // }

  @override
  void dispose() {
    webviewController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // print('ActivityDetail--------------------------');
    return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          // Text('Activity Detail '),
          // LinearProgressIndicator(),

          Container(
              padding: const EdgeInsets.all(10.0),
              child: Consumer<ApplicationState>(
                  builder: (BuildContext context, appState, _) =>
                      _buildWebViewX(appState.selectActivity))),
          // Expanded(
          //     // Container(
          //     //     padding: const EdgeInsets.all(10.0),
          //     // height: 500,
          //     child: Consumer<ApplicationState>(
          //         builder: (BuildContext context, appState, _) =>
          //             _launchInBrowser(appState.selectActivity))
          //     // ),
          //     ),
          // Container(
          //     padding: const EdgeInsets.all(10.0),
          //     height: 500,
          //     child: Consumer<ApplicationState>(
          //         builder: (BuildContext context, appState, _) =>
          //             _launchInBrowserButton(appState.selectActivity))),
          // Container(
          //   padding: const EdgeInsets.all(10.0),
          //   height: 500,
          //   child: Consumer<ApplicationState>(
          //       builder: (BuildContext context, appState, _) =>
          //           // _launchInBrowserButton(appState.selectActivity))),
          //           WebView(initialUrl: 'https://flutter.dev')),
          // ),
          // Container(
          //     padding: const EdgeInsets.all(10.0),
          //     height: 500,
          //     width: 500,
          //     child: Expanded(
          //         child: WebView(
          //       initialUrl: 'https://flutter.dev',
          //       // javascriptMode: JavascriptMode.unrestricted,
          //       // onPageFinished: _handleLoad,
          //       // onWebViewCreated: (WebViewController webViewController) {
          //       //   _controller.complete(webViewController);
          //       // },
          //     ))),
          // Text(widget.selectedActivity.actual.rideURL),

          SizedBox(height: 8),
          // ElevatedButton(
          //     onPressed: () {
          //       widget.setActivityState(ActivityState.activityDetail);
          //     },
          //     child: Text('Detail')),
          // SizedBox(height: 8),
          // ElevatedButton(
          //     onPressed: () {
          //       widget.setActivityState(ActivityState.activityAdd);
          //     },
          //     child: Text('Add')),
          // SizedBox(height: 8),
          ElevatedButton(
              onPressed: () {
                widget.setActivityState(ActivityState.activityEdit);
              },
              child: Text('Edit')),
          SizedBox(height: 8),
          // ElevatedButton(
          //     onPressed: () {
          //       widget.setActivityState(ActivityState.activityRemove);
          //     },
          //     child: Text('Remove')),
          // SizedBox(height: 8),
          ElevatedButton(
              onPressed: () {
                widget.setActivityState(ActivityState.display);
              },
              child: Text('List')),
        ]);
  }

  Widget _buildWebViewX(Activities selectedActivityData) {
    // print('buildWebViewx');
    // print(selectedActivityData.actual.rideURL);
    return WebViewX(
      key: const ValueKey('webviewx'),
      // <iframe src='https://connect.garmin.com/modern/activity/embed/8052346097' title='2022初詣ライド' width='465' height='500' frameborder='0'></iframe>
      // initialContent:
      // 'https://connect.garmin.com/modern/activity/embed/8052346097',
      // initialContent:
      // 'https://connect.garmin.com/modern/activity/embed/8763155713',
      // 'https://connect.garmin.com/modern/activity/embed/8442710466',

      // 'https://connect.garmin.com/modern/course/embed/105823680',

      // initialContent: widget.selectedActivity.actual.rideURL,
      // initialContent: 'https://news.yahoo.co.jp/',

      // initialContent: selectedActivityData.plan.done
      //     ? selectedActivityData.actual.rideURL
      //     : '<h2> Hello, world! </h2>',
      initialContent: selectedActivityData.plan.done
          ? selectedActivityData.actual.rideURL
          : selectedActivityData.plan.couseURL,
      // initialSourceType: SourceType.html,
      initialSourceType: SourceType.url,
      // initialSourceType:
      //     selectedActivityData.plan.done ? SourceType.url : SourceType.html,
      height: 500, //サイズは適当
      width: 500, //サイズは適当
      onWebViewCreated: (controller) => webviewController = controller,
    );
  }

  // Widget _launchInBrowser(Activities selectActivityData) {
  //   print('_launchInBrowser');
  //   print(selectActivityData.actual.rideURL);
  //   return Column(children: <Widget>[
  //     Expanded(child: _launchUrl(selectActivityData.plan.couseURL))
  //   ]);
  // }

  // Widget _launchInBrowserButton(Activities selectActivityData) {
  //   return Center(
  //       child: ElevatedButton(
  //     // onPressed: _launchUrl(selectActivityData.plan.couseURL),
  //     onPressed: () {
  //       _launchUrl(selectActivityData.plan.couseURL);
  //     },
  //     child: Text('Show Couse Map'),
  //   ));
  // }
}
