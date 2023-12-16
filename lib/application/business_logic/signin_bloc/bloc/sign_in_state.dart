part of 'sign_in_bloc.dart';


abstract class SignInState {}

final class SignInInitial extends SignInState {}
class CountrySelected extends SignInState {}
class CountryNotSelected extends SignInState {}
class OtpSuccess extends SignInState {}
class OtpFailed extends SignInState {}
class MobileVerified extends SignInState {}
class MobileNotVerified extends SignInState {}