

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:timer_count_down/timer_count_down.dart';
import '../../model/shared/colors_theme.dart';
import '../../model/shared/constant_attribute.dart';
import '../../router/router.dart';
import '../widget/default_button.dart';
import '../widget/default_form_field.dart';
import '../widget/default_text_field.dart';

class ThirdOTPScreen extends StatelessWidget {
  const ThirdOTPScreen({super.key});
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return  Scaffold(
      appBar:  AppBar(
        leading:IconButton(
            onPressed: (){
              Navigator.of(context).popAndPushNamed(AppRoute.secondOTPScreen);
            },
            icon: Image.asset("assets/images/arrow-left.png",)),
        centerTitle: true,
        title: const Text("Two-step verification",),

      ),
      body:  Form(
      key: formKeyOTP,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const DefaultText(
                  text: " Enter the 6 digit code",
                  color: AppTheme.blackGP,
                  fontSize: 17,
                  fontWeight: FontWeight.bold,
                ),
                SizedBox(height: 0.02*height,),
                const DefaultText(
                  text: " Please confirm your account by entering the authorization code sen to ****-****-7234",
                  color: AppTheme.grayGP,
                  fontSize: 15,
                  fontWeight: FontWeight.normal,
                ),
                SizedBox(height: 0.06*height,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [

                    SizedBox(
                      height: 0.2* width,
                      width: 0.1* width,
                      child: DefaultFormField(
                          radius: 10,
                          backgroundColor: AppTheme.whiteGP,
                          controller: otp1Controller,
                          keyboardType: TextInputType.text,
                          labelText: "",
                          validator: (value) {
                            if (value!.isEmpty) {
                              return "";
                            } else {
                              return null;
                            }
                          }),
                    ),
                    SizedBox(width: 0.02*width,),
                    SizedBox(
                      height: 0.2* width,
                      width: 0.1* width,
                      child: DefaultFormField(
                          radius: 10,
                          backgroundColor: AppTheme.whiteGP,
                          controller: otp2Controller,
                          keyboardType: TextInputType.text,
                          labelText: "",
                          validator: (value) {
                            if (value!.isEmpty) {
                              return "";
                            } else {
                              return null;
                            }
                          }),
                    ),
                    SizedBox(width: 0.02*width,),
                    SizedBox(
                      height: 0.2* width,
                      width: 0.1* width,
                      child: DefaultFormField(
                          radius: 10,
                          backgroundColor: AppTheme.whiteGP,
                          controller: otp3Controller,
                          keyboardType: TextInputType.text,
                          labelText: "",
                          validator: (value) {
                            if (value!.isEmpty) {
                              return "";
                            } else {
                              return null;
                            }
                          }),
                    ),
                    SizedBox(width: 0.02*width,),
                    SizedBox(
                      height: 0.2* width,
                      width: 0.1* width,
                      child: DefaultFormField(
                          radius: 10,
                          backgroundColor: AppTheme.whiteGP,
                          controller: otp4Controller,
                          keyboardType: TextInputType.text,
                          labelText: "",
                          validator: (value) {
                            if (value!.isEmpty) {
                              return "";
                            } else {
                              return null;
                            }
                          }),
                    ),
                    SizedBox(width: 0.02*width,),
                    SizedBox(
                      height: 0.2* width,
                      width: 0.1* width,
                      child: DefaultFormField(
                          radius: 10,
                          backgroundColor: AppTheme.whiteGP,
                          controller: otp5Controller,
                          keyboardType: TextInputType.text,
                          labelText: "",
                          validator: (value) {
                            if (value!.isEmpty) {
                              return " ";
                            } else {
                              return null;
                            }
                          }),
                    ),
                    SizedBox(width: 0.02*width,),
                    SizedBox(
                      height: 0.2* width,
                      width: 0.1* width,
                      child: DefaultFormField(
                          radius: 10,
                          backgroundColor: AppTheme.whiteGP,
                          controller: otp6Controller,
                          keyboardType: TextInputType.text,
                          labelText: "",
                          validator: (value) {
                            if (value!.isEmpty) {
                              return " ";
                            } else {
                              return null;
                            }
                          }),
                    ),

                  ],
                ),
                SizedBox(height: 0.02*height,),
               /// time counter
                Row(
                  children: [
                   const DefaultText(
                      text: " resend code ",
                      color: AppTheme.grayGP,
                      fontSize: 15,
                      fontWeight: FontWeight.normal,
                    ),
            Countdown(
              seconds: 20,
              build: (BuildContext context, double time) => Text(time.toString()),
              interval: const Duration(milliseconds: 100),
              onFinished: () {

                print('Timer is done!');
              },
            ),
                  ],
                ),
                SizedBox(height: 0.02* height,),
                Center(
                  child: defaultButton(
                  text: 'Verify',
                  width: 0.7* width,
                  height: 0.06 * height,
                  radius: 25,
                  backGround: AppTheme.blueButtonGP,
                  function: () async {
                   if (formKeyOTP.currentState!.validate()) {
                          Navigator.of(context).pushNamedAndRemoveUntil(
                          AppRoute.settingsSecurityScreen, (route) => false);

                          Fluttertoast.showToast(
                              msg: "Saved Sucessfully!",
                              toastLength: Toast.LENGTH_SHORT,
                              gravity: ToastGravity.TOP,
                              timeInSecForIosWeb: 1,
                              backgroundColor: Colors.green,
                              textColor: Colors.white,
                              fontSize: 16.0);
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