import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_laravel_student_result_system/screens/HomeScreen.dart';
import 'package:flutter_laravel_student_result_system/services/auth.dart';
import 'package:onesignal_flutter/onesignal_flutter.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:provider/provider.dart';

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

  // The promptForPushNotificationsWithUserResponse function will show the iOS or Android push notification prompt
  OneSignal.Notifications.requestPermission(true);

  runApp(MyApp());
}

// class MyApp extends StatelessWidget {
//   const MyApp({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       debugShowCheckedModeBanner: false,
//       home: Scaffold(
//         body: Center(
//           child: TextButton(
//             onPressed: () async {
//               print("TextButton pressed");
//
//               // Get OneSignal player ID
//               var playerId = OneSignal.User.pushSubscription.id.toString();
//               print("Player ID: $playerId");
//
//               // Replace with your backend login API
//               var url = 'http://192.168.1.122:8000/api/login';
//
//               // Simulate login request (add email, password, etc. here)
//               var body = json.encode({
//                 'email': 'admin@gmail.com', // Replace with actual user email
//                 'password': 'admin',    // Replace with actual password
//                 'device_name': 'MyFlutterApp',
//                 'player_id': playerId         // Send player ID
//               });
//
//               var response = await http.post(
//                 Uri.parse(url),
//                 headers: {"Content-Type": "application/json"},
//                 body: body,
//               );
//
//               if (response.statusCode == 200) {
//                 print("Login successful, notification sent");
//               } else {
//                 print(response.body);
//                 print("Failed to login");
//               }
//             },
//             child: Text("Send OneSignal Token to Node.js"),
//           ),
//         ),
//       ),
//     );
//   }
// }

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => Auth()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        initialRoute: '/home',
        routes: {
          '/home': (context) => HomeScreen(title: 'Home'),
        },
      ),
    );
  }
}