import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
// import 'package:ride_activity/model/status.dart';
import 'package:webviewx/webviewx.dart';

import '../model/rider_activity.dart';
import '../application_state.dart';
import '../model/status.dart';

class ActivityDone extends StatefulWidget {
  const ActivityDone({
    Key? key,
    required this.setActivityState,
    required this.selectedActivity,
    required this.setActual,
  }) : super(key: key);
  final void Function(ActivityState status) setActivityState;
  final Activities selectedActivity;
  final void Function() setActual;

  @override
  _ActivityDoneState createState() => _ActivityDoneState();
}

class _ActivityDoneState extends State<ActivityDone> {
  late WebViewXController webviewController;
  final _formKey = GlobalKey<FormState>(debugLabel: '_ActivityDoneState');
  final _distanceController = TextEditingController();
  final _timeController = TextEditingController();
  final _avelageController = TextEditingController();
  final _elevationController = TextEditingController();
  final _rideURLController = TextEditingController();
  @override
  void dispose() {
    webviewController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Container(
            padding: const EdgeInsets.all(10.0),
            child: Consumer<ApplicationState>(
                builder: (BuildContext context, appState, _) =>
                    _buildWebViewX(appState.selectActivity))),
        SizedBox(height: 8),
        Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 32),
                    child: TextFormField(
                      // keyboardType: TextInputType.number,
                      // inputFormatters: <TextInputFormatter>[FilteringTextInputFormatter.digitsOnly],
                      controller: _rideURLController,
                      decoration: const InputDecoration(
                          labelText: 'Garmin Connectの共有リンクアドレス',
                          hintText:
                              // 'https://connect.garmin.com/modern/activity/embed/123456',
                              'https://connect.garmin.com/modern/activity/embed/8763155713'),
                      validator: (value) {
                        if (value!.isEmpty) {
                          return '共有リンクアドレスは必須です';
                        }
                        return null;
                      },
                    )),
                const SizedBox(height: 32),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 32),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      ElevatedButton(
                          onPressed: () {
                            widget.setActivityState(ActivityState.display);
                          },
                          child: const Text('キャンセル')),
                      const SizedBox(width: 16),
                      ElevatedButton(
                          onPressed: () {
                            if (_formKey.currentState!.validate()) {
                              // widget.registerAccount(
                              //   _emailController.text,
                              //   _displayNameController.text,
                              //   _passwordController.text,
                              // );
                              widget.setActual();
                            }
                          },
                          child: const Text('アカウント作成')),
                      const SizedBox(width: 30),
                    ],
                  ),
                ),
              ],
            ))

        // ElevatedButton(
        //     onPressed: () {
        //       widget.setActual();
        //     },
        //     child: Text('done')),
        // SizedBox(height: 8),
        // ElevatedButton(
        //     onPressed: () {
        //       widget.setActivityState(ActivityState.display);
        //     },
        //     child: Text('Cancel')),
      ],
    );
  }

  Widget _buildWebViewX(Activities selectedActivityData) {
    return WebViewX(
      key: const ValueKey('webviewx'),
      initialContent: selectedActivityData.plan.couseURL,
      initialSourceType: SourceType.url,
      height: 500, //サイズは適当
      width: 500, //サイズは適当
      onWebViewCreated: (controller) => webviewController = controller,
    );
  }
}
