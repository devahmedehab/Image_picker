import 'dart:async';
import 'dart:io';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:task2/data/controller/home_cubit/home_states.dart';

class HomeCubit extends Cubit<HomeStates>{

  HomeCubit() :super (HomeInitialState());

  static  HomeCubit get(context) => BlocProvider.of(context );

  /*File ?image;
  final imagePicker= ImagePicker();

  uploadImage() async{
    var pickedImage = await imagePicker.getImage(source:ImageSource.gallery);
    if(pickedImage != null){
      image =File(pickedImage.path);
    }else{

    }

  }*/

  String? imagePath;

  void pickMedia() async {
    XFile? file = await ImagePicker().pickImage(source: ImageSource.gallery);
    if (file != null) {
      imagePath = file.path;
      emit(PickImageSuccessState());
    } else  {
      emit(PickImageErrorState());
    }
  }
  bool change = false;
  Duration duration = const Duration();
  void counter ()async {
    duration = new Duration();
    const countdownDuration = Duration(seconds: 5  );
    Timer? timer;
    bool countDown =true;
    duration = countdownDuration;
    emit(StartDurationState());
    void addTime(){
      final addSeconds = countDown ? -1 : 1;
      final seconds = duration.inSeconds + addSeconds;
      if (seconds < 0){
        timer?.cancel();
        emit(ChangeAlertEndState());
        change = true;
        emit(EndDurationState());
      } else{
        emit(ChangeAlertStartState());
        duration = Duration(seconds: seconds);
      }
    }
    void startTimer(){
      timer = Timer.periodic(const Duration(seconds: 1),(_) => addTime());
      emit(ChangeAlertLoadingState());
    }
    startTimer();

  }

}


