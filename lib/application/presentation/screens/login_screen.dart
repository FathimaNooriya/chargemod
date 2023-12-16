import 'package:fathima/domain/core/colors/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../domain/core/fonts/fonts.dart';
import '../../business_logic/signin_bloc/bloc/sign_in_bloc.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Form(
          child: Padding(
            padding: EdgeInsets.only(
              top: MediaQuery.of(context).size.height * .18,
              bottom: MediaQuery.of(context).size.height * .1,
              left: MediaQuery.of(context).size.width * .04,
              right: MediaQuery.of(context).size.width * .04,
            ),
            child: SizedBox(
              height: MediaQuery.of(context).size.height,
              child: Column(
                children: [
                  Padding(
                    padding: EdgeInsets.only(
                      bottom: MediaQuery.of(context).size.height * .05,
                    ),
                    child: const _topWidget(),
                  ),
                  const _selectCountryWidget(),
                  const _buttonWidget(),
                  const Expanded(child: SizedBox()),
                  const _TextWidget()
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class _TextWidget extends StatelessWidget {
  const _TextWidget();

  @override
  Widget build(BuildContext context) {
    return RichText(
      text: TextSpan(
          text: "By Continuing you agree to our",
          style: AppFonts().smallTextBlack14,
          children: [
            TextSpan(
              text: "Terms & Condition",
              style: AppFonts().smallTextOrange14,
            ),
            TextSpan(
              text: " and",
              style: AppFonts().smallTextBlack14,
            ),
            TextSpan(
              text: " Privacy Policy",
              style: AppFonts().smallTextOrange14,
            )
          ]),
    );
  }
}

class _buttonWidget extends StatelessWidget {
  const _buttonWidget();

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: ElevatedButton(
          style: ElevatedButton.styleFrom(
              backgroundColor: AppColors().orange,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(5))),
          onPressed: () {},
          child: Text(
            "Sent OTP",
            style: AppFonts().nornalTextWt,
          )),
    );
  }
}

class _selectCountryWidget extends StatelessWidget {
  const _selectCountryWidget();

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Container(
          width: MediaQuery.of(context).size.width * .25,
          height: MediaQuery.of(context).size.width * .18,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(5), border: Border.all()),
          child: Row(
            children: [
              Expanded(
                child: BlocConsumer<SignInBloc, SignInState>(
                    listener: (context, state) {},
                    builder: (context, state) {
                      if (state is CountrySelected) {
                        return Center(
                          child: context
                              .read<SignInBloc>()
                              .countryCode!
                              .flagImage(),
                        );
                      } else {
                        return const SizedBox();
                      }
                    }),
              ),
              IconButton(
                  onPressed: () async {
                    context
                        .read<SignInBloc>()
                        .add(SelectCountryEvent(context: context));
                  },
                  icon: const Icon(
                    Icons.keyboard_arrow_down,
                    size: 25,
                  )),
            ],
          ),
        ),
        SizedBox(
            width: MediaQuery.of(context).size.width * .65,
            child: TextFormField(
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                  prefixIcon: const Icon(Icons.call),
                  hintText: "Enter phone number",
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5))),
            )),
      ],
    );
  }
}

class _topWidget extends StatelessWidget {
  const _topWidget();

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height * .18,
      child: FittedBox(
        fit: BoxFit.cover,
        child: Column(
          children: [
            Text("chargeMOD", style: AppFonts().nornalText),
            Text("Let's Start", style: AppFonts().bigTextBlack),
            Text("from login", style: AppFonts().bigTextOrange),
          ],
        ),
      ),
    );
  }
}
