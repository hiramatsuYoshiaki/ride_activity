import 'package:flutter/material.dart';
import 'package:webviewx/webviewx.dart';

import '../model/rider_activity.dart';

class ActivityGarminmap extends StatelessWidget {
  const ActivityGarminmap({
    Key? key,
    required this.selectedActivity,
  }) : super(key: key);
  final Activities selectedActivity;

  @override
  Widget build(BuildContext context) {
    // return Container(child: Text(selectedActivity.plan.activityTitle));
    WebViewXController webviewController;
    return Center(
      child: Container(
          height: 500,
          width: 465,
          padding: const EdgeInsets.symmetric(horizontal: 8),
          alignment: Alignment.center,
          // child: widget.selectedActivity.plan.done
          //     ? _buildWebViewX(widget.selectedActivity.actual.rideURL)
          //     : _buildWebViewX(widget.selectedActivity.plan.couseURL),
          child: WebViewX(
            key: const ValueKey('webviewx'),
            javascriptMode: JavascriptMode.unrestricted,
            initialContent: selectedActivity.plan.done
                ? selectedActivity.actual.rideURL
                : selectedActivity.plan.couseURL,
            initialSourceType: SourceType.url,
            height: 500,
            width: 465,
            // width: double.infinity,
            // height: double.infinity,
            onWebViewCreated: (controller) => webviewController = controller,
          )),
    );
    // return WebViewX(
    //   key: const ValueKey('webviewx'),
    //   javascriptMode: JavascriptMode.unrestricted,
    //   initialContent: url,
    //   initialSourceType: SourceType.url,
    //   height: 500,
    //   width: 465,
    //   // width: double.infinity,
    //   // height: double.infinity,
    //   onWebViewCreated: (controller) => webviewController = controller,
    // );
  }
}
