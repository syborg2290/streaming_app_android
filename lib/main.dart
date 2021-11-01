import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';
import 'ui/views/home_screen.dart';

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
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomeScreen(),
    );
  }
}
