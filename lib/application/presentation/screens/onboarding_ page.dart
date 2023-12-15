import 'package:fathima/application/presentation/screens/login_screen.dart';
import 'package:fathima/domain/core/colors/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import '../../../domain/core/fonts/fonts.dart';
import '../../business_logic/bloc/on_boarding_bloc.dart';
import '../widgets/onboarding_widget.dart';

class OnBoardingPage extends StatelessWidget {
  const OnBoardingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.only(right: 10, bottom: 10),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Expanded(
                child: TextButton(
                  onPressed: () {
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => const LoginScreen()));
                  },
                  child: Text(
                    "SKIP",
                    style: AppFonts().nornalText,
                  ),
                ),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * .75,
                width: MediaQuery.of(context).size.width * 1,
                child: const PageViewWidget(),
              ),
              const BottomScreenWidget()
            ],
          ),
        ),
      ),
    );
  }
}

class BottomScreenWidget extends StatelessWidget {
  const BottomScreenWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: MediaQuery.of(context).size.width * .18,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          BlocConsumer<OnBoardingBloc, OnBoardingState>(
            listener: (context, state) {},
            builder: (context, state) {
              if (state is OffNavBack) {
                return const SizedBox(
                  width: 20,
                );
              } else if (state is OnNavBack) {
                return InkWell(
                    onTap: () {
                      context.read<OnBoardingBloc>().add(
                            OnBoradNavEvent(navForward: false),
                          );
                    },
                    child: _navigationIcon(
                      navIcon: Icons.arrow_back_ios,
                    ));
              }
              return const SizedBox(
                width: 20,
              );
            },
          ),
          SmoothPageIndicator(
              controller: context.read<OnBoardingBloc>().onBoardingPgController,
              count: 3,
              effect: ScrollingDotsEffect(
                  activeDotColor: AppColors().black,
                  dotColor: AppColors().gray,
                  activeDotScale: 1.6,
                  dotHeight: 10,
                  dotWidth: 10)),
          InkWell(
            onTap: () {
              if (context.read<OnBoardingBloc>().activePage == 2) {
                Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => const LoginScreen()));
              } else {
                context
                    .read<OnBoardingBloc>()
                    .add(OnBoradNavEvent(navForward: true));
              }
            },
            child: _navigationIcon(
              navIcon: Icons.arrow_forward_ios,
            ),
          ),
        ],
      ),
    );
  }
}

class PageViewWidget extends StatelessWidget {
  const PageViewWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return PageView(
      controller: context.read<OnBoardingBloc>().onBoardingPgController,
      children: [
        OnboardingWidget(
          normalTopTxt: "Charge your EV",
          titleTxtBlack: "At Your",
          titleTxtOrange: "Fingertips",
          imagePath: "assets/OnBoardingPg1Dark.png",
          bottomTxt: "Scan Charge and Go Effortless Charging schemas",
          imageNo: 1,
        ),
        OnboardingWidget(
          normalTopTxt: "Easy EV Navigation",
          titleTxtBlack: "Travel Route",
          titleTxtOrange: "For Electrics",
          imagePath: "assets/OnBoardingPg2Dark.png",
          bottomTxt:
              "Grab The Best In Class Digital Experience Crafted For EV Drivers",
          imageNo: 2,
        ),
        OnboardingWidget(
          normalTopTxt: "Interaction with Grid",
          titleTxtBlack: "RealTime",
          titleTxtOrange: "Monitoring",
          imagePath: "assets/OnBoardingPg3Dark.png",
          bottomTxt: "Intelligent Sensible Devices Ambicharge Series",
          imageNo: 3,
        ),
      ],
      onPageChanged: (value) {
        context.read<OnBoardingBloc>().activePage = value;
      },
    );
  }
}
// ignore: must_be_immutable
class _navigationIcon extends StatelessWidget {
  _navigationIcon({
    super.key,
    required this.navIcon,
  });
  IconData navIcon;
  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      backgroundColor: AppColors().orange,
      radius: 20,
      child: Icon(
        navIcon,
        size: 15,
        color: AppColors().white,
      ),
    );
  }
}
