import 'dart:async';
import 'package:flutter/material.dart';
import 'package:task2/presentation/resources/assets_manager.dart';
import 'package:task2/presentation/resources/color_manager.dart';
import 'package:task2/presentation/resources/constants_manager.dart';
import 'package:task2/presentation/resources/routs_manager.dart';
import 'package:task2/presentation/resources/values_manager.dart';



class SplashView extends StatefulWidget {
  const SplashView({Key? key}) : super(key: key);

  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> {
  Timer? _timer;

  _startDelay(){
    _timer=Timer(
        const Duration(seconds: AppConstant.splashDelay),
        _goNext
    );
  }
  _goNext(){
    Navigator.pushReplacementNamed(context, Routes.homeRoute);
  }
  @override
  void initState() {
    super.initState();
    _startDelay();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorManager.primary,
      body:  Column(

          children:  [
            SizedBox(
              height: mediaQueryHeight(context)*.10,
            ),
            const Image(
              image: AssetImage(ImageAssets.splashLogo2),
            ),
            SizedBox(
              height: mediaQueryHeight(context)*.25,
            ),
            Center(
              child: Image(

                image: AssetImage(ImageAssets.splashLogo1),
              ),
            )
          ],
        ),

    );
  }
  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }
}
/*SizedBox(
               height: mediaQueryHeight(context)*.25,
             ),*/
