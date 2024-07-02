

import 'package:flutter/material.dart';
import '../../model/shared/colors_theme.dart';
import '../../model/shared/constant_attribute.dart';
import '../../router/router.dart';
import '../widget/default_button.dart';
import '../widget/default_form_field.dart';
import '../widget/default_phone_field.dart';
import '../widget/default_text_field.dart';

class SecondOTPScreen extends StatelessWidget {
  const SecondOTPScreen({super.key});
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return  Scaffold(
      appBar:  AppBar(
        leading:IconButton(
            onPressed: (){
              Navigator.of(context).popAndPushNamed(AppRoute.firstOTPScreen);
            },
            icon: Image.asset("assets/images/arrow-left.png",)),
        centerTitle: true,
        title: const Text("Two-step verification",),

      ),
      body:  Form(
        key: formKeyOTP,
        child: Padding(
          padding: const EdgeInsets.all(18.0),
          child: Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ///phone
                const DefaultText(
                  text: " Add phone number",
                  color: AppTheme.blackGP,
                  fontSize: 17,
                  fontWeight: FontWeight.bold,
                ),


                SizedBox(height: 0.02*height,),
                const DefaultText(
                  text: " We will send a verification code to this number",
                  color: AppTheme.grayGP,
                  fontSize: 15,
                  fontWeight: FontWeight.normal,
                ),
                SizedBox(height: 0.02*height,),
                DefaultPhoneField(
                  controller: phoneController,
                  validator: (value) {
                    if (value!.isEmpty) {
                      return "phone number must not be empty ";
                    }
                    return null;
                  },
                  labelText: "Phone Number",
                  onChange: (countryCode) {
                    myCountry = countryCode;
                  },
                  hintText: "Contact Phone Number",
                ),
                /// password
                SizedBox(height: 0.04*height,),


            const DefaultText(
            text: " Enter your password",
            color: AppTheme.blackGP,
            fontSize: 17,
            fontWeight: FontWeight.bold,),
                SizedBox(height: 0.02*height,),
                DefaultFormField(
                    controller: passwordController,
                    prefixIcon:
                    Image.asset("assets/images/login_password.png"),
                    suffixIcon: Image.asset(
                        "assets/images/login_eye_close.png"),
                    backgroundColor: AppTheme.whiteGP,
                    labelText: "Password",
                    keyboardType: TextInputType.visiblePassword,
                    validator: (value) {
                      if (value!.length <= 8) {
                        return "Password length should be 8 or more characters ";
                      }
                      return null;
                    }),
                SizedBox(height: 0.04*height,),
                /// button
                Center(
                  child: defaultButton(
                      text: 'Send Code',
                      width: 0.7* width,
                      height: 0.06 * height,
                      radius: 25,
                      backGround: AppTheme.blueButtonGP,
                      function: () async {
                        if (formKeyOTP.currentState!.validate()) {
                          Navigator.of(context).pushNamedAndRemoveUntil(
                              AppRoute.thirdOTPScreen, (route) => false);

                        }
                      }),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
} // end of statlessWidget