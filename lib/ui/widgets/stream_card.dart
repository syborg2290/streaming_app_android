import 'package:android_app/core/constants/pallete.dart';
import 'package:android_app/core/constants/size_config.dart';
import 'package:android_app/core/fake_data/top_data.dart';
import 'package:android_app/core/getX/mode_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class StreamCard extends StatelessWidget {
  final TopStreamModel? data;
  const StreamCard({
    Key? key,
    this.data,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final ModeController modeController = Get.put(ModeController());
    SizeConfig().init(context);

    return GetBuilder<ModeController>(
      builder: (_) => Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Stack(
            children: [
              Container(
                height: SizeConfig.width! * 0.5,
                width: SizeConfig.width! * 0.8,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  color:Colors.black,
                  image: DecorationImage(
                    fit: BoxFit.cover,
                    image: AssetImage(
                      data?.thumbnail ?? '',
                    ),
                  ),
                ),
              ),
              Positioned(
                top: 10,
                left: 10,
                child: Container(
                  height: SizeConfig.width! * 0.05,
                  width: SizeConfig.width! * 0.09,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5),
                    color: Colors.red,
                  ),
                  child: const Center(
                    child: Text(
                      "Live",
                      style: TextStyle(
                        color: Colors.white,
                        fontFamily: 'Poppins',
                        fontSize: 12,
                      ),
                    ),
                  ),
                ),
              ),
              Positioned(
                bottom: 10,
                left: 10,
                child: Container(
                  padding: const EdgeInsets.symmetric(horizontal: 8),
                  height: SizeConfig.width! * 0.07,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5),
                    color: Colors.black54,
                  ),
                  child: Center(
                    child: Row(
                      children: [
                        const Icon(
                          Icons.circle,
                          color: Colors.red,
                          size: 10,
                        ),
                        Text(
                          " ${data?.liveWatchingCount ?? 0} watching",
                          style: const TextStyle(
                            color: Colors.white,
                            fontFamily: 'Poppins',
                            fontSize: 12,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 10,
          ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CircleAvatar(
                backgroundImage: AssetImage(data?.userAvatar ?? ''),
              ),
              const SizedBox(
                width: 10,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    data?.userName ?? '',
                    style: TextStyle(
                        color: modeController.isDark
                            ? Palette.appDarkSubTitle2Color
                            : Palette.appLightSubTitle2Color,
                        fontFamily: 'Poppins',
                        fontSize: 15,
                        fontWeight: FontWeight.w600),
                  ),
                  Text(
                    data?.gameName ?? '',
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
              )
            ],
          )
        ],
      ),
    );
  }
}
