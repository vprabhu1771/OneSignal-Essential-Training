# https://www.youtube.com/watch?v=1IC3oSEI8LQ

To safely pass the OneSignal player ID or any sensitive keys in a Flutter app, you can use environment variables or other secure methods to ensure that sensitive information is not exposed. Here's a guide on how to manage environment variables in Flutter:

### Method 1: Using Flutter Dotenv
You can use the `flutter_dotenv` package to load environment variables from a `.env` file. This way, sensitive data like API keys or OneSignal IDs can be managed safely.

#### Step-by-step guide:

1. **Add `flutter_dotenv` package**:
   Add the `flutter_dotenv` package to your `pubspec.yaml` file:
   
   ```yaml
   dependencies:
     flutter:
       sdk: flutter
     flutter_dotenv: ^5.0.2
   ```

2. **Create a `.env` file**:
   In the root directory of your project, create a `.env` file where you store your sensitive variables:
   
   ```plaintext
   ONESIGNAL_PLAYER_ID=your_player_id_here
   ```

3. **Load the environment file in the main file**:
   In your `main.dart`, import the `flutter_dotenv` package and load the environment variables before running the app:

   ```dart
   import 'package:flutter/material.dart';
   import 'package:flutter_dotenv/flutter_dotenv.dart';
   
   Future<void> main() async {
     // Load the .env file
     await dotenv.load(fileName: ".env");
     runApp(MyApp());
   }
   ```

4. **Access environment variables**:
   Now, you can safely access the OneSignal player ID by referencing the environment variable like this:

   ```dart
   import 'package:flutter_dotenv/flutter_dotenv.dart';

   String oneSignalPlayerId = dotenv.env['ONESIGNAL_PLAYER_ID'] ?? '';
   ```

### Method 2: Use a Secure Backend
Another way to secure sensitive information like the OneSignal player ID is to not store it directly in the app. Instead, you can store it in your backend and retrieve it via an API.

1. **Create an API in your backend**:
   - Store the OneSignal player ID or any sensitive information in a secure server (Node.js, PHP, Laravel, etc.).
   - Provide an API endpoint to fetch this information.

2. **Call the API in Flutter**:
   Use an HTTP request from your Flutter app to fetch the OneSignal player ID.

   ```dart
   import 'package:http/http.dart' as http;
   import 'dart:convert';

   Future<String?> getOneSignalPlayerId() async {
     final response = await http.get(Uri.parse('https://your-backend-api.com/onesignal_id'));

     if (response.statusCode == 200) {
       final data = jsonDecode(response.body);
       return data['onesignal_player_id'];
     } else {
       // Handle errors
       return null;
     }
   }
   ```

3. **Use the fetched ID**:
   After fetching the ID, use it in your OneSignal setup.

   ```dart
   void initOneSignal() async {
     String? oneSignalPlayerId = await getOneSignalPlayerId();
     if (oneSignalPlayerId != null) {
       // Pass it to OneSignal setup
     }
   }
   ```

These methods will help you securely manage sensitive data like the OneSignal ID in your Flutter app.