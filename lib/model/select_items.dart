import 'package:flutter/material.dart';

final List<Map<String, dynamic>> rideTypeItems = [
  {
    'value': 'funRide',
    'label': 'ファンライド',
    'icon': Icon(Icons.sentiment_very_satisfied),
    'enable': true,
    // 'textStyle': TextStyle(color: Colors.green),
  },
  {
    'value': 'trainingShort',
    'label': 'トレーニング(ショート160km未満)',
    'icon': Icon(Icons.sentiment_neutral),
    'enable': true,
    // 'textStyle': TextStyle(color: Colors.blue),
  },
  {
    'value': 'trainingLogn',
    'label': 'トレーニング(ロング160km以上)',
    'icon': Icon(Icons.sentiment_very_dissatisfied),
    'enable': true,
    // 'textStyle': TextStyle(color: Colors.red),
  },
  {
    'value': 'event',
    'label': 'イベント',
    'icon': Icon(Icons.favorite),
    // 'textStyle': TextStyle(color: Colors.pink),
    'enable': true,
  },
  {
    'value': 'other',
    'label': 'その他',
    'icon': Icon(Icons.question_mark),
    // 'textStyle': TextStyle(color: Colors.pink),
    'enable': true,
  },
];
