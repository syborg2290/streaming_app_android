import 'package:android_app/core/constants/size_config.dart';
import 'package:android_app/ui/widgets/feature_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';

class FeatureCardsList extends StatelessWidget {
  const FeatureCardsList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List features = [
      {"icon": MaterialCommunityIcons.gamepad, "text": "Games"},
      {"icon": MaterialCommunityIcons.music, "text": "Music"},
      {"icon": Entypo.music, "text": "Dance"},
      {"icon": MaterialCommunityIcons.spotify, "text": "Music"},
      {"icon": MaterialCommunityIcons.music, "text": "Music"},
      {"icon": MaterialCommunityIcons.music, "text": "Music"}
    ];

    SizeConfig().init(context);
    return Container(
        width: SizeConfig.width,
        height: SizeConfig.width! * 0.25,
        margin: const EdgeInsets.only(bottom: 30),
        child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: features.length,
            itemExtent: SizeConfig.width! * 0.25,
            itemBuilder: (ctx, i) {
              return FeatureCard(
                icon: features[i]["icon"],
                text: features[i]["text"],
              );
            }));
  }
}
