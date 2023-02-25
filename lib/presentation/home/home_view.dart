import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:task2/presentation/resources/strings_manager.dart';
import 'package:task2/view_model/home_cubit/home_cubit.dart';
import 'package:task2/view_model/home_cubit/home_states.dart';
import '../resources/assets_manager.dart';
import '../resources/values_manager.dart';

class MainView extends StatefulWidget {
  const MainView({Key? key}) : super(key: key);

  @override
  State<MainView> createState() => _MainViewState();
}

class _MainViewState extends State<MainView> {



  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (BuildContext context)=>HomeCubit(),
      child: BlocConsumer<HomeCubit,HomeStates>(
        listener: (context,state){},
        builder: (context,state){
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
                  onPressed: HomeCubit.get(context).uploadImage,
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
        },
      ),


    );
  }


}
