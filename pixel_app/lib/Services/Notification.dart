// import 'dart:convert';
//
// import 'package:firebase_messaging/firebase_messaging.dart';
// import 'package:flutter/foundation.dart';
// import 'package:flutter/rendering.dart';
// import 'package:flutter_local_notifications/flutter_local_notifications.dart';
// Future<void> handleBackgroundMessage(RemoteMessage? message) async{
//   if(message == null)return;
//   debugPrint("Message = ${message.notification?.title}");
//   debugPrint("Message = ${message.notification?.body}");
// }
//
// late AndroidNotificationChannel channel;
//
// bool isFlutterLocalNotificationsInitialized = false;
// late FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin;
// class notificationclass{
//
//   final _firebaseMessaging = FirebaseMessaging.instance;
//
//   handleMessage(RemoteMessage? message){
//     if(message == null)return;
//     debugPrint("Message = ${message.notification?.title}");
//   }
//
//   Future<void> initlocalnotification() async {
//     final InitializationSettings initializationSettings = InitializationSettings(
//       android:  AndroidInitializationSettings("@mipmap/ic_launcher"),
//     );
//     await flutterLocalNotificationsPlugin.initialize(
//       initializationSettings,
//       onDidReceiveNotificationResponse:
//           (NotificationResponse notificationResponse) {
//         debugPrint("Fev ${notificationResponse.payload}");
//       },
//       );
//   }
//
//   Future<void> setupFlutterNotifications() async {
//     if (isFlutterLocalNotificationsInitialized) {
//       return;
//     }
//     channel = const AndroidNotificationChannel(
//       'high_importance_channel', // id
//       'High Importance Notifications', // title
//       description:
//       'This channel is used for important notifications.', // description
//       importance: Importance.high,
//     );
//
//     flutterLocalNotificationsPlugin = FlutterLocalNotificationsPlugin();
//
//     /// Create an Android Notification Channel.
//     ///
//     /// We use this channel in the `AndroidManifest.xml` file to override the
//     /// default FCM channel to enable heads up notifications.
//     await flutterLocalNotificationsPlugin
//         .resolvePlatformSpecificImplementation<
//         AndroidFlutterLocalNotificationsPlugin>()
//         ?.createNotificationChannel(channel);
//
//     /// Update the iOS foreground notification presentation options to allow
//     /// heads up notifications.
//     await FirebaseMessaging.instance.setForegroundNotificationPresentationOptions(
//       alert: true,
//       badge: true,
//       sound: true,
//     );
//     isFlutterLocalNotificationsInitialized = true;
//   }
//
//     initPushNotification(){
//       _firebaseMessaging.getInitialMessage().then((handleMessage));
//       FirebaseMessaging.onMessageOpenedApp.listen(handleMessage);
//       FirebaseMessaging.onBackgroundMessage(handleBackgroundMessage);
//       FirebaseMessaging.onMessage.listen(showFlutterNotification);
//     }
//
//   void showFlutterNotification(RemoteMessage message) {
//     RemoteNotification? notification = message.notification;
//     AndroidNotification? android = message.notification?.android;
//     if (notification != null && android != null && !kIsWeb) {
//       flutterLocalNotificationsPlugin.show(
//         notification.hashCode,
//         notification.title,
//         notification.body,
//         // payload: jsonEncode(message.toMap(),),
//         NotificationDetails(
//           android: AndroidNotificationDetails(
//             channel.id,
//             channel.name,
//             channelDescription: channel.description,
//             // TODO add a proper drawable resource to android, for now using
//             //      one that already exists in example app.
//             icon: '@mipmap/ic_launcher',
//           ),
//         ),
//
//        payload: jsonEncode(message.toMap(),),
//
//     );
//     }
//   }
//     initnotification() async {
//     await _firebaseMessaging.requestPermission();
//     final fcmToken = await _firebaseMessaging.getToken();
//     // debugPrint("Token -- $fcmToken");
//
//    // Future<void> setupFlutterNotification()async{
//      await setupFlutterNotifications();
//     initlocalnotification();
//      initnotification();
//
//     }
//
//
// }
//




import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';


class LocalNotificationService {
  static final FlutterLocalNotificationsPlugin _notificationsPlugin =
  FlutterLocalNotificationsPlugin();

  static void initialize() {
    // initializationSettings  for Android
    const InitializationSettings initializationSettings =
    InitializationSettings(
      android: AndroidInitializationSettings("@mipmap/ic_launcher"),
    );

    _notificationsPlugin.initialize(
      initializationSettings,
    );
  }

