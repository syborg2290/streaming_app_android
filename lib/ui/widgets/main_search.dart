import 'package:android_app/core/constants/pallete.dart';
import 'package:android_app/core/getX/mode_controller.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MainSearch extends StatefulWidget {
  const MainSearch({Key? key}) : super(key: key);

  @override
  _MainSearchState createState() => _MainSearchState();
}

class _MainSearchState extends State<MainSearch> {
  @override
  Widget build(BuildContext context) {
    final ModeController modeController = Get.put(ModeController());

    return GetBuilder<ModeController>(
      builder: (_) => (Padding(
        padding: const EdgeInsets.only(
          top: 8.0,
          left: 20,
          right: 20,
          bottom: 10,
        ),
        child: CupertinoSearchTextField(
          placeholder: "Search streamers",
          itemSize: 25.0,
          padding: const EdgeInsets.all(12.0),
          style: TextStyle(
            color: modeController.isDark
                ? Palette.appDarkFontColor
                : Palette.appLightFontColor,
          ),
        ),
      )),
    );
  }
}
