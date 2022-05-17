import 'package:flutter/material.dart';
import 'package:ride_activity/application_state.dart';
import 'package:ride_activity/model/status.dart';

import '../model/rider_activity.dart';
import '../model/rider_info.dart';

class ActivityDisplay extends StatefulWidget {
  const ActivityDisplay({
    Key? key,
    required this.setActivityState,
    required this.riderActivities,
    required this.riderInfo,
  }) : super(key: key);
  final void Function(ActivityState status) setActivityState;
  final List<RiderActivities> riderActivities;
  final RiderInfo riderInfo;

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
              child: Text('Add')),
        ),
      ),
      Expanded(
        child: ListView.builder(
          itemCount: widget.riderActivities.length,
          itemBuilder: (BuildContext context, int index) {
            return _messageItem(widget.riderActivities[index]);
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
      //       return _messageItem(list[index]);
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

  Widget _messageItem(RiderActivities activity) {
    return Container(
      decoration: new BoxDecoration(
          border:
              new Border(bottom: BorderSide(width: 1.0, color: Colors.grey))),
      child: ListTile(
        title: Text(
          activity.activityTitle,
          style: TextStyle(color: Colors.black, fontSize: 18.0),
        ),
        onTap: () {
          print("onTap called.");
          widget.setActivityState(ActivityState.activityDetail);
        }, // タップ
        onLongPress: () {
          print("onLongTap called.");
          widget.setActivityState(ActivityState.activityDetail);
        }, // 長押し
      ),
    );
  }
  // Widget _messageItem(String title) {
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
