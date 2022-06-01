import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:flutter/material.dart';

class Activities {
  Activities({
    required this.plan,
    required this.actual,
    required this.menber,
    required this.shared,
    required this.tags,
    required this.createdAt,
    required this.updateAt,
    required this.status,
  });
  final RiderActivities plan;
  final ActualRide actual;
  final Menber menber;

  final bool shared;
  final List<String> tags;
  final DateTime createdAt;
  final DateTime updateAt;
  final String status; //  push,  visible,  active,  inactive,  invisible,  pop,
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
    required this.prefacture,
    required this.rideType,
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

  final List<String> prefacture;
  final String rideType;
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
