import 'package:flutter/material.dart';
import 'package:ride_activity/model/rider_activity.dart';
import 'package:intl/intl.dart';

class ActualDetail extends StatelessWidget {
  const ActualDetail({Key? key, required this.selectedActivity})
      : super(key: key);
  final Activities selectedActivity;
  @override
  Widget build(BuildContext context) {
    // return Container(child: Text('Actual detail'));
    return Container(
      alignment: Alignment.topLeft,
      child: Column(
        children: [
          Container(
              alignment: Alignment.center,
              child: const Text('Actual Riding!',
                  style: TextStyle(fontSize: 12, color: Colors.blue))),
          const Padding(padding: EdgeInsets.symmetric(vertical: 2.0)),
          Text(selectedActivity.plan.activityTitle,
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
          const Padding(padding: EdgeInsets.symmetric(vertical: 2.0)),
          Text(
              "${DateFormat('yyyy年M月d日 h時m分').format(selectedActivity.plan.date)} スタート"),
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
          const Padding(padding: EdgeInsets.symmetric(vertical: 2.0)),
          Text(selectedActivity.plan.rideType),
          const Padding(padding: EdgeInsets.symmetric(vertical: 8.0)),
          Wrap(
            alignment: WrapAlignment.center,
            runSpacing: 8,
            spacing: 8,
            children: selectedActivity.actual.ridePhotos
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
        ],
      ),
    );
  }
}
