import 'package:android_app/core/constants/pallete.dart';
import 'package:android_app/core/getX/mode_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Header extends StatelessWidget {
  final String? title;
  const Header({
    Key? key,
    this.title,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final ModeController modeController = Get.put(ModeController());
    return GetBuilder<ModeController>(
      builder: (_) => Padding(
        padding: const EdgeInsets.all(8.0),
        child: (Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              title!,
              style: TextStyle(
                  color: modeController.isDark
                      ? Palette.appDarkSubTitle1Color
                      : Palette.appLightSubTitle1Color,
                  fontFamily: 'Poppins',
                  fontSize: 18,
                  fontWeight: FontWeight.w600),
            ),
            Text(
              "SEE ALL",
              style: TextStyle(
                color: modeController.isDark
                    ? Palette.appDarkSubTitle2Color
                    : Palette.appLightSubTitle2Color,
                fontFamily: 'Poppins',
                fontSize: 12,
                fontWeight: FontWeight.w600,
              ),
            ),
          ],
        )),
      ),
    );
  }
}
