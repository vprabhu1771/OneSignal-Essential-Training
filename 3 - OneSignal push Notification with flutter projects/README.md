# OneSignal push Notification with flutter projects

# https://www.youtube.com/watch?v=4VknMaQNrhM

# 2024
# https://www.youtube.com/watch?v=v2BzkbCC8CM

# https://github.com/OneSignal/OneSignal-Flutter-SDK/blob/main/MIGRATION_GUIDE.md

Firebase -> Add Project -> untitled -> Create Project

Project Overview -> Project Settings -> Service Accounts -> Generate Key




OneSignal -> Your Apps -> New App/Website 

Name of your app or website -> untitled

Set up web push or mobile push -> Google Android (FCM) -> Next: Configure Your Platform



Flutter Implementation

https://pub.dev/packages/onesignal_flutter



```
C:\Users\windows_rig2\StudioProjects\flutter_laravel_student_result_system\android\app\build.gradle
```

```
build.gradle
```

```
defaultConfig {
        // TODO: Specify your own unique Application ID (https://developer.android.com/studio/build/application-id.html).
        applicationId "com.example.flutter_laravel_student_result_system"
        // You can update the following values to match your application needs.
        // For more information, see: https://docs.flutter.dev/deployment/android#reviewing-the-gradle-build-configuration.
        minSdkVersion 21
        targetSdkVersion 33
        versionCode flutterVersionCode.toInteger()
        versionName flutterVersionName
    }
```

