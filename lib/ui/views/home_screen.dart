import 'package:android_app/core/constants/pallete.dart';
import 'package:android_app/core/constants/size_config.dart';
import 'package:android_app/core/getX/mode_controller.dart';
import 'package:android_app/ui/widgets/main_search.dart';
import 'package:android_app/ui/views/authentication/login_screen.dart';
import 'package:android_app/ui/widgets/feature_cards_list.dart';
import 'package:android_app/ui/widgets/header.dart';
import 'package:android_app/ui/widgets/top_streamers_list.dart';
import 'package:android_app/ui/widgets/top_streams_list.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
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
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const LoginScreen()),
                  );
                },
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
                    padding: EdgeInsets.all(8.0),
                    child: Center(
                      child: Icon(MaterialCommunityIcons.account),
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
            child: Column(children: const [
              MainSearch(),
              Header(title: "Categories"),
              FeatureCardsList(),
              Header(title: "Top Streams"),
              TopStreamsListView(),
              Header(title: "Top Streamers"),
              TopStreamersListView(),
            ]),
          ),
        ),
      )),
    );
  }
}
