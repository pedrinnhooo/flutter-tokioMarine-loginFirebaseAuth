
import 'package:firebase_core/firebase_core.dart' show FirebaseOptions;
import 'package:flutter/foundation.dart'
    show defaultTargetPlatform, kIsWeb, TargetPlatform;

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
    apiKey: 'AIzaSyDM8q8xIUWnTX5GvO4zBnESeMRr0y7sHSs',
    appId: '1:156083911673:web:53998cd8b2e0a9b5ccdb28',
    messagingSenderId: '156083911673',
    projectId: 'flutter-login-d9877',
    authDomain: 'flutter-login-d9877.firebaseapp.com',
    databaseURL: 'https://flutter-login-d9877-default-rtdb.firebaseio.com',
    storageBucket: 'flutter-login-d9877.appspot.com',
    measurementId: 'G-NFD648MC93',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyD-jBVjNQcXvNz1v6GRQuURWGothpexB1g',
    appId: '1:156083911673:android:1ec835d0006248bbccdb28',
    messagingSenderId: '156083911673',
    projectId: 'flutter-login-d9877',
    databaseURL: 'https://flutter-login-d9877-default-rtdb.firebaseio.com',
    storageBucket: 'flutter-login-d9877.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyAFiOr1LujKycQmlLfxhVzWxGjoAnQhdIQ',
    appId: '1:156083911673:ios:495190780749f0dcccdb28',
    messagingSenderId: '156083911673',
    projectId: 'flutter-login-d9877',
    databaseURL: 'https://flutter-login-d9877-default-rtdb.firebaseio.com',
    storageBucket: 'flutter-login-d9877.appspot.com',
    iosClientId: '156083911673-vp8df1g3mtecbf27vjpchjhb38jrf6k0.apps.googleusercontent.com',
    iosBundleId: 'com.example.loginFirebase',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyAFiOr1LujKycQmlLfxhVzWxGjoAnQhdIQ',
    appId: '1:156083911673:ios:495190780749f0dcccdb28',
    messagingSenderId: '156083911673',
    projectId: 'flutter-login-d9877',
    databaseURL: 'https://flutter-login-d9877-default-rtdb.firebaseio.com',
    storageBucket: 'flutter-login-d9877.appspot.com',
    iosClientId: '156083911673-vp8df1g3mtecbf27vjpchjhb38jrf6k0.apps.googleusercontent.com',
    iosBundleId: 'com.example.loginFirebase',
  );
}
