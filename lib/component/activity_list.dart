import 'package:flutter/material.dart';
import '../model/rider_activity.dart';
import 'package:intl/intl.dart';

class ActivityList extends StatefulWidget {
  const ActivityList({required this.activity, required this.index, Key? key})
      : super(key: key);
  final Activities activity;
  final int index;

  @override
  _ActivityListState createState() => _ActivityListState();
}

class _ActivityListState extends State<ActivityList> {
  @override
  Widget build(BuildContext context) {
    // return Container(
    //   child: Text(widget.activity.plan.activityTitle),
    // );
    return Container(
        // padding: const EdgeInsets.fromLTRB(5.0, 0.0, 0.0, 0.0),
        width: double.infinity,
        decoration: BoxDecoration(
            border: Border(bottom: BorderSide(width: 1.0, color: Colors.grey))),
        child: Card(
            color:
                widget.activity.plan.done ? Colors.grey[200] : Colors.grey[50],
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 5.0, horizontal: 4),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  //title-----------------------------------
                  const Padding(padding: EdgeInsets.symmetric(vertical: 2.0)),
                  Row(mainAxisSize: MainAxisSize.min, children: [
                    widget.activity.plan.done
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
                      widget.activity.plan.activityTitle,
                      style: const TextStyle(
                        fontWeight: FontWeight.w500,
                        fontSize: 24.0,
                      ),
                    ),
                    SizedBox(width: 4),
                  ]),

                  //date---------------------------------------------
                  const Padding(padding: EdgeInsets.symmetric(vertical: 1.0)),
                  Row(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          DateFormat('yyyy年M月d日 hh時mm分')
                              .format(widget.activity.plan.date),
                          style: const TextStyle(
                            fontWeight: FontWeight.w500,
                            fontSize: 16.0,
                          ),
                        ),
                        SizedBox(width: 4),
                        widget.activity.plan.done
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
                    Text(widget.activity.plan.startPoint),
                    SizedBox(width: 4),
                    Text('～'),
                    SizedBox(width: 4),
                    Text(widget.activity.plan.wayPoint),
                    SizedBox(width: 4),
                    Text('～'),
                    SizedBox(width: 4),
                    Text(widget.activity.plan.finishPoint),
                  ]),
                  const Padding(padding: EdgeInsets.symmetric(vertical: 1.0)),

                  // distance ridetipe--------------------------------------------
                  Row(mainAxisSize: MainAxisSize.min, children: [
                    Text(
                      '${widget.activity.plan.distance} km',
                      style: const TextStyle(fontSize: 12.0),
                    ),
                    SizedBox(width: 4),
                    Text(
                      '${widget.activity.plan.rideType} ,',
                      style: const TextStyle(fontSize: 12.0),
                    ),
                  ]),
                  const Padding(padding: EdgeInsets.symmetric(vertical: 1.0)),

                  //prefectur-------------------------------------------------
                  Wrap(
                    runSpacing: 8,
                    spacing: 8,
                    children: widget.activity.plan.prefacture
                        .map((item) => Text(
                              '$item,',
                              style: const TextStyle(fontSize: 12.0),
                            ))
                        .toList(),
                  ),
                  const Padding(padding: EdgeInsets.symmetric(vertical: 1.0)),
                  //tags ------------------------------------------------------
                  Wrap(
                    runSpacing: 8,
                    spacing: 8,
                    children: [
                      for (final tag in widget.activity.tags)
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
                  ),

                  //button----------------------------------------
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: <Widget>[
                      TextButton(
                        child: const Text('見る'),
                        onPressed: () {
                          // widget.setSelectedActivity(
                          //     activity, ActivityState.activityDetail, index);
                          // widget.setActivityState(ActivityState.activityDetail);
                        },
                      ),
                      const SizedBox(width: 8),
                    ],
                  )
                ],
              ),
            )));
  }
}
