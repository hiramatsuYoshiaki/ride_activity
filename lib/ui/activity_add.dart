import 'package:flutter/material.dart';
import 'package:webviewx/webviewx.dart';

import '../model/rider_activity.dart';
import '../application_state.dart';
import '../model/status.dart';
import 'package:intl/intl.dart';

class ActivityAdd extends StatefulWidget {
  const ActivityAdd({
    Key? key,
    required this.setActivityState,
    required this.selectedActivity,
    required this.addActivity,
  }) : super(key: key);
  final void Function(ActivityState status) setActivityState;
  final Activities selectedActivity;
  final void Function(Activities selectedActivity) addActivity;
  @override
  _ActivityAddState createState() => _ActivityAddState();
}

class _ActivityAddState extends State<ActivityAdd> {
  late WebViewXController webviewController;

  @override
  void dispose() {
    webviewController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
        child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(widget.selectedActivity.plan.uid),
        Container(
          decoration: new BoxDecoration(
              border: new Border(
                  bottom: BorderSide(width: 1.0, color: Colors.grey))),
          child: Card(
            color: Colors.grey[50],
            child: Column(mainAxisSize: MainAxisSize.min, children: [
              // Expanded(child:
              CustomListItem(
                user: widget.selectedActivity.plan.uid,
                date: DateFormat('yyyy年M月d日 hh時mm分')
                    .format(widget.selectedActivity.plan.date),
                // distance: activity.distance,
                distance: widget.selectedActivity.plan.distance,
                thumbnail: Container(
                  width: 48,
                  height: 48,
                  padding: EdgeInsets.symmetric(vertical: 4.0),
                  alignment: Alignment.center,
                  child: Image(
                    image: const NetworkImage(
                        'https://flutter.github.io/assets-for-api-docs/assets/widgets/owl.jpg'),
                  ),
                ),
                // title: activity.activityTitle,
                title: widget.selectedActivity.plan.activityTitle,
                startPoint: widget.selectedActivity.plan.startPoint,
                wayPoint: widget.selectedActivity.plan.wayPoint,
                finishPoint: widget.selectedActivity.plan.finishPoint,
                done: widget.selectedActivity.plan.done,
              ),
            ]),
          ),
        ),
        Container(
          padding: const EdgeInsets.all(10),
          child: WebViewX(
            key: const ValueKey('webviewx'),
            // initialContent:
            //     'https://connect.garmin.com/modern/course/embed/87305420',
            //<iframe src='https://connect.garmin.com/modern/course/embed/87305420' title='河津桜ライド2022' width='465' height='500' frameborder='0'></iframe>"

            initialContent: widget.selectedActivity.plan.couseURL,
            initialSourceType: SourceType.url,
            height: 500, //サイズは適当
            width: 500, //サイズは適当
            onWebViewCreated: (controller) => webviewController = controller,
          ),
        ),
        const SizedBox(height: 8),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 32),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  ElevatedButton(
                      onPressed: () {
                        widget
                            .setActivityState(ActivityState.activityAddElement);
                      },
                      child: const Text('キャンセル')),
                  const SizedBox(width: 16),
                  ElevatedButton(
                    child: const Text('登録'),
                    onPressed: () {
                      // print('add onPress button');
                      widget.addActivity(Activities(
                        plan: RiderActivities(
                          uid: widget.selectedActivity.plan.uid,
                          activityTitle:
                              widget.selectedActivity.plan.activityTitle,
                          date: widget.selectedActivity.plan.date,
                          // date: DateTime.utc(2022, 03, 03, 12, 30, 00),
                          // date: widget.selectedActivity.plan.date, //iso
                          //iso
                          // distance: int.parse(
                          //     widget.selectedActivity.plan.startPoint),
                          distance: widget.selectedActivity.plan.distance,
                          done: false,
                          startPoint: widget.selectedActivity.plan.startPoint,
                          wayPoint: widget.selectedActivity.plan.wayPoint,
                          finishPoint: widget.selectedActivity.plan.finishPoint,
                          couseURL: widget.selectedActivity.plan.couseURL,
                          prefacture: widget.selectedActivity.plan.prefacture,
                          rideType: widget.selectedActivity.plan.rideType,
                        ),
                        actual: ActualRide(
                          rideURL: widget.selectedActivity.actual.rideURL,
                          ridePhotos: widget.selectedActivity.actual.ridePhotos,
                        ),
                        menber:
                            Menber(rider: widget.selectedActivity.menber.rider),
                        shared: true,
                        tags: widget.selectedActivity.tags,
                        createdAt: DateTime.now(),
                        updateAt: DateTime.now(),
                        status: 'active',
                      ));
                    },
                  ),
                  const SizedBox(width: 30),
                ],
              ),
            ),
          ],
        ),
      ],
    ));
  }
}

