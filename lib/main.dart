import 'package:challenge_front/Screen/Accueil/Accueil.dart';
import 'package:challenge_front/Screen/Inscription/inscription.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'Screen/Authentification/auth.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp])
      .then((_) {
    runApp(const MyApp());
  });
}

final _auth = FirebaseAuth.instance;

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Sebenw',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
        inputDecorationTheme: InputDecorationTheme(
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: BorderSide.none,
          ),
          filled: true,
          fillColor: const Color(0xFFe7edeb),
          prefixIconColor: Colors.blueGrey,
          focusColor: Colors.blueGrey,
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: const BorderSide(color: Colors.blue),
          ),
        ),
        datePickerTheme: const DatePickerThemeData(
          // dividerColor: primaryColor,
          headerHeadlineStyle: TextStyle(
            color: Colors.black,
            // fontFamily: fontFamily,
            fontWeight: FontWeight.normal,
            fontSize: 20,
          ),
        ),
      ),
      home: _auth.currentUser != null ? Accueil() : const Inscription(),
      // home: const Authentification(),
    );
  }
}
