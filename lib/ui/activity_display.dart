import 'package:flutter/material.dart';
import 'package:ride_activity/application_state.dart';
import 'package:ride_activity/model/status.dart';

import '../model/rider_activity.dart';
import '../model/rider_info.dart';
import 'package:intl/intl.dart';

class ActivityDisplay extends StatefulWidget {
  const ActivityDisplay({
    Key? key,
    required this.setActivityState,
    // required this.riderActivities,
    required this.activities,
    required this.riderInfo,
    required this.setSelectedActivity,
  }) : super(key: key);
  final void Function(ActivityState status) setActivityState;

  // final List<RiderActivities> riderActivities;
  final List<Activities> activities;
  final RiderInfo riderInfo;
  final void Function(Activities activity, ActivityState status)
      setSelectedActivity;

  @override
  _ActivityDisplayState createState() => _ActivityDisplayState();
}

class _ActivityDisplayState extends State<ActivityDisplay> {
  @override
  Widget build(BuildContext context) {
    // var list = [
    //   "メッセージ",
    //   "メッセージ",
    //   "メッセージ",
    //   "メッセージ",
    //   "メッセージ",
    // ];
    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      Container(
          decoration: new BoxDecoration(
              border: new Border(
                  bottom: BorderSide(width: 1.0, color: Colors.grey))),
          height: 300,
          child: Center(
            child:
                Column(mainAxisAlignment: MainAxisAlignment.center, children: [
              // widget.riderInfo.photoURL == null
              //     ? const CircleAvatar(
              //         backgroundImage: NetworkImage(
              //             'assets/images/undraw_profile_pic_ic5t.png'),
              //         minRadius: 50,
              //         maxRadius: 100,
              //       )
              //     : CircleAvatar(
              //         backgroundImage:
              //             NetworkImage('${widget..riderInfo.photoURL}'),
              //         minRadius: 50,
              //         maxRadius: 100,
              //       ),
              CircleAvatar(
                backgroundImage:
                    NetworkImage('assets/images/undraw_profile_pic_ic5t.png'),
                minRadius: 50,
                maxRadius: 100,
              ),
              const SizedBox(height: 8),
              Text(widget.riderInfo.riderName),
              Text(widget.riderInfo.email),
              Text(widget.riderInfo.uid),
            ]),
          )),
      Container(
        height: 50,
        child: Center(
          child: ElevatedButton(
              onPressed: () {
                widget.setActivityState(ActivityState.activityAdd);
              },
              child: Text('Activity Add')),
        ),
      ),
      Expanded(
        child: ListView.builder(
          // itemCount: widget.riderActivities.length,
          itemCount: widget.activities.length,
          itemBuilder: (BuildContext context, int index) {
            // return _activityItem(widget.riderActivities[index]);
            return _activityItem(widget.activities[index]);
          },
        ),
      )
      // Expanded(
      //   child: ListView.builder(
      //     itemBuilder: (BuildContext context, int index) {
      //       if (index >= list.length) {
      //         list.addAll([
      //           "メッセージ",
      //           "メッセージ",
      //           "メッセージ",
      //           "メッセージ",
      //         ]);
      //       }
      //       return _activityItem(list[index]);
      //     },
      //   ),
      // )
      // Expanded(
      // ListView(
      //   children: [
      //     Container(
      //       decoration: new BoxDecoration(
      //           border: new Border(
      //               bottom: BorderSide(width: 1.0, color: Colors.grey))),
      //       child: ListTile(
      //         title: Text(
      //           "Fun Ride 2022",
      //           style: TextStyle(color: Colors.black, fontSize: 18.0),
      //         ),
      //         onTap: () {
      //           print("onTap called.");
      //         }, // タップ
      //         onLongPress: () {
      //           print("onLongTap called.");
      //         }, // 長押し
      //       ),
      //     ),
      // )

      //   ],
      // ))
    ]);
    // return ListView(
    //   children: [
    //     Container(
    //       height: 100,
    //       color: Colors.red,
    //     ),
    //     Container(
    //       height: 100,
    //       color: Colors.orange,
    //     ),
    //     Container(
    //       height: 100,
    //       color: Colors.yellow,
    //     ),
    //     Container(
    //       height: 100,
    //       color: Colors.green,
    //     ),
    //     Container(
    //       height: 100,
    //       color: Colors.teal,
    //     ),
    //     Container(
    //       height: 100,
    //       color: Colors.blue,
    //     ),
    //     Container(
    //       height: 100,
    //       color: Colors.deepPurple,
    //     ),
    //     Container(
    //       height: 100,
    //       color: Colors.red,
    //     ),
    //     Container(
    //       height: 100,
    //       color: Colors.orange,
    //     ),
    //     Container(
    //       height: 100,
    //       color: Colors.yellow,
    //     ),
    //     Container(
    //       height: 100,
    //       color: Colors.green,
    //     ),
    //     Container(
    //       height: 100,
    //       color: Colors.teal,
    //     ),
    //     Container(
    //       height: 100,
    //       color: Colors.blue,
    //     ),
    //     Container(
    //       height: 100,
    //       color: Colors.deepPurple,
    //     ),
    //   ],
    // );

    // return Column(
    //   crossAxisAlignment: CrossAxisAlignment.start,
    //   children: [
    //   Text('Activity Display '),
    //   SizedBox(height: 16),
    //   Text('Activity Rider Info '),
    //   Text(widget.riderInfo.riderName),
    //   Text(widget.riderInfo.email),
    //   Text(widget.riderInfo.uid),
    //   SizedBox(height: 16),
    //   Text('Activity Rider Activity '),
    //   for (var activity in widget.riderActivities)
    //     Text('${activity.activityTitle}'),
    //   SizedBox(height: 8),
    //   ElevatedButton(
    //       onPressed: () {
    //         widget.setActivityState(ActivityState.activityDetail);
    //       },
    //       child: Text('Detail')),
    //   SizedBox(height: 8),
    //   ElevatedButton(
    //       onPressed: () {
    //         widget.setActivityState(ActivityState.activityAdd);
    //       },
    //       child: Text('Add')),
    //   SizedBox(height: 8),
    //   ElevatedButton(
    //       onPressed: () {
    //         widget.setActivityState(ActivityState.activityEdit);
    //       },
    //       child: Text('Edit')),
    //   SizedBox(height: 8),
    //   ElevatedButton(
    //       onPressed: () {
    //         widget.setActivityState(ActivityState.activityRemove);
    //       },
    //       child: Text('Remove')),
    //   SizedBox(height: 8),
    //   ElevatedButton(
    //       onPressed: () {
    //         widget.setActivityState(ActivityState.display);
    //       },
    //       child: Text('List')),
    // ]);
  }

  // Widget _activityItem(RiderActivities activity) {
  Widget _activityItem(Activities activity) {
    return Container(
      decoration: new BoxDecoration(
          border:
              new Border(bottom: BorderSide(width: 1.0, color: Colors.grey))),
      child: Card(
        child: Column(mainAxisSize: MainAxisSize.min, children: [
          // Expanded(child:
          CustomListItem(
            user: 'Flutter',
            date: DateFormat('yyyy年M月d日 hh時mm分').format(activity.plan.date),
            // distance: activity.distance,
            distance: activity.plan.distance,
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
            title: activity.plan.activityTitle,
            startPoint: activity.plan.startPoint,
            wayPoint: activity.plan.wayPoint,
            finishPoint: activity.plan.finishPoint,
          ),
          // ),
          // Expanded(
          //     child:
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: <Widget>[
              TextButton(
                child: const Text('Done'),
                onPressed: () {
                  widget.setSelectedActivity(
                      activity, ActivityState.activityEdit);
                  // widget.setActivityState(ActivityState.activityEdit);
                },
              ),
              const SizedBox(width: 8),
              TextButton(
                child: const Text('Detail'),
                onPressed: () {
                  widget.setSelectedActivity(
                      activity, ActivityState.activityDetail);
                  // widget.setActivityState(ActivityState.activityDetail);
                },
              ),
              const SizedBox(width: 8),
              TextButton(
                child: const Text('Delete'),
                onPressed: () {
                  widget.setSelectedActivity(
                      activity, ActivityState.activityRemove);
                  // widget.setActivityState(ActivityState.activityRemove);
                },
              ),
              const SizedBox(width: 8),
            ],
          )
          // ),
        ]),
      ),
      // child: Card(
      //   child: CustomListItem(
      //     user: 'Flutter',
      //     date: '2022-05-03',
      //     distance: 160,
      //     // thumbnail: Container(
      //     //   width: 48,
      //     //   height: 48,
      //     //   padding: EdgeInsets.symmetric(vertical: 4.0),
      //     //   alignment: Alignment.center,
      //     //   child: CircleAvatar(
      //     //     backgroundImage:
      //     //         NetworkImage('assets/images/undraw_profile_pic_ic5t.png'),
      //     //     minRadius: 50,
      //     //     maxRadius: 100,
      //     //   ),
      //     thumbnail: Container(
      //       width: 80,
      //       height: 48,
      //       padding: EdgeInsets.symmetric(vertical: 4.0),
      //       alignment: Alignment.center,
      //       child: Image(
      //         image: const NetworkImage(
      //             'https://flutter.github.io/assets-for-api-docs/assets/widgets/owl.jpg'),
      //       ),
      //     ),
      //     title: activity.activityTitle,
      //   ),
      // )

      // child: Card(
      //   child: ListTile(
      //     // tileColor: Colors.white,
      //     tileColor: Colors.pink[200],
      //     // leading: Image(
      //     //   image: const NetworkImage(
      //     //       'https://flutter.github.io/assets-for-api-docs/assets/widgets/owl.jpg'),
      //     // ),
      //     leading: GestureDetector(
      //       behavior: HitTestBehavior.translucent,
      //       onTap: () {},
      //       child: Container(
      //         width: 48,
      //         height: 48,
      //         padding: EdgeInsets.symmetric(vertical: 4.0),
      //         alignment: Alignment.center,
      //         child: CircleAvatar(
      //           backgroundImage:
      //               NetworkImage('assets/images/undraw_profile_pic_ic5t.png'),
      //           minRadius: 50,
      //           maxRadius: 100,
      //         ),
      //       ),
      //     ),
      //     title: Text(activity.activityTitle),
      //     subtitle: Text("Dracaena"),
      //     isThreeLine: true,
      //     trailing: Icon(Icons.done),
      //     onTap: () {
      //       print("onTap called.");
      //       widget.setActivityState(ActivityState.activityDetail);
      //     }, // タップ
      //     onLongPress: () {
      //       print("onLongTap called.");
      //       widget.setActivityState(ActivityState.activityDetail);
      //     }, // 長押し
      //   ),
      // ),

      // child: Card(
      //   child: ListTile(
      //     leading: FlutterLogo(size: 72.0),
      //     title: Text(
      //       activity.activityTitle,
      //       style: TextStyle(color: Colors.black, fontSize: 18.0),
      //     ),
      //     subtitle: Text('A sufficiently long subtitle warrants three lines.'),
      //     trailing: Icon(Icons.more_vert),
      //     isThreeLine: true,
      //     onTap: () {
      //       print("onTap called.");
      //       widget.setActivityState(ActivityState.activityDetail);
      //     }, // タップ
      //     onLongPress: () {
      //       print("onLongTap called.");
      //       widget.setActivityState(ActivityState.activityDetail);
      //     }, // 長押し
      //   ),
      // ),

      // child: ListTile(
      //   title: Text(
      //     activity.activityTitle,
      //     style: TextStyle(color: Colors.black, fontSize: 18.0),
      //   ),
      //   onTap: () {
      //     print("onTap called.");
      //     widget.setActivityState(ActivityState.activityDetail);
      //   }, // タップ
      //   onLongPress: () {
      //     print("onLongTap called.");
      //     widget.setActivityState(ActivityState.activityDetail);
      //   }, // 長押し
      // ),
    );
  }
  // Widget _activityItem(String title) {
  //   return Container(
  //     decoration: new BoxDecoration(
  //         border:
  //             new Border(bottom: BorderSide(width: 1.0, color: Colors.grey))),
  //     child: ListTile(
  //       title: Text(
  //         title,
  //         style: TextStyle(color: Colors.black, fontSize: 18.0),
  //       ),
  //       onTap: () {
  //         print("onTap called.");
  //       }, // タップ
  //       onLongPress: () {
  //         print("onLongTap called.");
  //       }, // 長押し
  //     ),
  //   );
  // }
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
  });

  final Widget thumbnail;
  final String title;
  final String date;
  final String user;
  final int distance;
  final String startPoint;
  final String wayPoint;
  final String finishPoint;

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
  }) : super(key: key);

  final String title;
  final String user;
  final String date;
  final int distance;
  final String startPoint;
  final String wayPoint;
  final String finishPoint;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(5.0, 0.0, 0.0, 0.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            title,
            style: const TextStyle(
              fontWeight: FontWeight.w500,
              fontSize: 24.0,
            ),
          ),
          const Padding(padding: EdgeInsets.symmetric(vertical: 2.0)),
          // Text(
          //   user,
          //   style: const TextStyle(fontSize: 10.0),
          // ),
          // const Padding(padding: EdgeInsets.symmetric(vertical: 1.0)),
          Text(
            date,
            style: const TextStyle(fontSize: 10.0),
          ),
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