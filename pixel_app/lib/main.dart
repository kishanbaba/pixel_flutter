
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:pixel_app/Employee/screens/employee_bottom_bar.dart';
import 'package:pixel_app/Services/Notification.dart';
import 'package:pixel_app/firebase_options.dart';
import 'package:pixel_app/splash_screen.dart';


Future<void> main() async {

  await GetStorage.init();

  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options:  DefaultFirebaseOptions.currentPlatform,);
  LocalNotificationService.initialize();
  // await notificationclass().initnotification();
  runApp(const MyApp());
  }

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void initState() {
    super.initState();
  }
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return const GetMaterialApp(
      debugShowCheckedModeBanner: false,
      home: SpleshScreen(),
    );
  }
}
