import 'package:android_app/core/constants/size_config.dart';
import 'package:flutter/material.dart';

class StreamerCard extends StatelessWidget {
  final String? thumbnail;
  const StreamerCard({
    Key? key,
    this.thumbnail,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);

    return Row(
      children: [
        Container(
          width: SizeConfig.width! * 0.3,
          height: SizeConfig.width! * 0.8,
          decoration: BoxDecoration(
            color: Colors.black,
            borderRadius: BorderRadius.circular(8),
            image: DecorationImage(
              fit: BoxFit.cover,
              image: AssetImage(
                thumbnail ?? '',
              ),
            ),
          ),
        ),
        const SizedBox(
          width: 10,
        ),
      ],
    );
  }
}
