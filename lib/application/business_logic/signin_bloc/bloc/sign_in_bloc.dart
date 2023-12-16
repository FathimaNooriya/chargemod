import 'package:bloc/bloc.dart';
import 'package:fl_country_code_picker/fl_country_code_picker.dart';
import 'package:flutter/material.dart';
import '../../../../domain/models/authorization/authorization.dart';
import '../../../../domain/repositories/resendotp_repository.dart';
import '../../../../domain/repositories/signin_repository.dart';
import '../../../../domain/repositories/verifyotp_repository.dart';

part 'sign_in_event.dart';
part 'sign_in_state.dart';

class SignInBloc extends Bloc<SignInEvent, SignInState> {
  final countryPicker = const FlCountryCodePicker();
  final TextEditingController phoneNumController = TextEditingController();
  final GlobalKey<FormState> signinKey = GlobalKey<FormState>();
  CountryCode? countryCode;
  SignInBloc() : super(SignInInitial()) {
    on<SendOtpEvent>(sendOtpEvent);
    on<ResendOtpEvent>(resendOtpEvent);
    on<VerifyOtpEvent>(verifyOtpEvent);
    on<SelectCountryEvent>(selectCountryEvent);
  }
  Future<void> sendOtpEvent(
      SendOtpEvent event, Emitter<SignInState> emit) async {
    emit(IsLoading());
    String? result = await SigninRepasitory().signIn(event.phone);
    if (result == "Success") {
      emit(OtpSuccess());
    } else {
      emit(OtpFailed());
    }
  }

  Future<void> resendOtpEvent(
      ResendOtpEvent event, Emitter<SignInState> emit) async {
    emit(IsLoading());
    String? result = await ResendOtpRepository().resendOTP(event.phone);
    if (result == "Success") {
      emit(OtpSuccess());
    } else {
      emit(OtpFailed());
    }
  }

  Future<void> verifyOtpEvent(
      VerifyOtpEvent event, Emitter<SignInState> emit) async {
    emit(IsLoading());
    AuthorizationModel? result =
        await VerityOtpRepository().verifyOTP(event.phone, event.otp);
    if (result == null) {
      emit(MobileVerified());
    } else {
      emit(MobileNotVerified());
    }
  }

  Future<void> selectCountryEvent(
      SelectCountryEvent event, Emitter<SignInState> emit) async {
    final picked = await countryPicker.showPicker(context: event.context);
    countryCode = picked;
    if (countryCode == null) {
      emit(CountryNotSelected());
    } else {
      emit(CountrySelected());
    }
  }
}
