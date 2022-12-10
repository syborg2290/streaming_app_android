import 'package:android_app/core/constants/size_config.dart';
import 'package:android_app/core/fake_data/top_data.dart';
import 'package:android_app/ui/widgets/stream_card.dart';
import 'package:flutter/material.dart';

class TopStreamsListView extends StatelessWidget {
  const TopStreamsListView({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        height: SizeConfig.width! * 0.7,
        child: ListView.builder(
          shrinkWrap: true,
          scrollDirection: Axis.horizontal,
          itemCount: trendingStreams.length,
          itemBuilder: (context, index) {
            return Row(
              children: [
                StreamCard(data: trendingStreams[index]),
                const SizedBox(
                  width: 10,
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
