// ignore_for_file: unnecessary_null_comparison

import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:pixel_app/Client/Screens/bottom_bar.dart';
import 'package:pixel_app/Employee/screens/employee_bottom_bar.dart';
import 'package:pixel_app/Services/Notification.dart';
import 'package:pixel_app/login_screen.dart';
import 'package:pixel_app/Services/pref_manager.dart';
import 'package:pixel_app/utils/colors.dart';

// Future<void> _firebaseMessegingBackgroundHandler(RemoteMessage message) async {
//
// }

class SpleshScreen extends StatefulWidget {
  const SpleshScreen({Key? key}) : super(key: key);

  @override
  _SpleshScreenState createState() => _SpleshScreenState();
}

class _SpleshScreenState extends State<SpleshScreen> {


final _messagingService = MessagingService();

  @override
  void initState() {
    _messagingService.init(context);
    // print('CLIENT ID :: ${PreferenceManager.getClientId() ?? ''}');

    // int clientId = PreferenceManager.getClientId();

    // client
    if (PreferenceManager.getUserType() == 'client') {
      if (PreferenceManager.getClientId().isNotEmpty &&
          PreferenceManager.getClientId() != '') {
        Future.delayed(
          Duration(seconds: 3),
          () {
            Get.offAll(BottomBarScreen());
          },
        );
      }
    } else if (PreferenceManager.getUserType() == 'employee') {
      if (PreferenceManager.getEmailId().isNotEmpty &&
          PreferenceManager.getEmailId() != '') {
        Future.delayed(
          Duration(seconds: 3),
          () {
            Get.off(EmployeeBottomBarScreen());
          },
        );
      }
    } else {
      Future.delayed(
        Duration(seconds: 3),
        () {
          Navigator.push(
              context, MaterialPageRoute(builder: (Context) => LoginScreen()));
        },
      );
    }
    // else {
    //   Future.delayed(
    //     Duration(seconds: 3),
    //     () {
    //       Navigator.push(
    //           context, MaterialPageRoute(builder: (Context) => LoginScreen()));
    //     },
    //   );
    // }

    // Future.delayed(
    //   Duration(seconds: 3),
    //   () {
    //     clientId != null
    //         ? Get.off(BottomBarScreen())
    //         : Navigator.push(
    //             context, MaterialPageRoute(builder: (Contex) => LoginScreen()));
    //   },
    // );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorUtils.kGrayMain,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image(
              image: AssetImage('assets/png/ic_logo.png'),
            )
          ],
        ),
      ),
    );
  }
}