class CustomListItem extends StatelessWidget {
  const CustomListItem({
    required this.thumbnail,
    required this.title,
    required this.user,
    required this.date,
    required this.distance,
    required this.startPoint,
    required this.wayPoint,
    required this.finishPoint,
    required this.done,
  });

  final Widget thumbnail;
  final String title;
  final String date;
  final String user;
  final int distance;
  final String startPoint;
  final String wayPoint;
  final String finishPoint;
  final bool done;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          // Expanded(
          //   flex: 1,
          //   child: thumbnail,
          // ),
          Expanded(
            // flex: 4,
            child: _ActivityDescription(
              title: title,
              user: user,
              date: date,
              distance: distance,
              startPoint: startPoint,
              wayPoint: wayPoint,
              finishPoint: finishPoint,
              done: done,
            ),
          ),
          // const Icon(
          //   Icons.arrow_right,
          //   size: 16.0,
          // ),
        ],
      ),
    );
  }
}

class _ActivityDescription extends StatelessWidget {
  const _ActivityDescription({
    Key? key,
    required this.title,
    required this.user,
    required this.date,
    required this.distance,
    required this.startPoint,
    required this.wayPoint,
    required this.finishPoint,
    required this.done,
  }) : super(key: key);

  final String title;
  final String user;
  final String date;
  final int distance;
  final String startPoint;
  final String wayPoint;
  final String finishPoint;
  final bool done;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(5.0, 0.0, 0.0, 0.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          const Padding(padding: EdgeInsets.symmetric(vertical: 2.0)),
          // Text(
          //   user,
          //   style: const TextStyle(fontSize: 10.0),
          // ),
          // const Padding(padding: EdgeInsets.symmetric(vertical: 1.0)),
          Row(mainAxisSize: MainAxisSize.min, children: [
            done
                ? const Icon(
                    Icons.done,
                    size: 24.0,
                  )
                : const Icon(
                    Icons.directions_bike_rounded,
                    size: 24.0,
                  ),
            SizedBox(width: 4),
            Text(
              title,
              style: const TextStyle(
                fontWeight: FontWeight.w500,
                fontSize: 24.0,
              ),
            ),
            SizedBox(width: 4),
          ]),

          // Text(
          //   date,
          //   style: const TextStyle(
          //     fontWeight: FontWeight.w500,
          //     fontSize: 18.0,
          //   ),
          // ),
          const Padding(padding: EdgeInsets.symmetric(vertical: 1.0)),
          Row(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  date,
                  style: const TextStyle(
                    fontWeight: FontWeight.w500,
                    fontSize: 16.0,
                  ),
                ),
                SizedBox(width: 4),
                done
                    ? const Text(
                        '',
                        style: TextStyle(
                          fontWeight: FontWeight.w600,
                          fontSize: 16.0,
                        ),
                      )
                    : Card(
                        color: Colors.red[200],
                        child: Padding(
                            padding: EdgeInsets.all(2),
                            child: Text('START',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 12.0,
                                ))),
                      ),
                // Container(
                //     padding: EdgeInsets.all(2.0),
                //     child: const Text('START',
                //         style: TextStyle(
                //             color: Colors.white,
                //             fontSize: 12.0,
                //             backgroundColor: Colors.red)))
              ]),
          const Padding(padding: EdgeInsets.symmetric(vertical: 1.0)),
          Row(mainAxisSize: MainAxisSize.min, children: [
            Text(startPoint),
            SizedBox(width: 4),
            Text('～'),
            SizedBox(width: 4),
            Text(wayPoint),
            SizedBox(width: 4),
            Text('～'),
            SizedBox(width: 4),
            Text(finishPoint),
          ]),

          const Padding(padding: EdgeInsets.symmetric(vertical: 1.0)),
          Text(
            '$distance km',
            style: const TextStyle(fontSize: 10.0),
          ),
        ],
      ),
    );
  }
}
