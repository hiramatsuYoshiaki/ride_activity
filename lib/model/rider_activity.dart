// import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class Activities {
  final RiderActivities plan;
  final ActualRide actual;
  final Menber menber;

  final bool shared;
  final List<String> tags;
  final DateTime createdAt;
  final DateTime updateAt;
  final String status; //  push,  visible,  active,  inactive,  invisible,  pop,
  final String id;
  Activities({
    required this.plan,
    required this.actual,
    required this.menber,
    required this.shared,
    required this.tags,
    required this.createdAt,
    required this.updateAt,
    required this.status,
    required this.id,
  });
  factory Activities.fromFirestore(
    DocumentSnapshot<Map<String, dynamic>> snapshot,
    SnapshotOptions? options,
  ) {
    final data = snapshot.data();
    return Activities(
      // plan: data?['plan'],
      // actual: data?['actual'],
      // menber: data?['menber'],
      plan: RiderActivities(
        uid: data?['plan.uid'],
        // _riderInfo.uid,
        activityTitle: data?['plan.activityTitle'],
        // activity.plan.activityTitle,
        date: data?['plan.date'],
        // activity.plan.date,
        distance: data?['plan.distance'],
        // activity.plan.distance,
        done: data?['plan.done'],
        // activity.plan.done,
        startPoint: data?['plan.startPoint'],
        // activity.plan.startPoint,
        wayPoint: data?['plan.wayPoint'],
        // activity.plan.wayPoint,
        finishPoint: data?['plan.finishPoint'],
        // activity.plan.finishPoint,
        couseURL: data?['plan.couseURL'],
        // activity.plan.couseURL,
        prefacture: data?['plan.prefacture'],
        // activity.plan.prefacture,
        rideType: data?['plan.rideType'],
        // activity.plan.rideType,
      ),
      actual: ActualRide(
        rideURL: data?['actual.rideURL'],
        // activity.actual.rideURL,
        ridePhotos: data?['actual.ridePhotos'],
        // activity.actual.ridePhotos,
      ),
      menber: Menber(
        rider: data?['menber.rider'],
        // activity.menber.rider
      ),
      shared: data?['shared'],
      tags: data?['tags'],
      createdAt: data?['createdAt'],
      updateAt: data?['updateAt'],
      status: data?['status'],
      id: data?['id'],
    );
  }

  Map<String, dynamic> toFirestore() {
    return {
      // 'plan': plan,
      'plan': {
        'uid': plan.uid,
        'activityTitle': plan.activityTitle,
        'date': plan.date,
        'distance': plan.distance,
        'done': plan.done,
        'couseURL': plan.couseURL,
        'startPoint': plan.startPoint,
        'wayPoint': plan.wayPoint,
        'finishPoint': plan.finishPoint,
        'prefacture': plan.prefacture,
        'rideType': plan.rideType,
      },
      // 'actual': actual,
      'actual': {
        'rideURL': actual.rideURL,
        'ridePhotos': actual.ridePhotos,
      },
      // 'menber': menber,
      'menber': {
        'rider': menber.rider,
      },
      'shared': shared,
      'tags': tags,
      'createdAt': createdAt,
      'updateAt': updateAt,
      'status': status,
      'id': id,
    };
  }
}

class RiderActivities {
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
}

class ActualRide {
  final String rideURL;
  final List<String> ridePhotos;
  ActualRide({
    required this.rideURL,
    required this.ridePhotos,
  });
}

class Menber {
  final List<String> rider;
  Menber({
    required this.rider,
  });
}
