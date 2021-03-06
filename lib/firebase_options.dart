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
    apiKey: 'AIzaSyBRACkTYOv4zyejuEzQkRQPAfaDhYLsqJM',
    appId: '1:389088884405:web:8fed24af23d177aa8030fc',
    messagingSenderId: '389088884405',
    projectId: 'ride-activity',
    authDomain: 'ride-activity.firebaseapp.com',
    storageBucket: 'ride-activity.appspot.com',
    measurementId: 'G-E7PB5KS2G2',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyC7bW2g4UG9sKLHq9VfiI_oJnVxmXThxyI',
    appId: '1:389088884405:android:704efddb32c58fc08030fc',
    messagingSenderId: '389088884405',
    projectId: 'ride-activity',
    storageBucket: 'ride-activity.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyADNo-jJNS6K3SF_WDucZ9Gii4BE718pi0',
    appId: '1:389088884405:ios:305e5b333ef241118030fc',
    messagingSenderId: '389088884405',
    projectId: 'ride-activity',
    storageBucket: 'ride-activity.appspot.com',
    iosClientId: '389088884405-jhiehts283uk45tbjkjqb3812ctrjgmc.apps.googleusercontent.com',
    iosBundleId: 'com.apple.AppStore',
  );
}
