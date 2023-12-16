import 'package:fathima/application/business_logic/signin_bloc/bloc/sign_in_bloc.dart';
import 'package:fathima/domain/core/colors/colors.dart';
import 'package:fathima/domain/core/fonts/fonts.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';

class OtpScreen extends StatelessWidget {
  const OtpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(child: const Text("Verification")),
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: MediaQuery.of(context).size.width * .1,
          vertical: MediaQuery.of(context).size.width * .2,
        ),
        child: Column(
          children: [
            Text(
              "We’ve send you the verification",
              style: AppFonts().smallTextBlack15,
            ),
            Text(
              "code on +91 ${context.read<SignInBloc>().phoneNumController.text}",
              style: AppFonts().smallTextBlack15,
            ),
            OtpTextField(
                numberOfFields: 4,
                showFieldAsBox: true,
                onSubmit: (String OTPcode) {}),
            Text(
              "Resent OTP",
              style: AppFonts().smallTextOrange14,
            ),
            const Expanded(child: SizedBox()),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      backgroundColor: AppColors().orange),
                  onPressed: () {},
                  child: const Text("continue")),
            )
          ],
        ),
      ),
    );
  }
}
