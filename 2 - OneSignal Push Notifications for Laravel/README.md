# https://documentation.onesignal.com/docs/keys-and-ids#generate-new-user-auth-key

# https://github.com/berkayk/laravel-onesignal

```
composer require berkayk/onesignal-laravel
```

`.env`

```
ONESIGNAL_APP_ID=
ONESIGNAL_REST_API_KEY=
ONESIGNAL_USER_AUTH_KEY=your_user_auth_key
ONESIGNAL_GUZZLE_CLIENT_TIMEOUT=100
```

```
php artisan make:controller NotificationController
```


open `NotificationController.php`

```
<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;

use OneSignal;

class NotificationController extends Controller
{
    //
    public function sendNotification()
    {
        OneSignal::sendNotificationToAll(
            "This is a test notification",
            $url = null,
            $data = null,
            $buttons = null,
            $schedule = null
        );
        
        return response()->json(['success' => 'Notification sent successfully']);
    }

    public function sendToUser($playerId)
    {
        OneSignal::sendNotificationToUser(
            "Hello, this is a personalized notification!",
            $playerId,
            $url = null,
            $data = null,
            $buttons = null,
            $schedule = null
        );
        
        return response()->json(['success' => 'Notification sent to the user']);
    }
}
```

open `web.php`

```
use App\Http\Controllers\NotificationController;

Route::get('/send-notification', [NotificationController::class, 'sendNotification'])->name('send.notification.all');
Route::get('/send-notification/{playerId}', [NotificationController::class, 'sendToUser']);
```


Filament Implementation

```
<?php

namespace App\Filament\Resources\FireReportResource\Pages;

use App\Filament\Resources\FireReportResource;
use Filament\Actions;
use Filament\Resources\Pages\ListRecords;


class ListFireReports extends ListRecords
{
    protected static string $resource = FireReportResource::class;

    protected function getHeaderActions(): array
    {
        return [
            Actions\CreateAction::make(),
            Actions\Action::make("Send Notification All")->url(fn (): string => route('send.notification.all')),
        ];
    }
}
```

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