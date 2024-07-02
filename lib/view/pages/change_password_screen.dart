
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:gp_amit60_mary_zekrie/model/shared/cache_helper.dart';
import 'package:gp_amit60_mary_zekrie/model/shared/enum.dart';
import '../../control/cubit/auth/login_cubit.dart';
import '../../model/shared/colors_theme.dart';
import '../../model/shared/constant_attribute.dart';
import '../../router/router.dart';
import '../widget/default_button.dart';
import '../widget/default_form_field.dart';
import '../widget/default_text_field.dart';

class ChangePasswordScreen extends StatelessWidget {
  const ChangePasswordScreen({super.key});
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return  Scaffold(
      appBar:  AppBar(
        leading:IconButton(
            onPressed: (){
              currentPasswordController.clear();
              newPasswordController.clear();
              confirmedPasswordController.clear();
              Navigator.of(context).popAndPushNamed(AppRoute.settingsSecurityScreen);
            },
            icon: Image.asset("assets/images/arrow-left.png",)),
        centerTitle: true,
        title: const Text("Change Password ",),

      ),
      body:  Padding(
        padding: const EdgeInsets.all(18.0),
        child: SingleChildScrollView(
          child: Form(
            key: formKeyPassword,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ///old password
                const DefaultText(
                  text: " Enter your current password",
                  color: AppTheme.blackGP,
                  fontSize: 17,
                  fontWeight: FontWeight.bold,
                ),
                SizedBox(height: 0.02*height,),
                DefaultFormField(
                    controller: currentPasswordController,
                    prefixIcon:
                    Image.asset("assets/images/login_password.png"),
                    suffixIcon: Image.asset(
                        "assets/images/login_eye_close.png"),
                    backgroundColor: AppTheme.whiteGP,
                    labelText: "Current Password",
                    keyboardType: TextInputType.visiblePassword,
                    validator: (value) {
                      if (value!.length <= 8) {
                        return "Password length should be 8 or more characters ";
                      }
                      return null;
                    }),
                SizedBox(height: 0.02*height,),
                const DefaultText(
                  text: " Enter your new password",
                  color: AppTheme.blackGP,
                  fontSize: 17,
                  fontWeight: FontWeight.bold,),
                SizedBox(height: 0.02*height,),
                DefaultFormField(
                    controller: newPasswordController,
                    prefixIcon:
                    Image.asset("assets/images/login_password.png"),
                    suffixIcon: Image.asset(
                        "assets/images/login_eye_close.png"),
                    backgroundColor: AppTheme.whiteGP,
                    labelText: "New Password",
                    keyboardType: TextInputType.visiblePassword,
                    validator: (value) {
                      if (value!.length <= 8) {
                        return "Password length should be 8 or more characters ";
                      }
                      return null;
                    }),
                SizedBox(height: 0.04*height,),
                const DefaultText(
                  text: " Confirm your new password",
                  color: AppTheme.blackGP,
                  fontSize: 17,
                  fontWeight: FontWeight.bold,),
                SizedBox(height: 0.02*height,),
                DefaultFormField(
                    controller: confirmedPasswordController,
                    prefixIcon:
                    Image.asset("assets/images/login_password.png"),
                    suffixIcon: Image.asset(
                        "assets/images/login_eye_close.png"),
                    backgroundColor: AppTheme.whiteGP,
                    labelText: "Confirm your Password",
                    keyboardType: TextInputType.visiblePassword,
                    validator: (value) {
                      if (value!.length <= 8) {
                        return "Password length should be 8 or more characters ";
                      }
                      else if (value != newPasswordController.text){
                        return "Passwords must be identical";

                      }
                      else{
                      return null;}
                    }),
                /// button
                SizedBox(height: 0.03*height,),
                Center(
                  child: defaultButton(
                      text: 'Save',
                      width: 0.7* width,
                      height: 0.06 * height,
                      radius: 25,
                      backGround: AppTheme.blueButtonGP,
                      function: () async {
                        if (formKeyPassword.currentState!.validate()) {

                          //('error')
                          String? _validate = await LoginCubit.get(context).updatePassword(
                            password: newPasswordController.text,
                          );

                          if (_validate != ('error')) {

                            CacheHelper.putBOOL(key: SharedKeys.rememberMeLogin, value: false);
                            Navigator.of(context)
                                .pushNamedAndRemoveUntil(
                                AppRoute.loginScreen,
                                    (route) => false);

                            currentPasswordController.clear();
                            newPasswordController.clear();
                            confirmedPasswordController.clear();

                            Fluttertoast.showToast(
                              msg: "Password changed Successfully, please login again!",
                              toastLength: Toast.LENGTH_SHORT,
                              gravity: ToastGravity.BOTTOM,
                              timeInSecForIosWeb: 5,
                              backgroundColor: Colors.green,
                              textColor: Colors.white,
                              fontSize: 16.0,
                            );
                          } else {
                            Fluttertoast.showToast(
                                msg:
                                "Incorrect updating trial ",
                                toastLength: Toast.LENGTH_SHORT,
                                gravity: ToastGravity.BOTTOM,
                                timeInSecForIosWeb: 3,
                                backgroundColor: Colors.red,
                                textColor: Colors.white,
                                fontSize: 16.0);
                          }
                        } else {
                          Fluttertoast.showToast(
                            msg: "Incorrect updating  trial ",
                            toastLength: Toast.LENGTH_SHORT,
                            gravity: ToastGravity.BOTTOM,
                            timeInSecForIosWeb: 3,
                            backgroundColor: Colors.red,
                            textColor: Colors.white,
                            fontSize: 16.0,
                          );
                        }
                      }),
                ),/// center wid
              ],
            ),
          ),
        ),
      ),
    );
  }
} // end of statlessWidget