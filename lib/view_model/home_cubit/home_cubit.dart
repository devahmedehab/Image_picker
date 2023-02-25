import 'dart:io';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:task2/view_model/home_cubit/home_states.dart';

class HomeCubit extends Cubit<HomeStates>{

  HomeCubit() :super (HomeInitialState());

  static  HomeCubit get(context) => BlocProvider.of(context );

  File ?image;
  final imagePicker= ImagePicker();

  uploadImage() async{
    var pickedImage = await imagePicker.getImage(source:ImageSource.gallery);
    if(pickedImage != null){
      image =File(pickedImage.path);
    }else{

    }

  }


}


