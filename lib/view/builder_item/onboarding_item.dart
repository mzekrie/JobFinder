import 'package:flutter/material.dart';
import 'package:gp_amit60_mary_zekrie/model/onboarding_model.dart';
import '../../model/shared/colors_theme.dart';
import '../widget/default_text_field.dart';

class BuilderOnBoarding extends StatelessWidget {
  OnboardingModel onboardingModel;
  BuilderOnBoarding({ super.key, required this.onboardingModel}); // make the object required

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return  Center(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Image.asset("${onboardingModel.image}", height: height * 0.3, width: width * 1.0,),
          SizedBox(
            height: height * 0.04,
          ),
          DefaultText(
            text: ("${onboardingModel.titleDes}"),
            color: AppTheme.blackGP,
            fontSize:25,
            fontWeight: FontWeight.bold,
          ),
          SizedBox(
            height: height * 0.02,
          ),
          DefaultText(
            text:"${onboardingModel.detailDes}",
            color: AppTheme.grayGP,
            fontSize: 20,
            fontWeight: FontWeight.normal,
          ),


        ],
      ),
    );
  }
}