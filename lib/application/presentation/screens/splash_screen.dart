import 'dart:async';

import 'package:fathima/application/presentation/screens/onboarding_%20page.dart';
import 'package:flutter/material.dart';
import 'package:fathima/domain/core/colors/colors.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Timer(const Duration(seconds: 5), () {
      Navigator.of(context).push(
          MaterialPageRoute(builder: (context) => const OnBoardingPage()));
    });
    return Scaffold(
      backgroundColor: AppColors().white,
      body: Column(
        children: [
          const Expanded(
            child: Image(image: AssetImage("assets/Splash Screen Tx Lt.png")),
          ),
          Center(
            child: LinearPercentIndicator(
              width: MediaQuery.of(context).size.width * .9,
              animation: true,
              percent: 1,
              lineHeight: 5,
              animationDuration: 5000,
              progressColor: AppColors().orange,
              backgroundColor: AppColors().lightGray,
              padding: EdgeInsets.symmetric(
                  horizontal: MediaQuery.of(context).size.width * .12),
            ),
          ),
          const Padding(
            padding: EdgeInsets.only(top: 10),
            child: Text("Connecting to chargeMOD"),
          ),
        ],
      ),
    );
  }
}
