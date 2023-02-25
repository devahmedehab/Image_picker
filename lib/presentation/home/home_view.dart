import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:task2/presentation/components/alert_dailog_widget.dart';
import 'package:task2/presentation/resources/strings_manager.dart';
import 'package:task2/view_model/home_cubit/home_cubit.dart';
import 'package:task2/view_model/home_cubit/home_states.dart';
import '../resources/assets_manager.dart';
import '../resources/toast_manager.dart';
import '../resources/values_manager.dart';

class MainView extends StatefulWidget {
  const MainView({Key? key}) : super(key: key);

  @override
  State<MainView> createState() => _MainViewState();
}

class _MainViewState extends State<MainView> {



  @override
  Widget build(BuildContext context) {
    return BlocConsumer<HomeCubit,HomeStates>(
      listener: (context,state){
        if (state is PickImageSuccessState) {
          {showDialog(context: context, builder: (_) {
            /*Future.delayed(const Duration(seconds: 4), () {
              Navigator.of(context).pop();});*/
            return  AlertDialogWidget(
              imageSrc: File(HomeCubit.get(context).imagePath!),
              text: AppStrings.result,
            );}
          );}}
        else if (state is PickImageErrorState) {
          showToast(
              text: AppStrings.tryAgain ,
              state: ToastStates.ERROR);
        }
      },
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
                onPressed: HomeCubit.get(context).pickMedia,
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
    );
  }


}
