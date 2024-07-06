import 'dart:io';

import 'package:flutter/material.dart';
import 'package:gp_amit60_mary_zekrie/model/shared/cache_helper.dart';
import 'package:gp_amit60_mary_zekrie/model/shared/enum.dart';
import '../../model/shared/colors_theme.dart';
import '../../model/shared/constant_attribute.dart';
import '../../router/router.dart';
import '../widget/default_text_field.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
    @override
   void initState() {
  //   // TODO: implement initState
      //LoginCubit.get(context).getUser();
     super.initState();
  //   ProfileCubit.get(context).getProfileDataAll();
   }

    @override
    Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppTheme.profile_baby_blue,
        leading: IconButton(
            onPressed: () {
              Navigator.of(context).pushNamedAndRemoveUntil(AppRoute.homeScreen, (route) => false);
            },
            icon: Image.asset(
              "assets/images/arrow-left.png",
            )),
        centerTitle: true,
        title: const Text(
          "Profile",
        ),
        actions: [
          IconButton(
              onPressed: () {
                CacheHelper.putBOOL(key: SharedKeys.rememberMeLogin, value: false);
                Navigator.of(context).popAndPushNamed(AppRoute.loginScreen);
              },
              icon: Image.asset(
                "assets/images/logout.png",
              )),
        ],
      ),

      body:
       SingleChildScrollView(
         child: Container(
          color: AppTheme.whiteGP,
          padding: const EdgeInsets.symmetric(horizontal: 20),
          height: height*2,
          child:  Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisSize: MainAxisSize.max,
            children: [
              Stack(
                  children: [
                    Image.asset(
                      "assets/images/profile_bluw.png",
                    ),
                    Center(
                      child:  CircleAvatar(
                        minRadius: 60,
                        backgroundImage: userImage == null? const AssetImage(
                            "assets/images/Profile.png",) : FileImage (File(userImage!.path)),
                      ),

                    ),
                  ],
                ),


               DefaultText(
                text: (CacheHelper.getString(key: SharedKeys.name)),
                color: AppTheme.blackGP,
                fontSize: 20,
                fontWeight: FontWeight.normal,
              ),
              const  DefaultText(
                text: "Senior UI/UX Designer",
                color: AppTheme.grayGP,
                fontSize: 15,
                fontWeight: FontWeight.normal,
              ),
              SizedBox(
                height: height * 0.02,
              ),
              /// KPI count
              Container(
                height: height * 0.08,
                width: width * 0.8,
                color: AppTheme.profile_baby_blue,
                child: const Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        DefaultText(
                          text: "Applied",
                          color: AppTheme.grayGP,
                          fontSize: 15,
                          fontWeight: FontWeight.normal,
                        ),
                        DefaultText(
                          text: "47",
                          color: AppTheme.blackGP,
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ],
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    VerticalDivider(
                      thickness: 2,
                      color: AppTheme.gray,
                      indent: 10,
                      endIndent: 10,
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        DefaultText(
                          text: "Reviewed",
                          color: AppTheme.grayGP,
                          fontSize: 15,
                          fontWeight: FontWeight.normal,
                        ),
                        DefaultText(
                          text: "47",
                          color: AppTheme.blackGP,
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ],
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    VerticalDivider(
                      thickness: 2,
                      color: AppTheme.gray,
                      indent: 10,
                      endIndent: 10,
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        DefaultText(
                          text: "Contacted",
                          color: AppTheme.grayGP,
                          fontSize: 15,
                          fontWeight: FontWeight.normal,
                        ),
                        DefaultText(
                          text: "06",
                          color: AppTheme.blackGP,
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: height * 0.02,
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    width: 0.5* width,
                    child: const DefaultText(
                      text: "About",
                      color: AppTheme.blackGP,
                      fontSize: 17,
                      fontWeight: FontWeight.normal,
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      Navigator.of(context).pushNamedAndRemoveUntil(
                          AppRoute.completeProfileScreen, (route) => true);
                    },
                    child: const Text(
                      " Complete Profile",
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 15,
                          color: AppTheme.blueButtonGP),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: height * 0.02,
              ),
              const DefaultText(
                text: "some text will come here from the API Aboutsome text will come here from the API Aboutsome text will come here from the API Aboutsome text will come here from the API Aboutsome text will come here from the API Aboutsome text will come here from the API Aboutsome text will come here from the API About",
                //text:"${widget.profileItem.bio}",
                color: AppTheme.grayGP,
                fontSize: 15,
                fontWeight: FontWeight.normal,
              ),
              SizedBox(
                height: height * 0.02,
              ),
              Container(
                padding: const EdgeInsets.all(4),
                width: double.infinity,
                color: AppTheme.chat_bg_text2_gray,
                child: const  DefaultText(
                  text: "General",
                  color: AppTheme.blackGP,
                  fontSize: 17,
                  fontWeight: FontWeight.normal,
                ),
              ),
              /// options of profile ( menu)
              SizedBox(
                height: height * 0.02,),

              SizedBox(
                height: height * 0.07,
                child: Column(
                  children: [
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Image.asset("assets/images/profile_edit.png"),
                        SizedBox(
                          width: width * 0.02,
                        ),
                        SizedBox(
                          width: 0.6* width,
                          child:const DefaultText(
                            text: "Edit Profile",
                            color: AppTheme.blackGP,
                            fontSize: 15,
                            fontWeight: FontWeight.normal,
                          ),
                        ),
                        IconButton(
                            onPressed: () {
                              Navigator.of(context).pushNamedAndRemoveUntil(
                                  AppRoute.profileEditScreen, (route) => true);
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
                        Image.asset("assets/images/profile_portfolio.png"),
                        SizedBox(
                          width: width * 0.02,
                        ),
                        SizedBox(
                          width: 0.6* width,
                          child:const DefaultText(
                            text: "Portfolio",
                            color: AppTheme.blackGP,
                            fontSize: 15,
                            fontWeight: FontWeight.normal,
                          ),
                        ),
                        IconButton(
                            onPressed: () {
                              Navigator.of(context).pushNamedAndRemoveUntil(
                                  AppRoute.portfolioScreen, (route) => true);
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
                        Image.asset("assets/images/profile_lang.png"),
                        SizedBox(
                          width: width * 0.02,
                        ),
                        SizedBox(
                          width: 0.6* width,
                          child:const DefaultText(
                            text: "Language",
                            color: AppTheme.blackGP,
                            fontSize: 15,
                            fontWeight: FontWeight.normal,
                          ),
                        ),
                        IconButton(
                            onPressed: () {
                              Navigator.of(context).pushNamedAndRemoveUntil(
                                  AppRoute.settingsLanguageScreen, (route) => true);
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
                        Image.asset("assets/images/profile_notification.png"),
                        SizedBox(
                          width: width * 0.02,
                        ),
                        SizedBox(
                          width: 0.6* width,
                          child:const DefaultText(
                            text: "Notification",
                            color: AppTheme.blackGP,
                            fontSize: 15,
                            fontWeight: FontWeight.normal,
                          ),
                        ),
                        IconButton(
                            onPressed: () {
                              Navigator.of(context).pushNamedAndRemoveUntil(
                                  AppRoute.settingsNotificationScreen, (route) => true);
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
                        Image.asset("assets/images/profile_security.png"),
                        SizedBox(
                          width: width * 0.02,
                        ),
                        SizedBox(
                          width: 0.6* width,
                          child:const DefaultText(
                            text: "Login and Security",
                            color: AppTheme.blackGP,
                            fontSize: 15,
                            fontWeight: FontWeight.normal,
                          ),
                        ),
                        IconButton(
                            onPressed: () {
                              Navigator.of(context).pushNamedAndRemoveUntil(
                                  AppRoute.settingsSecurityScreen, (route) => true);
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
                height: height * 0.02,
              ),
              /// others options

               Container(
                  padding: const EdgeInsets.all(4),
                  width: double.infinity,
                  color: AppTheme.chat_bg_text2_gray,
                  child:  const DefaultText(
                    text: "Others",
                    color: AppTheme.blackGP,
                    fontSize: 17,
                    fontWeight: FontWeight.normal,
                  ),
                ),

              SizedBox(
                height: height * 0.02,),
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
                            text: "Accesibility",
                            color: AppTheme.blackGP,
                            fontSize: 15,
                            fontWeight: FontWeight.normal,
                          ),
                        ),
                        IconButton(
                            onPressed: () {
                              Navigator.of(context).pushNamedAndRemoveUntil(
                                  AppRoute.profileEditScreen, (route) => true);
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
                            text: "Help Center",
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
                            text: "Terms & Conditions",
                            color: AppTheme.blackGP,
                            fontSize: 15,
                            fontWeight: FontWeight.normal,
                          ),
                        ),
                        IconButton(
                            onPressed: () {
                              Navigator.of(context).pushNamedAndRemoveUntil(
                                  AppRoute.termsConditionsScreen, (route) => true);
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
                            text: "Privacy Policy",
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
          ),
               ),
       ),

    );
  }

} // end of class
