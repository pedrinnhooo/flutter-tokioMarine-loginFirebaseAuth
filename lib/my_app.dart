import 'package:flutter/material.dart';
import 'package:login_firebase/screens/auto_web_page.dart';
import 'package:login_firebase/screens/home_page.dart';
import 'package:login_firebase/screens/login_page_new.dart';
import 'package:login_firebase/widgets/auth_check.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      debugShowCheckedModeBanner: false,
      home: const AuthCheck(),
      routes: <String, WidgetBuilder>{
        '/auto': (BuildContext context) => const AutoWebPage(),
        '/home': (BuildContext context) => const HomePage(),
      },
    );
  }
}
