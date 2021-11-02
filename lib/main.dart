import 'package:android_app/core/constants/pallete.dart';
import 'package:android_app/ui/views/splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';
import 'ui/views/home_screen.dart';
import 'package:animated_splash_screen/animated_splash_screen.dart';

void main() async {
  await GetStorage.init();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final appdata = GetStorage(); // instance of GetStorage
  MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    appdata.writeIfNull('darkmode', false);
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: AnimatedSplashScreen(
          duration: 3000,
          splash: const SplashScreen(),
          nextScreen: const HomeScreen(),
          splashTransition: SplashTransition.fadeTransition,
          backgroundColor: Palette.appDarkColor),
    );
  }
}