  static void createanddisplaynotification(RemoteMessage message) async {
    try {
      final id = DateTime.now().millisecondsSinceEpoch ~/ 1000;
      const NotificationDetails notificationDetails = NotificationDetails(
          android: AndroidNotificationDetails(
            "pixel_app",
            "pixel_app_appchannel",
            importance: Importance.max,
            priority: Priority.high,
            //sound: RawResourceAndroidNotificationSound('notification'),
          ),
          iOS: DarwinNotificationDetails(
            // sound: 'notification.wav',
            presentAlert: true,
            presentBadge: true,
            presentSound: true,
          ));
      print("Notification get data");

      /* IF APP OPEN IN TIME YOU SHOW NOTIFICATION THAT TIME USED */
      await _notificationsPlugin.show(id, message.notification!.title,
          message.notification!.body!, notificationDetails);
    } on Exception catch (e) {
      print("FIREBASE ERROR ===>" + e.toString());
    }
  }
}

class MessagingService {
  static String? fcmToken; // Variable to store the FCM token

  static final MessagingService _instance = MessagingService._internal();

  factory MessagingService() => _instance;

  MessagingService._internal();

  final FirebaseMessaging _fcm = FirebaseMessaging.instance;

  Future<void> init(BuildContext context) async {
    // Requesting permission for notifications
    NotificationSettings settings = await _fcm.requestPermission(
      alert: true,
      announcement: false,
      badge: true,
      carPlay: false,
      criticalAlert: false,
      provisional: false,
      sound: true,
    );
    debugPrint(
        'User granted notifications permission: ${settings.authorizationStatus}');
    // Retrieving the FCM token
    fcmToken = await _fcm.getToken();
    debugPrint(fcmToken);

    // Handling background messages using the specified handler
    FirebaseMessaging.onBackgroundMessage(_firebaseMessagingBackgroundHandler);

    // Listening for incoming messages while the app is in the foreground
    FirebaseMessaging.onMessage.listen((RemoteMessage message) {
      debugPrint('Got a message whilst in the foreground!');
      debugPrint('Message data: ${message.notification!.title.toString()}');
      debugPrint('Message data1: ${message.notification!.body}');


      if (message.notification !=  null) {
          final notificationData = message.data;
          final screen = notificationData['screen'];
          LocalNotificationService.createanddisplaynotification(message);
          debugPrint(
              'open -----: ${message.notification!.title.toString()}');
          // _handleNotificationClick(context, message);
          // _handleNotificationClick(context, message);
          // Showing an alert dialog when a notification is received (Foreground state)
          // showDialog(
          //   context: context,
          //   barrierDismissible: false,
          //   builder: (BuildContext context) {
          //     return WillPopScope(
          //       onWillPop: () async => false,
          //       child: AlertDialog(
          //         title: Text(message.notification!.title!),
          //         content: Text(message.notification!.body!),
          //         actions: [
          //           if (notificationData.containsKey('screen'))
          //             TextButton(
          //               onPressed: () {
          //                 Navigator.pop(context);
          //                 Navigator.of(context).pushNamed(screen);
          //               },
          //               child: const Text('Open Screen'),
          //             ),
          //           TextButton(
          //             onPressed: () => Navigator.of(context).pop(),
          //             child: const Text('Dismiss'),
          //           ),
          //         ],
          //       ),
          //     );
          //   },
          // );
      }
    });

    FirebaseMessaging.instance.getInitialMessage().then((message) {
      if (message != null) {
        _handleNotificationClick(context, message);
        // Localnotification().sendNotification(body:message.notification?.body,title: message.notification?.title );
      }
    });

    // Handling a notification click event when the app is in the background
    FirebaseMessaging.onMessageOpenedApp.listen((RemoteMessage message) {
      debugPrint(
          'onMessageOpenedApp: ${message.notification!.title.toString()}');
      // Localnotification().sendNotification(body:message.notification?.body,title: message.notification?.title );
      _handleNotificationClick(context, message);
    });
  }

  // Handling a notification click event by navigating to the specified screen
  void _handleNotificationClick(BuildContext context, RemoteMessage message) {
    final notificationData = message.data;

    if (notificationData.containsKey('screen')) {
      final screen = notificationData['screen'];
      Navigator.of(context).pushNamed(screen);
    }
  }
}

// Handler for background messages
@pragma('vm:entry-point')
Future<void> _firebaseMessagingBackgroundHandler(RemoteMessage message) async {
  // If you're going to use other Firebase services in the background, such as Firestore,
  // make sure you call `initializeApp` before using other Firebase services.
  // Localnotification().showNotification(body:message.notification?.body,title: message.notification?.title );

  debugPrint('Handling a background message: ${message.notification!.title}');
}