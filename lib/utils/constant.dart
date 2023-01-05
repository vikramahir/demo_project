import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Constant {
  static String baseURL = 'https://api.publicapis.org/';

  static var webPadding = 65.w;
  static var tabPadding = 10.w;
  static final textSize = 10.sp;
  static final iconSize = 21.sp;

  static Widget bottomNavigationBar = Visibility(
    visible: !kIsWeb,
    child: Container(
      height: 60.h,
      decoration: const BoxDecoration(
        color: Colors.redAccent,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                Icons.supervised_user_circle,
                size: iconSize,
              ),
              SizedBox(
                height: 0.5.h,
              ),
              Text(
                'User',
                style: TextStyle(fontSize: textSize),
              ),
            ],
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                Icons.access_alarm,
                size: iconSize,
              ),
              SizedBox(
                height: 0.5.h,
              ),
              Text(
                'User',
                style: TextStyle(fontSize: textSize),
              ),
            ],
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                Icons.account_balance,
                size: iconSize,
              ),
              SizedBox(
                height: 0.5.h,
              ),
              Text(
                'User',
                style: TextStyle(fontSize: textSize),
              ),
            ],
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                Icons.account_box_rounded,
                size: iconSize,
              ),
              SizedBox(
                height: 0.5.h,
              ),
              Text(
                'User',
                style: TextStyle(fontSize: textSize),
              ),
            ],
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                Icons.settings,
                size: iconSize,
              ),
              SizedBox(
                height: 0.5.h,
              ),
              Text(
                'User',
                style: TextStyle(fontSize: textSize),
              ),
            ],
          ),
        ],
      ),
    ),
  );

  static int add(int x, int y) {
    return x + y;
  }

  static int sub(int x, int y) {
    return x - y;
  }
}
