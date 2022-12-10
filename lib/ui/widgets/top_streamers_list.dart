import 'package:android_app/core/constants/size_config.dart';
import 'package:android_app/core/fake_data/top_streamer.dart';
import 'package:android_app/ui/widgets/streamer_card.dart';
import 'package:flutter/material.dart';

class TopStreamersListView extends StatelessWidget {
  const TopStreamersListView({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        height: SizeConfig.width! * 0.4,
        child: ListView.builder(
          shrinkWrap: true,
          scrollDirection: Axis.horizontal,
          itemCount: topStreamer.length,
          itemBuilder: (context, index) {
            return GestureDetector(
              child: StreamerCard(thumbnail: topStreamer[index].thumbnail),
            );
          },
        ),
      ),
    );
  }
}
