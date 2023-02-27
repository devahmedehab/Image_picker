import 'package:flutter/material.dart';
import 'package:task2/presentation/resources/color_manager.dart';
import 'package:task2/presentation/resources/strings_manager.dart';
import 'package:task2/presentation/resources/values_manager.dart';


class AlertDialogResult extends StatelessWidget {
  const AlertDialogResult({
    required this.imageSrc,
    required this.text,
    required this.text2,
    Key? key}) : super(key: key);
  final String imageSrc;
  final String text;
  final String text2;
  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: AlertDialog(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(AppPadding.p28),
        ),
        elevation: 50.0,
        content: SizedBox(
          height: mediaQueryHeight(context)*.45,
          width: mediaQueryWidth(context)*.9,
          child: Column(

            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
                height: mediaQueryHeight(context) / AppSize.s8,
              ),
              const Divider(

                thickness: 8, color: ColorManager.lightGreen,


              ),
              SizedBox(
                height: mediaQueryHeight(context) / AppSize.s50,
              ),
              Directionality(
                textDirection: TextDirection.rtl,
                child: Text(text,
                    style:  Theme.of(context).textTheme.titleSmall
                ),
              ),
              SizedBox(
                height: mediaQueryHeight(context) / AppSize.s50,
              ),
              Directionality(
                textDirection: TextDirection.rtl,
                child: Text(text2,
                    style: Theme.of(context).textTheme.titleMedium
                ),
              ),
              const Spacer(),
              Row(
                children: [
                  TextButton(onPressed: (){Navigator.pop(context);},
                    child:  Text(
                        AppStrings.cancel,
                        style: Theme.of(context).textTheme.headlineLarge
                    ),
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}