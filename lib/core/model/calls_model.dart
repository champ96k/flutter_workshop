import 'package:flutter/material.dart';

class CallModels {
  final String profileImage;
  final String userName;
  final String date;
  final String time;
  final Widget callStatus;

  CallModels({
    required this.profileImage,
    required this.userName,
    required this.date,
    required this.time,
    required this.callStatus,
  });
}
