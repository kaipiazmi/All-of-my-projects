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
    apiKey: 'AIzaSyCfuzkPmt4s3JiXQce8KRNhWxBffE_J6f0',
    appId: '1:839184569598:web:acd1f7a14ac845ad6a01af',
    messagingSenderId: '839184569598',
    projectId: 'mytodolist-a462e',
    authDomain: 'mytodolist-a462e.firebaseapp.com',
    storageBucket: 'mytodolist-a462e.appspot.com',
    measurementId: 'G-Y2MV5JQRLE',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyC3ZiVqlskio7LRYZj7d5Ue5-YsiaI_l-M',
    appId: '1:839184569598:android:92bdd055dc9e5da86a01af',
    messagingSenderId: '839184569598',
    projectId: 'mytodolist-a462e',
    storageBucket: 'mytodolist-a462e.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyAHwYzDr7W3NwvRunQfUwPE_0eVIOQ83pc',
    appId: '1:839184569598:ios:c2d41893b1abc2ec6a01af',
    messagingSenderId: '839184569598',
    projectId: 'mytodolist-a462e',
    storageBucket: 'mytodolist-a462e.appspot.com',
    iosClientId: '839184569598-cahugdl3r1clmjr95m4796k2cvrge7sv.apps.googleusercontent.com',
    iosBundleId: 'com.example.crudappTodolist',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyAHwYzDr7W3NwvRunQfUwPE_0eVIOQ83pc',
    appId: '1:839184569598:ios:625523e8371c2d156a01af',
    messagingSenderId: '839184569598',
    projectId: 'mytodolist-a462e',
    storageBucket: 'mytodolist-a462e.appspot.com',
    iosClientId: '839184569598-vaap1q5nfmeickg992gt170vng62pnv1.apps.googleusercontent.com',
    iosBundleId: 'com.example.crudappTodolist.RunnerTests',
  );
}
