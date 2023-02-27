

abstract class HomeStates{}

class HomeInitialState extends HomeStates{}

class HomeLoadingState extends HomeStates{}

class HomeSuccessState extends HomeStates{}

class PickImageSuccessState extends HomeStates{}

class PickImageErrorState extends HomeStates{}

class HomeErrorState extends HomeStates{

  final String error;

  HomeErrorState(this.error);
}
class ChangeAlertLoadingState extends HomeStates {}

class ChangeAlertStartState extends HomeStates {}

class ChangeAlertEndState extends HomeStates {}

class StartDurationState extends HomeStates {}

class EndDurationState extends HomeStates {}