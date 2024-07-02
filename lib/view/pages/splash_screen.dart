import 'dart:async';
import 'package:flutter/material.dart';
import '../../model/shared/cache_helper.dart';
import '../../model/shared/enum.dart';
import '../../router/router.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    Timer(const Duration(seconds: 5),
            (){
      if ( CacheHelper.getBOOL(key: SharedKeys.rememberMeLogin) == true ){
        Navigator.pushReplacementNamed(context, AppRoute.homeScreen);
      }else{

        if (CacheHelper.getBOOL(key: SharedKeys.onBoarding) == false){
          Navigator.pushReplacementNamed(context, AppRoute.onBoardingScreen);
        }else{
          Navigator.pushReplacementNamed(context, AppRoute.loginScreen);
        }
      }
        }
    );
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          children: [
            Image.asset('assets/images/logo_splash_ellipse.png'),
           ],
        ),
      ),
      //   body:  EasySplashScreen(
      //       logo:  Image.asset('assets/images/logo_splash_ellipse.png'),
      //       title: const Text(
      //         " ",
      //         style: TextStyle(
      //           fontSize: 18,
      //           fontWeight: FontWeight.bold,
      //         ),
      //       ),
      //       backgroundColor: Colors.grey,
      //       showLoader: true,
      //       navigator: LoginScreen(),
      //       durationInSeconds: 5,
      //     ),
    );
  }
}
