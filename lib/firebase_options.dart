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
    apiKey: 'AIzaSyCrA2GOiZJQhl36OFBOEWThWmoBpf355oA',
    appId: '1:1010555357094:web:5c438ab8eceec88c327167',
    messagingSenderId: '1010555357094',
    projectId: 'bakkal-dukkani',
    authDomain: 'bakkal-dukkani.firebaseapp.com',
    storageBucket: 'bakkal-dukkani.appspot.com',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyBYzbzGlAy2jA0cX5LZsaM4pztQ8huTl1Q',
    appId: '1:1010555357094:android:98ae315c440848b3327167',
    messagingSenderId: '1010555357094',
    projectId: 'bakkal-dukkani',
    storageBucket: 'bakkal-dukkani.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyANPgIRoOVQuVfqtXwQwQx5LFyY82PH5zQ',
    appId: '1:1010555357094:ios:07f37bfabd4ff22a327167',
    messagingSenderId: '1010555357094',
    projectId: 'bakkal-dukkani',
    storageBucket: 'bakkal-dukkani.appspot.com',
    iosClientId: '1010555357094-chg35q0b8ra1b1j3ojodhk252gb47o9r.apps.googleusercontent.com',
    iosBundleId: 'com.nefisebanutunc.bakkalDukkani',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyANPgIRoOVQuVfqtXwQwQx5LFyY82PH5zQ',
    appId: '1:1010555357094:ios:07f37bfabd4ff22a327167',
    messagingSenderId: '1010555357094',
    projectId: 'bakkal-dukkani',
    storageBucket: 'bakkal-dukkani.appspot.com',
    iosClientId: '1010555357094-chg35q0b8ra1b1j3ojodhk252gb47o9r.apps.googleusercontent.com',
    iosBundleId: 'com.nefisebanutunc.bakkalDukkani',
  );
}
