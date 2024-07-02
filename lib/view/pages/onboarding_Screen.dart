import 'package:flutter/material.dart';
import 'package:gp_amit60_mary_zekrie/view/widget/default_button.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import '../../model/onboarding_model.dart';
import '../../model/shared/cache_helper.dart';
import '../../model/shared/colors_theme.dart';
import '../../model/shared/enum.dart';
import '../../router/router.dart';
import '../builder_item/onboarding_item.dart';
import '../widget/default_text_field.dart';

class OnBoardingScreen extends StatefulWidget {
  const OnBoardingScreen({super.key});

  @override
  State<OnBoardingScreen> createState() => _OnBoardingScreenState();
}

class _OnBoardingScreenState extends State<OnBoardingScreen> {
  var pageController = PageController();
  var isLast= false;
  int _currentPage = 0;

  void finishOnBoarding ( context, String screen){
    CacheHelper.putBOOL(key: SharedKeys.onBoarding, value: isLast);
    Navigator.pushNamedAndRemoveUntil(context, screen, (route) => false);
  }

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return  Scaffold(
        appBar:  AppBar(
          leading: Image.asset("assets/images/Logo_small.png",),
          actions: [
            TextButton(onPressed: (){
              // Login
              CacheHelper.putBOOL(key: SharedKeys.onBoarding, value: true);
              finishOnBoarding(context, AppRoute.loginScreen);
            }, child: const DefaultText(text: "Skip",
              fontSize:15))
          ],),
        body: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Expanded(
                child: PageView.builder(
                  controller: pageController,
                  itemBuilder: (context , index){
                    return BuilderOnBoarding(onboardingModel: dataOnboarding[index],);
                  },
                  itemCount:  dataOnboarding.length,
                  onPageChanged: (int index){
                    if(index == dataOnboarding.length-1){
                      setState(() {
                        isLast = true;
                        _currentPage = index;
                        });
                    }else {
                      setState(() {
                        isLast= false;
                        _currentPage = index;  // this will be used to toggle buttons and move tonext page
                      });
                    }
                  },
                ),
              ),
              SizedBox(height:0.02*height,),
              Visibility(
                visible: isLast,
                replacement: const SizedBox(width:20),
                // defaultButton(text: 'Next',
                //     width: 0.8*width,
                //     height: 0.08*height,
                //     radius: 40,
                //     backGround: AppTheme.blueButtonGP,
                //     function: () async {
                //     Navigator.pushNamed(context, AppRoute.onBoardingScreen[_currentPage+1]);
                //   }
                //),

                child: defaultButton(
                    text: 'Get Started',
                    width: 0.8*width,
                    height: 0.07*height,
                    radius: 40,
                    backGround: AppTheme.blueButtonGP,
                    function: () async {
                      CacheHelper.putBOOL(key: SharedKeys.onBoarding, value: true);
                      finishOnBoarding(context, AppRoute.loginScreen);
                    }),

              ),
              SizedBox(height:0.02*height,),
              Center(
                child: SmoothPageIndicator(
                  controller: pageController,
                  count:  dataOnboarding.length,
                  axisDirection: Axis.horizontal,
                  effect:  const SlideEffect(
                      spacing:  8.0,
                      radius:  50.0,
                      dotWidth:  14.0,
                      dotHeight:  14.0,
                      paintStyle:  PaintingStyle.fill,
                      strokeWidth:  0.5,
                      dotColor:  AppTheme.blueLightGP,
                      activeDotColor:  AppTheme.blueButtonGP,
                  ),
                ),
              ),

            ],
          ),
        ));
  }
}
