part of 'on_boarding_bloc.dart';

sealed class OnBoardingEvent {}

class OnBoradNavEvent extends OnBoardingEvent {
  bool navForward;
  OnBoradNavEvent({required this.navForward});
}
