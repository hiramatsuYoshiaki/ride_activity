import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:webviewx/webviewx.dart';

import '../model/rider_activity.dart';
import '../application_state.dart';
import '../model/status.dart';

class ActivityAdd extends StatefulWidget {
  const ActivityAdd({
    Key? key,
    required this.setActivityState,
    required this.selectedActivity,
    required this.addActivity,
  }) : super(key: key);
  final void Function(ActivityState status) setActivityState;
  final Activities selectedActivity;
  final void Function(Activities activities) addActivity;
  @override
  _ActivityAddState createState() => _ActivityAddState();
}

class _ActivityAddState extends State<ActivityAdd> {
  late WebViewXController webviewController;
  final _formKey = GlobalKey<FormState>(debugLabel: '_ActivityAddState');
  final _activityTitleController = TextEditingController();
  final _dateController = TextEditingController();
  final _distanceController = TextEditingController();
  final _staertPointController = TextEditingController();
  final _wayPointController = TextEditingController();
  final _finishPointController = TextEditingController();
  final _couseURLController = TextEditingController();

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
          padding: const EdgeInsets.all(10),
          child: WebViewX(
            key: const ValueKey('webviewx'),
            // initialContent:
            //     'https://connect.garmin.com/modern/course/embed/87305420',
            initialContent: _couseURLController.text,
            initialSourceType: SourceType.url,
            height: 500, //サイズは適当
            width: 500, //サイズは適当
            onWebViewCreated: (controller) => webviewController = controller,
          ),
        ),
        // Container(
        //     padding: const EdgeInsets.all(10.0),
        //     child: Consumer<ApplicationState>(
        //         builder: (BuildContext context, appState, _) =>
        //             _buildWebViewX(''))),

        const SizedBox(height: 8),

        const SizedBox(height: 8),
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
                    controller: _couseURLController,
                    decoration: const InputDecoration(
                      labelText: 'Garmin Connectの共有リンクアドレス',
                      // hintText:
                      //     'https://connect.garmin.com/modern/activity/embed/123456',
                      // 'https://connect.garmin.com/modern/activity/embed/8763155713'
                    ),
                    validator: (value) {
                      if (value!.isEmpty) {
                        return '共有リンクアドレスは必須です';
                      }
                      return null;
                    },
                  )),
              const SizedBox(height: 32),
              // Padding(
              //   padding: const EdgeInsets.symmetric(horizontal: 32),
              //   child: Row(
              //     mainAxisAlignment: MainAxisAlignment.end,
              //     children: [
              //       ElevatedButton(
              //           onPressed: () {
              //             print(_couseURLController.text);
              //             widget.setNewCouceURL(_couseURLController.text);
              //           },
              //           child: const Text('コースを表示')),
              //       const SizedBox(width: 30),
              //     ],
              //   ),
              // ),
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
                            // widget.setActual();
                            // widget.setNewCouceURL(_couseURLController.text);
                          }
                        },
                        child: const Text('MAP表示')),
                    const SizedBox(width: 30),
                  ],
                ),
              ),
            ],
          ),
        ),

        // Form(
        //     key: _formKey,
        //     child: Row(
        //       children: [
        //         Expanded(
        //           child: Column(
        //             crossAxisAlignment: CrossAxisAlignment.start,
        //             children: <Widget>[
        //               Padding(
        //             padding: const EdgeInsets.symmetric(horizontal: 32),
        //             child: TextFormField(
        //               // keyboardType: TextInputType.number,
        //               // inputFormatters: <TextInputFormatter>[FilteringTextInputFormatter.digitsOnly],
        //               controller: _couseURLController,
        //               decoration: const InputDecoration(
        //                 labelText: 'Garmin Connectの共有リンクアドレス',
        //                 hintText:
        //                     'https://connect.garmin.com/modern/activity/embed/123456',
        //                 // 'https://connect.garmin.com/modern/course/embed/105823680'
        //               ),
        //               validator: (value) {
        //                 if (value!.isEmpty) {
        //                   return '共有リンクアドレスは必須です';
        //                 }
        //                 return null;
        //               },
        //             )),
        //             ],
        //         )),
        //         Expanded(
        //             child: TextFormField(
        //           controller: _activityTitleController,
        //           decoration: const InputDecoration(hintText: 'Title'),
        //           validator: (value) {
        //             if (value == null || value.isEmpty) {
        //               return 'Enter your ride activity title';
        //             }
        //             return null;
        //           },
        //         )),
        //         const SizedBox(width: 8),
        //         ElevatedButton(
        //             onPressed: () {
        //               if (_formKey.currentState!.validate()) {
        //                 widget.addActivity(Activities(
        //                     plan: RiderActivities(
        //                       uid: 'AddPlan1',
        //                       activityTitle: _activityTitleController.text,
        //                       date: DateTime.utc(2022, 05, 29, 10, 30, 00),
        //                       distance: 40,
        //                       done: false,
        //                       couseURL: '',
        //                       startPoint: '',
        //                       wayPoint: '',
        //                       finishPoint: '',
        //                     ),
        //                     actual: ActualRide(
        //                       rideURL: '',
        //                       ridePhotos: [],
        //                     ),
        //                     menber: Menber(rider: [])));
        //                 _activityTitleController.clear();
        //               }
        //             },
        //             child: Row(
        //               children: const [
        //                 Icon(Icons.add),
        //                 SizedBox(width: 4),
        //                 Text('Add'),
        //               ],
        //             ))
        //       ],
        //     )),
      ],
    );
  }

  // Widget _buildWebViewX(String url) {
  //   print('_buildWebViewX:$url');
  //   return WebViewX(
  //     key: const ValueKey('webviewx'),
  //     initialContent: url,
  //     // initialContent: 'https://connect.garmin.com/modern/course/embed/87305420',
  //     initialSourceType: SourceType.url,
  //     height: 500, //サイズは適当
  //     width: 500, //サイズは適当
  //     onWebViewCreated: (controller) => webviewController = controller,
  //   );
  // }
}
