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
    apiKey: 'AIzaSyADsfUxy1smrn7BKWFDP3ibvMuZcwBCloo',
    appId: '1:297444752360:web:e57677921c4d9bc1fd825d',
    messagingSenderId: '297444752360',
    projectId: 'biblio-couture',
    authDomain: 'biblio-couture.firebaseapp.com',
    databaseURL: 'https://biblio-couture-default-rtdb.europe-west1.firebasedatabase.app',
    storageBucket: 'biblio-couture.firebasestorage.app',
    measurementId: 'G-MC9NYSL0S8',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyAN9EYnnLfWZtNhj17KpcC8fsS0wISzxJY',
    appId: '1:297444752360:android:e375d62dd66765adfd825d',
    messagingSenderId: '297444752360',
    projectId: 'biblio-couture',
    databaseURL: 'https://biblio-couture-default-rtdb.europe-west1.firebasedatabase.app',
    storageBucket: 'biblio-couture.firebasestorage.app',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyCssC4ygteUcsfZspfkgOWGnm0Dv_aKV3g',
    appId: '1:297444752360:ios:d05b9bc3b33dece1fd825d',
    messagingSenderId: '297444752360',
    projectId: 'biblio-couture',
    databaseURL: 'https://biblio-couture-default-rtdb.europe-west1.firebasedatabase.app',
    storageBucket: 'biblio-couture.firebasestorage.app',
    iosBundleId: 'com.example.biblioDesPetitesBobines',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyCssC4ygteUcsfZspfkgOWGnm0Dv_aKV3g',
    appId: '1:297444752360:ios:d05b9bc3b33dece1fd825d',
    messagingSenderId: '297444752360',
    projectId: 'biblio-couture',
    databaseURL: 'https://biblio-couture-default-rtdb.europe-west1.firebasedatabase.app',
    storageBucket: 'biblio-couture.firebasestorage.app',
    iosBundleId: 'com.example.biblioDesPetitesBobines',
  );

  static const FirebaseOptions windows = FirebaseOptions(
    apiKey: 'AIzaSyADsfUxy1smrn7BKWFDP3ibvMuZcwBCloo',
    appId: '1:297444752360:web:e57677921c4d9bc1fd825d',
    messagingSenderId: '297444752360',
    projectId: 'biblio-couture',
    authDomain: 'biblio-couture.firebaseapp.com',
    databaseURL: 'https://biblio-couture-default-rtdb.europe-west1.firebasedatabase.app',
    storageBucket: 'biblio-couture.firebasestorage.app',
    measurementId: 'G-MC9NYSL0S8',
  );
}
