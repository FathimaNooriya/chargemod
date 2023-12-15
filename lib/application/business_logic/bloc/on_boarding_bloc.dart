
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
part 'on_boarding_event.dart';
part 'on_boarding_state.dart';

class OnBoardingBloc extends Bloc<OnBoardingEvent, OnBoardingState> {
  final onBoardingPgController = PageController(initialPage: 0);
  int activePage = 0;

  OnBoardingBloc() : super(OnBoardingInitial()) {
    on<OnBoradNavEvent>(onBoradNavEvent);
  }
  Future<void> onBoradNavEvent(
      OnBoradNavEvent event, Emitter<OnBoardingState> emit) async {
    event.navForward == true
        ? activePage = activePage + 1
        : activePage = activePage - 1;
    onBoardingPgController.animateToPage(activePage,
        duration: const Duration(microseconds: 300), curve: Curves.easeIn);
    if (activePage == 0) {
      emit(OffNavBack());
    } else {
      emit(OnNavBack());
    }
  }
}
