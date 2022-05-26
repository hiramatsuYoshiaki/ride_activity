import 'package:flutter/material.dart';

class Activities {
  Activities({
    required this.plan,
    required this.actual,
    required this.menber,
  });
  final RiderActivities plan;
  final ActualRide actual;
  final Menber menber;
}

class RiderActivities {
  RiderActivities({
    required this.uid,
    required this.activityTitle,
    required this.date,
    required this.distance,
    required this.done,
    required this.couseURL,
    required this.startPoint,
    required this.wayPoint,
    required this.finishPoint,
  });
  final String uid;
  final String activityTitle;
  final DateTime date;
  final int distance;
  final bool done;
  final String couseURL;
  final String startPoint;
  final String wayPoint;
  final String finishPoint;
}

class ActualRide {
  ActualRide({
    required this.rideURL,
    required this.ridePhotos,
  });
  final String rideURL;
  final List<String> ridePhotos;
}

class Menber {
  Menber({
    required this.rider,
  });
  final List<String> rider;
}
