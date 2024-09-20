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
    apiKey: 'AIzaSyA-7YBd8CELVBL_YCBQX752hucsSauaV7U',
    appId: '1:3994090344:web:5163293be01976ccceb4dd',
    messagingSenderId: '3994090344',
    projectId: 'makecheck-c659c',
    authDomain: 'makecheck-c659c.firebaseapp.com',
    storageBucket: 'makecheck-c659c.appspot.com',
    measurementId: 'G-9LEJ4S601L',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyCTVIPMiZnOjGMnL3ESsUtcNUKzCv9NSBk',
    appId: '1:3994090344:android:631e8786f5711b01ceb4dd',
    messagingSenderId: '3994090344',
    projectId: 'makecheck-c659c',
    storageBucket: 'makecheck-c659c.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyCgQSqGl94O24zIoP2D9LgThVkhlswQuVQ',
    appId: '1:3994090344:ios:b537998b142fdeb6ceb4dd',
    messagingSenderId: '3994090344',
    projectId: 'makecheck-c659c',
    storageBucket: 'makecheck-c659c.appspot.com',
    iosBundleId: 'com.example.makecheck',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyCgQSqGl94O24zIoP2D9LgThVkhlswQuVQ',
    appId: '1:3994090344:ios:b537998b142fdeb6ceb4dd',
    messagingSenderId: '3994090344',
    projectId: 'makecheck-c659c',
    storageBucket: 'makecheck-c659c.appspot.com',
    iosBundleId: 'com.example.makecheck',
  );

  static const FirebaseOptions windows = FirebaseOptions(
    apiKey: 'AIzaSyA-7YBd8CELVBL_YCBQX752hucsSauaV7U',
    appId: '1:3994090344:web:e525f6fc6eabae2aceb4dd',
    messagingSenderId: '3994090344',
    projectId: 'makecheck-c659c',
    authDomain: 'makecheck-c659c.firebaseapp.com',
    storageBucket: 'makecheck-c659c.appspot.com',
    measurementId: 'G-7KBBDSXCMD',
  );
}
