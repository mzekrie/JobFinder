import 'package:flutter/material.dart';
import '../../model/shared/colors_theme.dart';
import '../../router/router.dart';
import '../widget/default_button.dart';
import '../widget/default_text_field.dart';
class ForgetPasswordScreen_4 extends StatelessWidget {
  const ForgetPasswordScreen_4({super.key});

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            Positioned(
                right: 20.0,
                top: 30.0,
                child: Image.asset(
                  'assets/images/Logo_small.png',
                )),
            Center(
              child: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.only(top: 40, left: 20, right: 20),
                  child: Column(
                    //mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Image.asset(
                        'assets/images/forget_2.png',
                      ),
                      SizedBox(
                        height: height * 0.04,
                      ),
                      const DefaultText(
                        text: "Password changed succesfully!",
                        color: AppTheme.blackGP,
                        fontSize: 30,
                        fontWeight: FontWeight.bold,
                      ),
                      SizedBox(
                        height: height * 0.04,
                      ),
                      const DefaultText(
                        text:
                        "Your password has been changed successfully, we will let you know if there are more problems with your account",
                        color: AppTheme.grayGP,
                        fontSize: 20,
                        fontWeight: FontWeight.normal,
                      ),
                      SizedBox(
                        height: height * 0.2,
                      ),
                      // list of choices items
                      Padding(
                        padding: const EdgeInsets.only(
                            top: 20, left: 20, right: 20),
                        child: defaultButton(
                            text: 'Open email app',
                            width: 0.8*width,
                            height: 0.08*height,
                            radius: 40,
                            backGround: AppTheme.blueButtonGP,
                            function: () async {
                              Navigator.of(context).pushNamedAndRemoveUntil(
                                  AppRoute.loginScreen, (route) => false);
                            }),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

}