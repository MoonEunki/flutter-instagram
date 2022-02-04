// File generated by FlutterFire CLI.
// ignore_for_file: lines_longer_than_80_chars
import 'package:firebase_core/firebase_core.dart' show FirebaseOptions;
import 'package:flutter/foundation.dart'
    show defaultTargetPlatform, kIsWeb, TargetPlatform;

/// Default [FirebaseOptions] for use with your Firebase apps.
///
/// Example:
/// ```dart
/// import 'firebase_options.dart';
/// // ...
/// await Firebase.initializeApp(
///   options: DefaultFirebaseOptions.currentPlatform,
/// );
/// ```
class DefaultFirebaseOptions {
  static FirebaseOptions get currentPlatform {
    if (kIsWeb) {
      return web;
    }
    // ignore: missing_enum_constant_in_switch
    switch (defaultTargetPlatform) {
      case TargetPlatform.android:
        return android;
      case TargetPlatform.iOS:
        return ios;
      case TargetPlatform.macOS:
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for macos - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
    }

    throw UnsupportedError(
      'DefaultFirebaseOptions are not supported for this platform.',
    );
  }

  static const FirebaseOptions web = FirebaseOptions(
    apiKey: 'AIzaSyA-4d0tXVKs84QPmAS0FzWYDqz-_ItRzXM',
    appId: '1:315399141272:web:bc7b363361a49e31a19ded',
    messagingSenderId: '315399141272',
    projectId: 'newagent-4d115',
    authDomain: 'newagent-4d115.firebaseapp.com',
    databaseURL: 'https://newagent-4d115.firebaseio.com',
    storageBucket: 'newagent-4d115.appspot.com',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyAwMctpdwF0co7um03EDuOSC6Z0X6HuWoM',
    appId: '1:315399141272:android:2766925197d8044ba19ded',
    messagingSenderId: '315399141272',
    projectId: 'newagent-4d115',
    databaseURL: 'https://newagent-4d115.firebaseio.com',
    storageBucket: 'newagent-4d115.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyCdXBkWk-cYs0i-9C2zoAy_nyni-kCWDJ0',
    appId: '1:315399141272:ios:b1e2d4e760224942a19ded',
    messagingSenderId: '315399141272',
    projectId: 'newagent-4d115',
    databaseURL: 'https://newagent-4d115.firebaseio.com',
    storageBucket: 'newagent-4d115.appspot.com',
    iosClientId: '315399141272-lsvcbur9mqkjjpvju3dcfmt77r0qbmep.apps.googleusercontent.com',
    iosBundleId: 'com.mek.instagram',
  );
}
