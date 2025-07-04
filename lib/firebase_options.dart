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
    apiKey: 'AIzaSyDeLuydT9XQCmy2zBcn176p0Brr87TxeLE',
    appId: '1:352758614551:web:e36f2dcc4a972d76a32a52',
    messagingSenderId: '352758614551',
    projectId: 'teste-agtech',
    authDomain: 'teste-agtech.firebaseapp.com',
    storageBucket: 'teste-agtech.firebasestorage.app',
    measurementId: 'G-HT8F5EHDPR',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyABqjYRhncQ0uhZ1qp5lNt5T5DqIxaKAfQ',
    appId: '1:352758614551:android:037bfa7c3ae024cfa32a52',
    messagingSenderId: '352758614551',
    projectId: 'teste-agtech',
    storageBucket: 'teste-agtech.firebasestorage.app',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyAtlDHiPUFFgA8i83ddXAg_OruKeJtvjks',
    appId: '1:352758614551:ios:9e1232859db31743a32a52',
    messagingSenderId: '352758614551',
    projectId: 'teste-agtech',
    storageBucket: 'teste-agtech.firebasestorage.app',
    iosBundleId: 'com.example.testeAgetch',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyAtlDHiPUFFgA8i83ddXAg_OruKeJtvjks',
    appId: '1:352758614551:ios:9e1232859db31743a32a52',
    messagingSenderId: '352758614551',
    projectId: 'teste-agtech',
    storageBucket: 'teste-agtech.firebasestorage.app',
    iosBundleId: 'com.example.testeAgetch',
  );

  static const FirebaseOptions windows = FirebaseOptions(
    apiKey: 'AIzaSyDeLuydT9XQCmy2zBcn176p0Brr87TxeLE',
    appId: '1:352758614551:web:8cf1a394d06408dea32a52',
    messagingSenderId: '352758614551',
    projectId: 'teste-agtech',
    authDomain: 'teste-agtech.firebaseapp.com',
    storageBucket: 'teste-agtech.firebasestorage.app',
    measurementId: 'G-XLRCZF4W0D',
  );
}
