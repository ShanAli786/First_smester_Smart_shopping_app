// ignore_for_file: prefer_const_constructors, non_constant_identifier_names, depend_on_referenced_packages

//import 'package:emart_app/HomeSCreen/home_screen.dart';
import 'package:emart_app/views/splashscreen/splash_screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'consts/consts.dart';
//import 'views/splashscreen/splash_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    //we are usig get x that why we will convert material app into getmaterial app
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: appname,
      theme: ThemeData(
        iconTheme: IconThemeData(color: Colors.black),
        //scaffoldBackgroundColor: Colors.white,
        appBarTheme: AppBarTheme(backgroundColor: Colors.white),
        fontFamily: regular,
      ),
      home: const SplashScreen(),
    );
  }
}
