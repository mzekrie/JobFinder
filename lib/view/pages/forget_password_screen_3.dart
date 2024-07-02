import 'package:flutter/material.dart';
import '../../control/cubit/auth/login_cubit.dart';
import '../../model/shared/colors_theme.dart';
import '../../model/shared/constant_attribute.dart';
import '../../router/router.dart';
import '../widget/default_button.dart';
import '../widget/default_form_field.dart';
import '../widget/default_text_field.dart';
//import '../../model/shared/cache_helper.dart';
//import '../../model/shared/enum.dart';

class ForgetPasswordScreen_3 extends StatelessWidget {
  const ForgetPasswordScreen_3({super.key});

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      body: SafeArea(
        child:Stack(
          children:[
            Positioned(
                right: 20.0,top:30.0,
                child: Image.asset('assets/images/Logo_small.png')),
            Center(
              child: SingleChildScrollView(
                child: Form(
                  key: formKey,
                  child: Padding(
                    padding: const EdgeInsets.only(top: 0, left: 20, right: 20),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        SizedBox(height:height * 0.02),
                        const DefaultText(
                          text: "Create new password",
                          color: AppTheme.blackGP,
                          fontSize: 30,
                          fontWeight: FontWeight.bold,
                        ),
                        SizedBox(height: height * 0.02),
                        const DefaultText(
                          text: "Set your new password so you can login and acces Jobsque",
                          color: AppTheme.grayGP,
                          fontSize: 20,
                          fontWeight: FontWeight.normal,
                        ),
                        SizedBox(
                            height: height * 0.02),
                        DefaultFormField(
                            controller: passwordController,
                            prefixIcon:
                            Image.asset("assets/images/login_password.png"),
                            suffixIcon:
                            Image.asset("assets/images/login_eye_close.png"),
                            backgroundColor: AppTheme.whiteGP,
                            labelText: "Password",
                            keyboardType: TextInputType.visiblePassword,
                            validator: (value) {
                              if (value!.length <= 8) {
                                return "Password length should be 8 or more characters ";
                              }
                              return null;
                            }),
                        SizedBox(height: height * 0.02),

                        DefaultFormField(
                            controller: confirmPasswordController,
                            prefixIcon:
                            Image.asset("assets/images/login_password.png"),
                            suffixIcon:
                            Image.asset("assets/images/login_eye_close.png"),
                            backgroundColor: AppTheme.whiteGP,
                            labelText: "Password",
                            keyboardType: TextInputType.visiblePassword,
                            validator: (value) {
                              if (value!.length <= 8) {
                                return "Password length should be 8 or more characters ";
                              }
                              else if (value != passwordController.text ) {
                                return "Both password must be identical";
                              }
                              else return null;
                            }),

                        const DefaultText(
                          text: "Both password must match ",
                          color: AppTheme.grayGP,
                          fontSize: 20,
                          fontWeight: FontWeight.normal,
                        ),
                        const SizedBox(height: 40),

                        Padding(padding: const EdgeInsets.only( top:20, left: 20, right: 20),
                          child: defaultButton(
                              text: 'Reset password',
                              width: 300,
                              height: 40,
                              radius: 25,
                              backGround: AppTheme.blueButtonGP,
                              function: () async {
                                if (formKey.currentState!.validate()) {

                                  await LoginCubit.get(context).updatePassword(
                                    password: passwordController.text,
                                  );
                                  passwordController.clear();
                                  confirmedPasswordController.clear();
                                  Navigator.of(context).pushNamedAndRemoveUntil(
                                      AppRoute.forgetPasswordScreen_4, (route) => false);

                                }
                              }),),

                      ],
                    ),
                  ),
                ),
              ),
            ),
          ],),
      ),
    );
  }
}
