// File generated by FlutterFire CLI.
// ignore_for_file: lines_longer_than_80_chars, avoid_classes_with_only_static_members
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
    switch (defaultTargetPlatform) {
      case TargetPlatform.android:
        return android;
      case TargetPlatform.iOS:
        return ios;
      case TargetPlatform.macOS:
        return macos;
      case TargetPlatform.windows:
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for windows - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
      case TargetPlatform.linux:
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for linux - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
      default:
        throw UnsupportedError(
          'DefaultFirebaseOptions are not supported for this platform.',
        );
    }
  }

  static const FirebaseOptions web = FirebaseOptions(
    apiKey: 'AIzaSyCuxXJZZZ6crDNUlWe_EHnpCtZNiyAZQxw',
    appId: '1:296445544514:web:c3455ad06aae26e19745db',
    messagingSenderId: '296445544514',
    projectId: 'todolist-16497',
    authDomain: 'todolist-16497.firebaseapp.com',
    storageBucket: 'todolist-16497.appspot.com',
    measurementId: 'G-RDTNYKPXK3',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyBVtIrL-kblwdaoc59KQ68TF5L4_ovG7FY',
    appId: '1:296445544514:android:f427cdbe6c37b97e9745db',
    messagingSenderId: '296445544514',
    projectId: 'todolist-16497',
    storageBucket: 'todolist-16497.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyDo02vwdfZBpumBX2222q6WsswEtRxkc7c',
    appId: '1:296445544514:ios:d273581e781133689745db',
    messagingSenderId: '296445544514',
    projectId: 'todolist-16497',
    storageBucket: 'todolist-16497.appspot.com',
    iosBundleId: 'com.example.todo',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyDo02vwdfZBpumBX2222q6WsswEtRxkc7c',
    appId: '1:296445544514:ios:6e85351e42db78219745db',
    messagingSenderId: '296445544514',
    projectId: 'todolist-16497',
    storageBucket: 'todolist-16497.appspot.com',
    iosBundleId: 'com.example.todo.RunnerTests',
  );
}