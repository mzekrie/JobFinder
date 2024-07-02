
import 'package:flutter/material.dart';

import '../../model/shared/colors_theme.dart';
import '../../router/router.dart';
import '../widget/default_text_field.dart';

class SettingsSecurityScreen extends StatelessWidget {
  const SettingsSecurityScreen({super.key});
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return  Scaffold(
      appBar:  AppBar(
        leading:IconButton(
            onPressed: (){
              Navigator.of(context).popAndPushNamed(AppRoute.profileScreen);
            },
            icon: Image.asset("assets/images/arrow-left.png",)),
        centerTitle: true,
        title: const Text("Login and security",),

      ),
      body:  Column(
        children: [
          Container(
            padding: const EdgeInsets.all(4),
            width: double.infinity,
            color: AppTheme.chat_bg_text2_gray,
            child:  const DefaultText(
              text: "  Accont access",
              color: AppTheme.blackGP,
              fontSize: 17,
              fontWeight: FontWeight.normal,
            ),
          ),
          Container(
            color:AppTheme.whiteGP,
            child: Padding(
              padding: const EdgeInsets.all(18.0),
              child: SingleChildScrollView(
                scrollDirection: Axis.vertical,
                child: Column(
            children: [
              SizedBox(
                height: height * 0.08,
                child: Column(
                  children: [
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [

                        SizedBox(
                          width: 0.7* width,
                          child:const DefaultText(
                            text: "Full Name ",
                            color: AppTheme.blackGP,
                            fontSize: 15,
                            fontWeight: FontWeight.normal,
                          ),
                        ),
                        IconButton(
                            onPressed: () {
                              Navigator.of(context).pushNamedAndRemoveUntil(
                                  AppRoute.changeNameScreen, (route) => true);
                            },
                            icon: Image.asset(
                              "assets/images/profile_arrow.png",
                            )),

                      ],
                    ),
                    const Expanded(child: Divider(thickness: 1,color:AppTheme.gray2)),
                  ],
                ),
              ),
               SizedBox(
                height: height * 0.08,
                child: Column(
                  children: [
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
          
                        SizedBox(
                          width: 0.7* width,
                          child:const DefaultText(
                            text: "Email address",
                            color: AppTheme.blackGP,
                            fontSize: 15,
                            fontWeight: FontWeight.normal,
                          ),
                        ),
                        IconButton(
                            onPressed: () {
                              Navigator.of(context).pushNamedAndRemoveUntil(
                                  AppRoute.changeEmailScreen, (route) => true);
                            },
                            icon: Image.asset(
                              "assets/images/profile_arrow.png",
                            )),
          
                      ],
                    ),
                    const Expanded(child: Divider(thickness: 1,color:AppTheme.gray2)),
                  ],
                ),
              ),
              //SizedBox(height: height * 0.02,),
              SizedBox(
                height: height * 0.08,
                child: Column(
                  children: [
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
          
                        SizedBox(
                          width: 0.7* width,
                          child:const DefaultText(
                            text: "Phone number",
                            color: AppTheme.blackGP,
                            fontSize: 15,
                            fontWeight: FontWeight.normal,
                          ),
                        ),
                        IconButton(
                            onPressed: () {
                              Navigator.of(context).pushNamedAndRemoveUntil(
                                  AppRoute.helpCenterScreen, (route) => true);
                            },
                            icon: Image.asset(
                              "assets/images/profile_arrow.png",
                            )),
          
                      ],
                    ),
                    const Expanded(child: Divider(thickness: 1,color:AppTheme.gray2)),
                  ],
                ),
              ),
              // SizedBox(height: height * 0.02,),
              SizedBox(
                height: height * 0.08,
                child: Column(
                  children: [
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
          
                        SizedBox(
                          width: 0.7* width,
                          child:const DefaultText(
                            text: "Change password",
                            color: AppTheme.blackGP,
                            fontSize: 15,
                            fontWeight: FontWeight.normal,
                          ),
                        ),
                        IconButton(
                            onPressed: () {
                              Navigator.of(context).pushNamedAndRemoveUntil(
                                  AppRoute.changePasswordScreen, (route) => true);
                            },
                            icon: Image.asset(
                              "assets/images/profile_arrow.png",
                            )),
          
                      ],
                    ),
                    const Expanded(child: Divider(thickness: 1,color:AppTheme.gray2)),
                  ],
                ),
              ),
              //SizedBox(height: height * 0.02,),
              SizedBox(
                height: height * 0.08,
                child: Column(
                  children: [
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
          
                        SizedBox(
                          width: 0.7* width,
                          child:const DefaultText(
                            text: "Two-step verification",
                            color: AppTheme.blackGP,
                            fontSize: 15,
                            fontWeight: FontWeight.normal,
                          ),
                        ),
                        IconButton(
                            onPressed: () {
                              Navigator.of(context).pushNamedAndRemoveUntil(
                                  AppRoute.firstOTPScreen, (route) => true);
                            },
                            icon: Image.asset(
                              "assets/images/profile_arrow.png",
                            )),
          
                      ],
                    ),
                    const Expanded(child: Divider(thickness: 1,color:AppTheme.gray2)),
                  ],
                ),
              ),
              SizedBox(
                height: height * 0.08,
                child: Column(
                  children: [
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
          
                        SizedBox(
                          width: 0.7* width,
                          child:const DefaultText(
                            text: "Face ID",
                            color: AppTheme.blackGP,
                            fontSize: 15,
                            fontWeight: FontWeight.normal,
                          ),
                        ),
                        IconButton(
                            onPressed: () {
                              Navigator.of(context).pushNamedAndRemoveUntil(
                                  AppRoute.privacyPolicyScreen, (route) => true);
                            },
                            icon: Image.asset(
                              "assets/images/profile_arrow.png",
                            )),
          
                      ],
                    ),
                    const Expanded(child: Divider(thickness: 1,color:AppTheme.gray2)),
                  ],
                ),
              ),
          
            ],
          ),),),),
        ],
      ),
    );
  }
} // end of statlessWidget