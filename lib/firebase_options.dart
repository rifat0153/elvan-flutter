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
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for macos - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
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
    apiKey: 'AIzaSyAGCGiWaguQZD9W2If5y3eAt5zH1yykN1s',
    appId: '1:233739049238:web:53cbc937ca238370d99837',
    messagingSenderId: '233739049238',
    projectId: 'elvan-71cfb',
    authDomain: 'elvan-71cfb.firebaseapp.com',
    storageBucket: 'elvan-71cfb.appspot.com',
    measurementId: 'G-30XYG2HSFL',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyAPFCtsFOzwGsvIsnBo5CQRBLulbQppoic',
    appId: '1:233739049238:android:9ffae9336c0961f5d99837',
    messagingSenderId: '233739049238',
    projectId: 'elvan-71cfb',
    storageBucket: 'elvan-71cfb.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyCQhEnIq9zZIwtG82IH4Pyp38IWN2Q0QsA',
    appId: '1:233739049238:ios:fd545d1968a4694dd99837',
    messagingSenderId: '233739049238',
    projectId: 'elvan-71cfb',
    storageBucket: 'elvan-71cfb.appspot.com',
    iosClientId: '233739049238-0e57rd744anbu87mh2at2ta7uh89t4ad.apps.googleusercontent.com',
    iosBundleId: 'com.example.elvan',
  );
}
