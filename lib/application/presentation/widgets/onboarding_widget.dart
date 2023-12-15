import 'package:flutter/material.dart';
import '../../../domain/core/fonts/fonts.dart';

class OnboardingWidget extends StatelessWidget {
  OnboardingWidget({
    super.key,
    required this.normalTopTxt,
    required this.titleTxtBlack,
    required this.titleTxtOrange,
    required this.imagePath,
    required this.bottomTxt,
    required this.imageNo,
  });
  String normalTopTxt;
  String titleTxtBlack;
  String titleTxtOrange;
  String imagePath;
  String bottomTxt;
  int imageNo;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(
            height: MediaQuery.of(context).size.height * .18,
            child: FittedBox(
              fit: BoxFit.cover,
              child: Column(
                children: [
                  Text(normalTopTxt, style: AppFonts().nornalText),
                  Text(titleTxtBlack, style: AppFonts().bigTextBlack),
                  Text(titleTxtOrange, style: AppFonts().bigTextOrange),
                ],
              ),
            ),
          ),
          SizedBox(
            height: 250,
            width: 500,
            child: imageNo == 1
                ? Stack(
                    children: [
                      Positioned(
                        right: 1,
                        child: SizedBox(
                          width: MediaQuery.of(context).size.width * 1.3,
                          height: MediaQuery.of(context).size.height * .32,
                          child: FittedBox(
                            fit: BoxFit.fill,
                            child: Image(
                              image: AssetImage(
                                imagePath,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  )
                : SizedBox(
                    height: MediaQuery.of(context).size.height * .2,
                    width: MediaQuery.of(context).size.width * .25,
                    child: FittedBox(
                      fit: BoxFit.contain,
                      child: Image(
                        image: AssetImage(
                          imagePath,
                        ),
                      ),
                    ),
                  ),
          ),
          Center(
            child: Padding(
              padding: EdgeInsets.symmetric(
                  horizontal: MediaQuery.of(context).size.width * .1),
              child: Center(
                  child: Text(
                bottomTxt,
                style: AppFonts().smallTextBlack15,
                textAlign: TextAlign.center,
              )),
            ),
          ),
        ],
      ),
    );
  }
}
