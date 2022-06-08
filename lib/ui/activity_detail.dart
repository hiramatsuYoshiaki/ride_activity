import 'package:flutter/material.dart';
import 'package:ride_activity/model/rider_activity.dart';
import 'package:webviewx/webviewx.dart';
// import 'package:url_launcher/url_launcher.dart';
// import 'package:webview_flutter/webview_flutter.dart';

// import '../application_state.dart';
import '../model/status.dart';
import 'package:intl/intl.dart';

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

  @override
  void dispose() {
    webviewController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // print('ActivityDetail--------------------------');
    return SingleChildScrollView(
        child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
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
          //map----------------------------------------
          Center(
            child: Container(
              height: 500,
              width: 465,
              // width: double.infinity,
              // height: double.infinity,
              // width: MediaQuery.of(context).size.width,
              // height: MediaQuery.of(context).size.height,
              padding: const EdgeInsets.symmetric(horizontal: 8),
              // margin: const EdgeInsets.all(20),
              alignment: Alignment.center,
              child: widget.selectedActivity.plan.done
                  ? _buildWebViewX(widget.selectedActivity.actual.rideURL)
                  : _buildWebViewX(widget.selectedActivity.plan.couseURL),
            ),
          ),
          SizedBox(height: 16),
          //------------------------------------------
          widget.selectedActivity.plan.done
              ? Container(
                  alignment: Alignment.topLeft,
                  child: _actualDetail(),
                )
              : Container(
                  alignment: Alignment.topLeft,
                  child: _planDetail(),
                ),

          // const SizedBox(height: 8),
          // Wrap(
          //   alignment: WrapAlignment.center,
          //   runSpacing: 8,
          //   spacing: 8,
          //   children: widget.selectedActivity.actual.ridePhotos
          //       .map(
          //         (photoUrl) => CircleAvatar(
          //           backgroundImage: NetworkImage("assets/images/$photoUrl"),
          //           minRadius: 50,
          //           maxRadius: 50,
          //         ),
          //       )
          //       .toList(),
          // ),
          // const SizedBox(height: 8),
          // Wrap(
          //   alignment: WrapAlignment.center,
          //   runSpacing: 8,
          //   spacing: 8,
          //   children: widget.selectedActivity.menber.rider
          //       .map(
          //         (rider) => Text(
          //           '$rider ',
          //           style: const TextStyle(fontSize: 16.0),
          //         ),
          //       )
          //       .toList(),
          // ),
          // const Padding(padding: EdgeInsets.symmetric(vertical: 8.0)),
          // const SizedBox(height: 8),
          // Text(widget.selectedActivity.plan.activityTitle),
          // Text(DateFormat('yyyy年M月d日 hh時mm分')
          //     .format(widget.selectedActivity.plan.date)),
          // Text('${widget.selectedActivity.plan.distance} km'),
          // Text(widget.selectedActivity.plan.done ? '実走' : '予定'),
          // Text(widget.selectedActivity.plan.startPoint),
          // Text(widget.selectedActivity.plan.wayPoint),
          // Text(widget.selectedActivity.plan.finishPoint),
          // Text(widget.selectedActivity.plan.couseURL),
          // Text(widget.selectedActivity.plan.prefacture[0]),
          // Wrap(
          //   runSpacing: 8,
          //   spacing: 8,
          //   children: widget.selectedActivity.plan.prefacture
          //       .map((item) => Text(
          //             '$item,',
          //             style: const TextStyle(fontSize: 12.0),
          //           ))
          //       .toList(),
          // ),

          // Text(widget.selectedActivity.plan.rideType),

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
          // button------------------------------------------
          SizedBox(height: 16),
          Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child:
                  Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                ElevatedButton(
                    onPressed: () {
                      widget.setActivityState(ActivityState.display);
                    },
                    child: Text('Back')),
                SizedBox(width: 4),
                ElevatedButton(
                    onPressed: () {
                      widget.setActivityState(ActivityState.activityEdit);
                    },
                    child: Text('Edit')),
                SizedBox(height: 8),
                SizedBox(width: 4),
                ElevatedButton(
                    onPressed: () {
                      widget.setActivityState(ActivityState.activityRemove);
                    },
                    child: Text('Remove')),
                SizedBox(height: 8),
              ])),
          SizedBox(height: 32),
        ]));
  }

  Widget _buildWebViewX(String url) {
    return WebViewX(
      key: const ValueKey('webviewx'),
      javascriptMode: JavascriptMode.unrestricted,
      initialContent: url,
      initialSourceType: SourceType.url,
      height: 500,
      width: 465,
      // width: double.infinity,
      // height: double.infinity,
      onWebViewCreated: (controller) => webviewController = controller,
    );
  }

  Widget _actualDetail() {
    return Column(
      children: [
        Container(
            alignment: Alignment.center,
            child: const Text('Actual Riding!',
                style: TextStyle(fontSize: 12, color: Colors.blue))),
        const Padding(padding: EdgeInsets.symmetric(vertical: 2.0)),
        Text(widget.selectedActivity.plan.activityTitle,
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
        const Padding(padding: EdgeInsets.symmetric(vertical: 2.0)),
        Text(
            "${DateFormat('yyyy年M月d日 h時m分').format(widget.selectedActivity.plan.date)} スタート"),
        const Padding(padding: EdgeInsets.symmetric(vertical: 2.0)),

        // Text('${widget.selectedActivity.plan.distance} km'),
        // Text(widget.selectedActivity.plan.done ? '実走' : '予定'),
        // Text(widget.selectedActivity.plan.startPoint),
        // Text(widget.selectedActivity.plan.wayPoint),
        // Text(widget.selectedActivity.plan.finishPoint),
        // Text(widget.selectedActivity.plan.couseURL),
        // Text(widget.selectedActivity.plan.activityTitle),
        // <Widget>[...widget.selectedActivity.plan.prefacture]
        // widget.selectedActivity.plan.prefacture
        // Text(widget.selectedActivity.plan.prefacture[0]),
        Wrap(
          runSpacing: 8,
          spacing: 8,
          children: widget.selectedActivity.plan.prefacture
              .map((item) => Text(
                    '$item ',
                    style: const TextStyle(fontSize: 12.0),
                  ))
              .toList(),
        ),
        const Padding(padding: EdgeInsets.symmetric(vertical: 2.0)),
        Text(widget.selectedActivity.plan.rideType),
        const Padding(padding: EdgeInsets.symmetric(vertical: 8.0)),
        Wrap(
          alignment: WrapAlignment.center,
          runSpacing: 8,
          spacing: 8,
          children: widget.selectedActivity.actual.ridePhotos
              .map(
                (photoUrl) => CircleAvatar(
                  backgroundImage: NetworkImage("assets/images/$photoUrl"),
                  minRadius: 50,
                  maxRadius: 50,
                ),
              )
              .toList(),
        ),
        const Padding(padding: EdgeInsets.symmetric(vertical: 8.0)),
        Container(
            padding: EdgeInsets.all(4),
            alignment: Alignment.center,
            decoration: BoxDecoration(
              border: Border.all(color: Colors.grey),
              borderRadius: BorderRadius.circular(2),
            ),
            child: Column(
              children: [
                Text('参加ライダー', style: TextStyle(fontSize: 12)),
                Wrap(
                  alignment: WrapAlignment.center,
                  runSpacing: 8,
                  spacing: 8,
                  children: widget.selectedActivity.menber.rider
                      .map(
                        (rider) => Text(
                          '$rider ',
                          style: const TextStyle(fontSize: 18.0),
                        ),
                      )
                      .toList(),
                ),
              ],
            )),
      ],
    );
  }

  Widget _planDetail() {
    return Column(
      children: [
        Container(
            alignment: Alignment.center,
            child: const Text('Scheduled Riding!',
                style: TextStyle(fontSize: 12, color: Colors.pink))),
        const Padding(padding: EdgeInsets.symmetric(vertical: 2.0)),
        Text(widget.selectedActivity.plan.activityTitle,
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
        const Padding(padding: EdgeInsets.symmetric(vertical: 2.0)),
        Text(
            "${DateFormat('yyyy年M月d日 h時m分').format(widget.selectedActivity.plan.date)} スタート"),
        const Padding(padding: EdgeInsets.symmetric(vertical: 2.0)),
        Row(mainAxisSize: MainAxisSize.min, children: [
          Text(
            '${widget.selectedActivity.plan.distance} km',
            style: const TextStyle(fontSize: 20.0),
          ),
          SizedBox(width: 4),
          Text(
            '${widget.selectedActivity.plan.rideType}',
            style: const TextStyle(fontSize: 16.0),
          ),
        ]),
        const Padding(padding: EdgeInsets.symmetric(vertical: 2.0)),
        Wrap(alignment: WrapAlignment.start, children: [
          Text(widget.selectedActivity.plan.startPoint),
          SizedBox(width: 4),
          Text('～'),
          SizedBox(width: 4),
          Text(widget.selectedActivity.plan.wayPoint),
          SizedBox(width: 4),
          Text('～'),
          SizedBox(width: 4),
          Text(widget.selectedActivity.plan.finishPoint),
        ]),
        const Padding(padding: EdgeInsets.symmetric(vertical: 2.0)),
        Wrap(
          runSpacing: 8,
          spacing: 8,
          children: widget.selectedActivity.plan.prefacture
              .map((item) => Text(
                    '$item ',
                    style: const TextStyle(fontSize: 12.0),
                  ))
              .toList(),
        ),
        const Padding(padding: EdgeInsets.symmetric(vertical: 4.0)),
        Container(
            padding: EdgeInsets.all(4),
            alignment: Alignment.center,
            decoration: BoxDecoration(
              border: Border.all(color: Colors.grey),
              borderRadius: BorderRadius.circular(2),
            ),
            child: Column(
              children: [
                Text('参加ライダー', style: TextStyle(fontSize: 12)),
                Wrap(
                  alignment: WrapAlignment.center,
                  runSpacing: 8,
                  spacing: 8,
                  children: widget.selectedActivity.menber.rider
                      .map(
                        (rider) => Text(
                          '$rider ',
                          style: const TextStyle(fontSize: 18.0),
                        ),
                      )
                      .toList(),
                ),
              ],
            )),
        const Padding(padding: EdgeInsets.symmetric(vertical: 16.0)),
      ],
    );
  }
}
