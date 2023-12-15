part of 'on_boarding_bloc.dart';

abstract class OnBoardingState {}

class OnBoardingInitial extends OnBoardingState {
  int activePage = 0;
}

class OffNavBack extends OnBoardingState {}

class OnNavBack extends OnBoardingState {}
