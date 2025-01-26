// File generated by FlutterFire CLI.
// ignore_for_file: type=lint
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
        return windows;
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
    apiKey: 'AIzaSyDi7Q6GK2c6Rj6muRtOUwrnLDBqD3uRqwo',
    appId: '1:49418678465:web:ed6b667072d4ec45096440',
    messagingSenderId: '49418678465',
    projectId: 'safefront-105a8',
    authDomain: 'safefront-105a8.firebaseapp.com',
    storageBucket: 'safefront-105a8.firebasestorage.app',
    measurementId: 'G-G455RGTPYS',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyDt4ATbY3_bt4-OnfkSVWUbKw4MxqFYIoE',
    appId: '1:49418678465:android:9123a4f78dec6800096440',
    messagingSenderId: '49418678465',
    projectId: 'safefront-105a8',
    storageBucket: 'safefront-105a8.firebasestorage.app',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyB3euTWv2WTb9PJzcEvLo6jZvK8LJbLoQk',
    appId: '1:49418678465:ios:12a764116efb2f7e096440',
    messagingSenderId: '49418678465',
    projectId: 'safefront-105a8',
    storageBucket: 'safefront-105a8.firebasestorage.app',
    iosBundleId: 'com.example.frontend',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyB3euTWv2WTb9PJzcEvLo6jZvK8LJbLoQk',
    appId: '1:49418678465:ios:12a764116efb2f7e096440',
    messagingSenderId: '49418678465',
    projectId: 'safefront-105a8',
    storageBucket: 'safefront-105a8.firebasestorage.app',
    iosBundleId: 'com.example.frontend',
  );

  static const FirebaseOptions windows = FirebaseOptions(
    apiKey: 'AIzaSyDi7Q6GK2c6Rj6muRtOUwrnLDBqD3uRqwo',
    appId: '1:49418678465:web:ea390c0759e454cf096440',
    messagingSenderId: '49418678465',
    projectId: 'safefront-105a8',
    authDomain: 'safefront-105a8.firebaseapp.com',
    storageBucket: 'safefront-105a8.firebasestorage.app',
    measurementId: 'G-LJN6RN626Y',
  );
}
