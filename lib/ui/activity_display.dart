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
  final void Function(Activities activity, ActivityState status, int index)
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
    // print(widget.riderInfo.photoURL);
    // print(widget.riderInfo.riderName);
    // widget.riderInfo.photoURL != '' ? print('nothing') : print('photoURL');
    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      Container(
          child: Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
            widget.riderInfo.photoURL != ''
                ? CircleAvatar(
                    backgroundImage:
                        NetworkImage('${widget.riderInfo.photoURL}'),
                    minRadius: 25,
                    maxRadius: 25,
                  )
                : const CircleAvatar(
                    backgroundImage: NetworkImage(
                        'assets/images/undraw_profile_pic_ic5t.png'),
                    minRadius: 25,
                    maxRadius: 25,
                  ),
            const SizedBox(width: 8),
            Text(widget.riderInfo.riderName,
                style: const TextStyle(fontSize: 22)),
          ])),
      // Container(
      //     decoration: BoxDecoration(
      //         border: Border(
      //             bottom: BorderSide(width: 1.0, color: Colors.grey))),
      //     height: 300,
      //     child: Center(
      //       child:
      //           Column(
      //             mainAxisAlignment: MainAxisAlignment.center,
      //             children: [
      //         // widget.riderInfo.photoURL == null
      //         //     ? const CircleAvatar(
      //         //         backgroundImage: NetworkImage(
      //         //             'assets/images/undraw_profile_pic_ic5t.png'),
      //         //         minRadius: 50,
      //         //         maxRadius: 100,
      //         //       )
      //         //     : CircleAvatar(
      //         //         backgroundImage:
      //         //             NetworkImage('${widget..riderInfo.photoURL}'),
      //         //         minRadius: 50,
      //         //         maxRadius: 100,
      //         //       ),
      //         CircleAvatar(
      //           backgroundImage:
      //               NetworkImage('assets/images/undraw_profile_pic_ic5t.png'),
      //           minRadius: 50,
      //           maxRadius: 100,
      //         ),
      //         const SizedBox(height: 8),
      //         Text(widget.riderInfo.riderName),
      //         Text(widget.riderInfo.email),
      //         Text(widget.riderInfo.uid),
      //       ]),
      // )),

      Container(
        height: 50,
        child: Center(
          child: ElevatedButton(
              onPressed: () {
                widget.setActivityState(ActivityState.activityAddElement);
              },
              child: Text('アクティビティを予定する')),
        ),
      ),
      Expanded(
        child: ListView.builder(
          // itemCount: widget.riderActivities.length,
          itemCount: widget.activities.length,
          itemBuilder: (BuildContext context, int index) {
            // return _activityItem(widget.riderActivities[index]);
            return _activityItem(widget.activities[index], index);
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
  Widget _activityItem(Activities activity, index) {
    return Container(
      decoration: new BoxDecoration(
          border:
              new Border(bottom: BorderSide(width: 1.0, color: Colors.grey))),
      child: Card(
        color: activity.plan.done ? Colors.grey[200] : Colors.grey[50],
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
            done: activity.plan.done,
            prefacture: activity.plan.prefacture,
            rideType: activity.plan.rideType,
            shared: activity.shared,
            tags: activity.tags,
          ),
          // ),
          // Expanded(
          //     child:
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: <Widget>[
              activity.plan.done
                  ? TextButton(
                      child: const Text(''),
                      onPressed: () {},
                    )
                  : TextButton(
                      child: const Text('実走済にする'),
                      onPressed: () {
                        widget.setSelectedActivity(
                            activity, ActivityState.activityDone, index);
                        // widget.setActivityState(ActivityState.activityEdit);
                      },
                    ),
              const SizedBox(width: 8),

              TextButton(
                child: const Text('見る'),
                onPressed: () {
                  widget.setSelectedActivity(
                      activity, ActivityState.activityDetail, index);
                  // widget.setActivityState(ActivityState.activityDetail);
                },
              ),
              const SizedBox(width: 8),
              // TextButton(
              //   child: const Text('Delete'),
              //   onPressed: () {
              //     widget.setSelectedActivity(
              //         activity, ActivityState.activityRemove);
              //     // widget.setActivityState(ActivityState.activityRemove);
              //   },
              // ),
              // const SizedBox(width: 8),
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
    required this.done,
    required this.prefacture,
    required this.rideType,
    required this.shared,
    required this.tags,
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
  final List<String> prefacture;
  final String rideType;
  final bool shared;
  final List<String> tags;

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
              prefacture: prefacture,
              rideType: rideType,
              shared: shared,
              tags: tags,
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
    required this.prefacture,
    required this.rideType,
    required this.shared,
    required this.tags,
  }) : super(key: key);

  final String title;
  final String user;
  final String date;
  final int distance;
  final String startPoint;
  final String wayPoint;
  final String finishPoint;
  final bool done;
  final List<String> prefacture;
  final String rideType;
  final bool shared;
  final List<String> tags;

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
          Wrap(alignment: WrapAlignment.start, children: [
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

          // distance ridetipe--------------------------------------------
          Row(mainAxisSize: MainAxisSize.min, children: [
            Text(
              '$distance km',
              style: const TextStyle(fontSize: 12.0),
            ),
            SizedBox(width: 4),
            Text(
              '$rideType ,',
              style: const TextStyle(fontSize: 12.0),
            ),
          ]),
          const Padding(padding: EdgeInsets.symmetric(vertical: 1.0)),

          //prefectur-------------------------------------------------
          Wrap(
            runSpacing: 8,
            spacing: 8,
            children: prefacture
                .map((item) => Text(
                      '$item ',
                      style: const TextStyle(fontSize: 12.0),
                    ))
                .toList(),
          ),
          const Padding(padding: EdgeInsets.symmetric(vertical: 5.0)),
          //tags ------------------------------------------------------
          Wrap(
            runSpacing: 8,
            spacing: 8,
            children: [
              for (final tag in tags)
                // SizedBox(
                //   width: 100,
                //   height: 28,
                //   child:
                ElevatedButton.icon(
                  onPressed: () {},
                  icon: Icon(
                    Icons.sell,
                    size: 12,
                  ),
                  label: Text(
                    "$tag",
                    // overflow: TextOverflow.ellipsis,
                  ),
                  style: ElevatedButton.styleFrom(
                    textStyle: TextStyle(fontSize: 12),
                    primary: Colors.white70,
                    onPrimary: Colors.black87,
                  ),
                ),
              // )

              // ]))
              // Text(
              //   '$tag,',
              //   style: const TextStyle(fontSize: 12.0),
              // ),
              // ),
            ],
          )
          // Row(
          //   children: tags.forEach((element) {
          //     Text(element);
          //   }),
          // Row(children: tags.forEach((key, value) {
          //   Text(value)
          // })
          // Row(children: tags.map((item) => new Text(item)).toList()),
          // Row(children: tags.forEach((key, value) {
          //   Text(value)
          // })
          // ),
          // Expanded(
          //     child: ListView.builder(
          //         itemCount: tags.length,
          //         itemBuilder: (BuildContext context, int index) {
          //           return Text(tags[index]);
          //         }))
          // Row(mainAxisSize: MainAxisSize.min, children: [
          // ListView.builder(
          //     itemCount: tags.length,
          //     itemBuilder: (BuildContext context, int index) {
          //       return Text(tags[index]);
          //     })
          // SizedBox(width: 4),
          // ]),
        ],
      ),
    );
  }
}
