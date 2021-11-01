import 'package:android_app/core/constants/pallete.dart';
import 'package:flutter/material.dart';

class FeatureCard extends StatelessWidget {
  final IconData? icon;
  final String? text;
  const FeatureCard({Key? key, this.icon, this.text}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        gradient: const LinearGradient(
          begin: Alignment.topRight,
          end: Alignment.bottomLeft,
          colors: [
            Palette.appMainColor,
            Colors.purple,
            Colors.red,
          ],
        ),
        borderRadius: BorderRadius.circular(15),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            icon,
            color: Palette.appDarkFontColor,
            size: 30,
          ),
          const SizedBox(
            height: 10,
          ),
          Text(text!,
              style: const TextStyle(
                color: Palette.appDarkFontColor,
              ))
        ],
      ),
    );
  }
}
