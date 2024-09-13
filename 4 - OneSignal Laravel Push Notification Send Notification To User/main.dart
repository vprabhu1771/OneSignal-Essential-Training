import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:onesignal_flutter/onesignal_flutter.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:flutter_dotenv/flutter_dotenv.dart';

import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  //Remove this method to stop OneSignal Debugging
  OneSignal.Debug.setLogLevel(OSLogLevel.verbose);

  // Load the .env file
  await dotenv.load(fileName: ".env");

  String oneSignalAppId = dotenv.env['ONESIGNAL_APP_ID'] ?? '';

  // Initialize OneSignal
  OneSignal.initialize(oneSignalAppId);

  // The promptForPushNotificationsWithUserResponse function will show the iOS or Android push notification prompt. We recommend removing the following code and instead using an In-App Message to prompt for notification permission
  OneSignal.Notifications.requestPermission(true);

  runApp(MyApp());
}

class MyApp extends StatelessWidget {

  const MyApp({super.key});


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: Center(
          child: TextButton(
            onPressed: () async {
              print("TextButton pressed");
              // Player ID
              var id = OneSignal.User.pushSubscription.id.toString();
              print(id);

              var playerId = OneSignal.User.pushSubscription.id.toString();

              // Send HTTP request to your Node.js backend
              var url = 'http://192.168.1.122:8000/send-notification/$playerId';
              var response = await http.get(Uri.parse(url));

              if (response.statusCode == 200) {
                print("Notification sent successfully");
              } else {
                print("Failed to send notification");
              }
            },
            child: Text("Send OneSignal Token to Node.js"),
          ),
        ),
      ),
    );
  }
}