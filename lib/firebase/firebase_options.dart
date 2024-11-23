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
    apiKey: 'AIzaSyDbFipfatiw1ZHlnV04f5916yWWmRnASE4',
    appId: '1:199123522132:web:b5411b828d02fcfa1353c1',
    messagingSenderId: '199123522132',
    projectId: 'projetoscarrostop',
    authDomain: 'projetoscarrostop.firebaseapp.com',
    storageBucket: 'projetoscarrostop.firebasestorage.app',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyD34zSoVbarVhX4IBAngcibAGViFoIMaLU',
    appId: '1:199123522132:android:9d4e64ae2765dc1e1353c1',
    messagingSenderId: '199123522132',
    projectId: 'projetoscarrostop',
    storageBucket: 'projetoscarrostop.firebasestorage.app',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyBqT5EML2ANJUnMfxVgJiRQL58qmeSIGKA',
    appId: '1:199123522132:ios:4dc0b24b58132fb91353c1',
    messagingSenderId: '199123522132',
    projectId: 'projetoscarrostop',
    storageBucket: 'projetoscarrostop.firebasestorage.app',
    iosBundleId: 'br.unigran.projetosCarros',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyBqT5EML2ANJUnMfxVgJiRQL58qmeSIGKA',
    appId: '1:199123522132:ios:4dc0b24b58132fb91353c1',
    messagingSenderId: '199123522132',
    projectId: 'projetoscarrostop',
    storageBucket: 'projetoscarrostop.firebasestorage.app',
    iosBundleId: 'br.unigran.projetosCarros',
  );

  static const FirebaseOptions windows = FirebaseOptions(
    apiKey: 'AIzaSyDbFipfatiw1ZHlnV04f5916yWWmRnASE4',
    appId: '1:199123522132:web:79b2cc90205c4bda1353c1',
    messagingSenderId: '199123522132',
    projectId: 'projetoscarrostop',
    authDomain: 'projetoscarrostop.firebaseapp.com',
    storageBucket: 'projetoscarrostop.firebasestorage.app',
  );
}