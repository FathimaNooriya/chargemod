part of 'sign_in_bloc.dart';

sealed class SignInEvent {}

class SendOtpEvent extends SignInEvent {
  String phone;
  SendOtpEvent({required this.phone});
}

class ResendOtpEvent extends SignInEvent {
  String phone;
  ResendOtpEvent({required this.phone});
}

class VerifyOtpEvent extends SignInEvent {
  String phone;
  int otp;
  VerifyOtpEvent({required this.phone, required this.otp});
}

class SelectCountryEvent extends SignInEvent {
  BuildContext context;
  SelectCountryEvent({required this.context});
}
