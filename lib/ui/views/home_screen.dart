import 'package:android_app/core/constants/pallete.dart';
import 'package:android_app/core/constants/size_config.dart';
import 'package:android_app/core/getX/mode_controller.dart';
import 'package:android_app/ui/widgets/feature_cards_list.dart';
import 'package:android_app/ui/widgets/header.dart';
import 'package:android_app/ui/widgets/top_streamers_list.dart';
import 'package:android_app/ui/widgets/top_streams_list.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  // final appdata = GetStorage();

  @override
  Widget build(BuildContext context) {
    final ModeController modeController = Get.put(ModeController());
    SizeConfig().init(context);
    // bool isDarkMode = appdata.read('darkmode');

    return GetBuilder<ModeController>(
      builder: (_) => (Scaffold(
        appBar: AppBar(
          backgroundColor: modeController.isDark
              ? Palette.appDarkColor
              : Palette.appLightColor,
          elevation: 0,
          title: Text(
            "Discover",
            style: TextStyle(
              color: modeController.isDark
                  ? Palette.appDarkFontColor
                  : Palette.appLightFontColor,
              fontSize: 30,
              fontWeight: FontWeight.bold,
            ),
          ),
          actions: [
            Padding(
              padding: EdgeInsets.all(SizeConfig.height! * 0.01),
              child: GestureDetector(
                onTap: () {},
                child: Container(
                  decoration: const BoxDecoration(
                    borderRadius: BorderRadius.all(
                      Radius.circular(40),
                    ),
                    gradient: LinearGradient(
                      begin: Alignment.topRight,
                      end: Alignment.bottomLeft,
                      colors: [
                        Palette.appMainColor,
                        Colors.purple,
                        Colors.red,
                      ],
                    ),
                  ),
                  child: const Padding(
                    padding: EdgeInsets.all(10.0),
                    child: Center(
                      child: Text(
                        "KG",
                        style: TextStyle(
                          color: Palette.appDarkFontColor,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.all(SizeConfig.height! * 0.01),
              child: GestureDetector(
                onTap: () {
                  modeController.changeMode(!modeController.isDark);
                },
                child: Icon(
                  modeController.isDark ? Icons.dark_mode : Icons.light_mode,
                  color: modeController.isDark ? Colors.yellow : Colors.black,
                  size: 30.0,
                ),
              ),
            ),
          ],
        ),
        body: SingleChildScrollView(
          child: Container(
            height: SizeConfig.height,
            color: modeController.isDark
                ? Palette.appDarkColor
                : Palette.appLightColor,
            child: Column(children: [
              Padding(
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
              ),
              const Header(title: "Categories"),
              const FeatureCardsList(),
              const Header(title: "Top Streams"),
              const TopStreamsListView(),
              const Header(title: "Top Streamers"),
              const TopStreamersListView(),
            ]),
          ),
        ),
      )),
    );
  }
}
