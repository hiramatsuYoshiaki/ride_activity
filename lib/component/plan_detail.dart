import 'package:flutter/material.dart';

import '../model/rider_activity.dart';
import 'package:intl/intl.dart';

class PlanDetail extends StatelessWidget {
  const PlanDetail({Key? key, required this.selectedActivity})
      : super(key: key);
  final Activities selectedActivity;
  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.topLeft,
      child: Column(
        children: [
          Container(
              alignment: Alignment.center,
              child: const Text('Scheduled Riding!',
                  style: TextStyle(fontSize: 12, color: Colors.pink))),
          const Padding(padding: EdgeInsets.symmetric(vertical: 2.0)),
          Text(selectedActivity.plan.activityTitle,
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
          const Padding(padding: EdgeInsets.symmetric(vertical: 2.0)),
          Text(
              "${DateFormat('yyyy年M月d日 h時m分').format(selectedActivity.plan.date)} スタート"),
          const Padding(padding: EdgeInsets.symmetric(vertical: 2.0)),
          Row(mainAxisSize: MainAxisSize.min, children: [
            Text(
              '${selectedActivity.plan.distance} km',
              style: const TextStyle(fontSize: 20.0),
            ),
            SizedBox(width: 4),
            Text(
              '${selectedActivity.plan.rideType}',
              style: const TextStyle(fontSize: 16.0),
            ),
          ]),
          const Padding(padding: EdgeInsets.symmetric(vertical: 2.0)),
          Wrap(alignment: WrapAlignment.start, children: [
            Text(selectedActivity.plan.startPoint),
            SizedBox(width: 4),
            Text('～'),
            SizedBox(width: 4),
            Text(selectedActivity.plan.wayPoint),
            SizedBox(width: 4),
            Text('～'),
            SizedBox(width: 4),
            Text(selectedActivity.plan.finishPoint),
          ]),
          const Padding(padding: EdgeInsets.symmetric(vertical: 2.0)),
          Wrap(
            runSpacing: 8,
            spacing: 8,
            children: selectedActivity.plan.prefacture
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
                    children: selectedActivity.menber.rider
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
      ),
    );
  }
}
