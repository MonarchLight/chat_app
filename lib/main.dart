import 'package:firebase_core/firebase_core.dart';

import '/screen/chat_screen.dart';
import '/screen/auth_screen.dart';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
    statusBarColor: Colors.transparent,
    statusBarIconBrightness: Brightness.dark,
  ));
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "ChatMnh",
      theme: ThemeData(
          primarySwatch: Colors.amber,
          accentColor: Color.fromARGB(195, 165, 42, 20),
          buttonTheme: ButtonTheme.of(context).copyWith(
              buttonColor: Color.fromARGB(255, 6, 157, 177),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20)))),
      home: AuthScreen(),
    );
  }
}
