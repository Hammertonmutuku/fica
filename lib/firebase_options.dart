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
    apiKey: 'AIzaSyAATPakBdfc2k_C_Jpz4FQo5O34oQVvYPY',
    appId: '1:641972317070:web:e9445afe1afb6d3df192df',
    messagingSenderId: '641972317070',
    projectId: 'fica-project',
    authDomain: 'fica-project.firebaseapp.com',
    storageBucket: 'fica-project.appspot.com',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyAoBqLY7V2ksqAKd8HOKEK8kHLLJGm-tl0',
    appId: '1:641972317070:android:50687147f7daaa5bf192df',
    messagingSenderId: '641972317070',
    projectId: 'fica-project',
    storageBucket: 'fica-project.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyDRfs3pVsU7hOgTfvGUFQHigStaJwEiXnw',
    appId: '1:641972317070:ios:7b22bc1b458ed44bf192df',
    messagingSenderId: '641972317070',
    projectId: 'fica-project',
    storageBucket: 'fica-project.appspot.com',
    iosClientId: '641972317070-p7fp5obnqvse28o9ugvchbkc1o47jn3k.apps.googleusercontent.com',
    iosBundleId: 'com.example.fika',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyDRfs3pVsU7hOgTfvGUFQHigStaJwEiXnw',
    appId: '1:641972317070:ios:7b22bc1b458ed44bf192df',
    messagingSenderId: '641972317070',
    projectId: 'fica-project',
    storageBucket: 'fica-project.appspot.com',
    iosClientId: '641972317070-p7fp5obnqvse28o9ugvchbkc1o47jn3k.apps.googleusercontent.com',
    iosBundleId: 'com.example.fika',
  );
}
