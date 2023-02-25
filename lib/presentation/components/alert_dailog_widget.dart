import 'dart:io';
import 'package:flutter/material.dart';
import 'package:task2/presentation/resources/strings_manager.dart';
import 'package:task2/presentation/resources/values_manager.dart';


class AlertDialogWidget extends StatelessWidget {
  const AlertDialogWidget({
    required this.imageSrc,
    required this.text,

    Key? key}) : super(key: key);
  final File imageSrc;
  final String text;

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
                width: mediaQueryWidth(context) * .6,
                height: mediaQueryHeight(context)* .19,
                child:
                Image.file(
                  imageSrc,
                  fit: BoxFit.fill,
                ),
              ),
              SizedBox(
                height: mediaQueryHeight(context) / AppSize.s50,
              ),
              Directionality(
                textDirection: TextDirection.rtl,
                child: Text(text,
                    style:  Theme.of(context).textTheme.displayLarge
                ),
              ),
              const Spacer(),
              Row(
                children: [
                  TextButton(onPressed: (){Navigator.pop(context);},
                      child:  Text(
                          AppStrings.cancel,
                          style: Theme.of(context).textTheme.displayLarge

                      ))
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}