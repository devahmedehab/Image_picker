import 'package:flutter/material.dart';
import 'package:task2/presentation/resources/font_manager.dart';
import 'package:task2/presentation/resources/strings_manager.dart';
import 'package:task2/presentation/resources/styles_manager.dart';
import 'package:task2/presentation/resources/theme_manager.dart';

import '../presentation/resources/assets_manager.dart';
import '../presentation/resources/values_manager.dart';

class MainView extends StatefulWidget {
  const MainView({Key? key}) : super(key: key);

  @override
  State<MainView> createState() => _MainViewState();
}

class _MainViewState extends State<MainView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const Spacer(),
          const Center(
            child: Image(
              image: AssetImage(ImageAssets.uploadPageImage),
            ),
          ),
          SizedBox(
            height: mediaQueryHeight(context) * .05,
          ),
          Text(
            AppStrings.homeTitle,
            textAlign: TextAlign.center,
            style: Theme.of(context).textTheme.headlineLarge,
          ),
          SizedBox(
            height: mediaQueryHeight(context) * .02,
          ),
          Text(
            AppStrings.homeSubTitle,
            textAlign: TextAlign.center,
            style: Theme.of(context).textTheme.bodySmall,
          ),
          const Spacer(),

          ElevatedButton(

            style: ElevatedButton.styleFrom
              (

              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(AppSize.s25)
              ),
              fixedSize: const Size(ButtonSize.b300, ButtonSize.b50)

            ),
            onPressed: () {},
            child: Row(

              mainAxisAlignment: MainAxisAlignment.center,
              children:  [
                const Icon(Icons.cloud_upload),
                SizedBox(width: mediaQueryWidth(context)* .02,),
                const Text(AppStrings.buttonTitle),
              ],
            ),
          ),
          SizedBox( height: mediaQueryHeight(context) * .07,)
        ],
      ),
    );
  }
}
