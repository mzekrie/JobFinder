import 'package:flutter/material.dart';
import 'package:gp_amit60_mary_zekrie/model/user_profile_model.dart';
import '../../model/shared/colors_theme.dart';
import '../../router/router.dart';
import '../widget/default_text_field.dart';

class BuilderProfile extends StatefulWidget {
  //Profile profileItem;
  BuilderProfile({super.key});
  //BuilderProfile({super.key, required this.profileItem});
  @override
  State<BuilderProfile> createState() => _BuilderProfileState();
}

class _BuilderProfileState extends State<BuilderProfile> {
  // make the object required
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;

    /// to control tabs
    return Container(
      color: Colors.black,
      height: 100,
      width: 100,
    );
    // return Container(
    //   color: AppTheme.whiteGP,
    //   padding: EdgeInsets.symmetric(horizontal: 20),
    //   height: height*1.5,
    //   //height: MediaQuery.of(context).size.height,
    //   child: Column(
    //     crossAxisAlignment: CrossAxisAlignment.center,
    //     mainAxisSize: MainAxisSize.min,
    //     children: [
    //       Flexible(
    //         child: Stack(
    //           children: [
    //             Image.asset(
    //               "assets/images/profile_bluw.png",
    //             ),
    //             Padding(
    //               padding: const EdgeInsets.only(top: 15, left: 15),
    //               child: CircleAvatar(
    //                 minRadius:10,
    //                 child: Image.asset(
    //                   "${widget.profileItem.image}",
    //                   width: 200,
    //                   height: 200,
    //                 ),
    //                 //child: Image.asset("assets/images/Profile.png",),
    //               ),
    //             ),
    //           ],
    //         ),
    //       ),
    //
    //       DefaultText(
    //         text: "${widget.profileItem.name}",
    //         color: AppTheme.blackGP,
    //         fontSize: 20,
    //         fontWeight: FontWeight.normal,
    //       ),
    //
    //       DefaultText(
    //         text: "Senior UI/UX Designer",
    //         color: AppTheme.grayGP,
    //         fontSize: 15,
    //         fontWeight: FontWeight.normal,
    //       ),
    //       SizedBox(
    //         height: height * 0.02,
    //       ),
    //
    //       /// KPI count
    //       Flexible(child: Container(
    //         height: height * 0.08,
    //         width: width * 0.8,
    //         color: AppTheme.grayLightGP,
    //         child: const Row(
    //           crossAxisAlignment: CrossAxisAlignment.center,
    //           mainAxisAlignment: MainAxisAlignment.center,
    //           children: [
    //             Column(
    //               crossAxisAlignment: CrossAxisAlignment.center,
    //               mainAxisAlignment: MainAxisAlignment.center,
    //               children: [
    //                 DefaultText(
    //                   text: "Applied",
    //                   color: AppTheme.grayGP,
    //                   fontSize: 15,
    //                   fontWeight: FontWeight.normal,
    //                 ),
    //                 DefaultText(
    //                   text: "47",
    //                   color: AppTheme.blackGP,
    //                   fontSize: 20,
    //                   fontWeight: FontWeight.bold,
    //                 ),
    //               ],
    //             ),
    //             SizedBox(
    //               width: 10,
    //             ),
    //             VerticalDivider(
    //               thickness: 2,
    //               color: AppTheme.gray,
    //               indent: 10,
    //               endIndent: 10,
    //             ),
    //             SizedBox(
    //               width: 10,
    //             ),
    //             Column(
    //               crossAxisAlignment: CrossAxisAlignment.center,
    //               mainAxisAlignment: MainAxisAlignment.center,
    //               children: [
    //                 DefaultText(
    //                   text: "Reviewed",
    //                   color: AppTheme.grayGP,
    //                   fontSize: 15,
    //                   fontWeight: FontWeight.normal,
    //                 ),
    //                 DefaultText(
    //                   text: "47",
    //                   color: AppTheme.blackGP,
    //                   fontSize: 20,
    //                   fontWeight: FontWeight.bold,
    //                 ),
    //               ],
    //             ),
    //             SizedBox(
    //               width: 10,
    //             ),
    //             VerticalDivider(
    //               thickness: 2,
    //               color: AppTheme.gray,
    //               indent: 10,
    //               endIndent: 10,
    //             ),
    //             SizedBox(
    //               width: 10,
    //             ),
    //             Column(
    //               crossAxisAlignment: CrossAxisAlignment.center,
    //               mainAxisAlignment: MainAxisAlignment.center,
    //               children: [
    //                 DefaultText(
    //                   text: "Contacted",
    //                   color: AppTheme.grayGP,
    //                   fontSize: 15,
    //                   fontWeight: FontWeight.normal,
    //                 ),
    //                 DefaultText(
    //                   text: "06",
    //                   color: AppTheme.blackGP,
    //                   fontSize: 20,
    //                   fontWeight: FontWeight.bold,
    //                 ),
    //               ],
    //             ),
    //           ],
    //         ),
    //       ),),
    //       SizedBox(
    //         height: height * 0.02,
    //       ),
    //       Row(
    //         crossAxisAlignment: CrossAxisAlignment.start,
    //         children: [
    //           SizedBox(
    //             width: 0.8* width,
    //             child: DefaultText(
    //               text: "About",
    //               color: AppTheme.blackGP,
    //               fontSize: 17,
    //               fontWeight: FontWeight.normal,
    //             ),
    //           ),
    //           InkWell(
    //             onTap: () {
    //               Navigator.of(context)
    //                   .pushReplacementNamed("profileEditScreen");
    //             },
    //             child: const Text(
    //               " Edit",
    //               style: TextStyle(
    //                   fontWeight: FontWeight.bold,
    //                   fontSize: 15,
    //                   color: AppTheme.blueButtonGP),
    //             ),
    //           ),
    //         ],
    //       ),
    //       SizedBox(
    //         height: height * 0.02,
    //       ),
    //       DefaultText(
    //         //text: "some text will come here from the API Aboutsome text will come here from the API Aboutsome text will come here from the API Aboutsome text will come here from the API Aboutsome text will come here from the API Aboutsome text will come here from the API Aboutsome text will come here from the API About",
    //         text:"${widget.profileItem.bio}",
    //         color: AppTheme.grayGP,
    //         fontSize: 15,
    //         fontWeight: FontWeight.normal,
    //       ),
    //       SizedBox(
    //         height: height * 0.02,
    //       ),
    //
    //       Container(
    //         height: height * 0.05,
    //         width: double.infinity,
    //         color: AppTheme.grayLightGP,
    //         child:  DefaultText(
    //           text: "General",
    //           color: AppTheme.blackGP,
    //           fontSize: 17,
    //           fontWeight: FontWeight.normal,
    //         ),
    //       ),
    //       /// options of profile ( menu)
    //       SizedBox(
    //         height: height * 0.02,),
    //
    //       SizedBox(
    //         height: height * 0.08,
    //         child: Column(
    //           children: [
    //             Row(
    //               crossAxisAlignment: CrossAxisAlignment.center,
    //               mainAxisAlignment: MainAxisAlignment.start,
    //               children: [
    //                 Image.asset("assets/images/profile_edit.png"),
    //                 SizedBox(
    //                   width: width * 0.02,
    //                 ),
    //                 SizedBox(
    //                   width: 0.6* width,
    //                   child:DefaultText(
    //                     text: "Edit Profile",
    //                     color: AppTheme.blackGP,
    //                     fontSize: 15,
    //                     fontWeight: FontWeight.normal,
    //                   ),
    //                 ),
    //                 IconButton(
    //                     onPressed: () {
    //                       Navigator.of(context).pushNamedAndRemoveUntil(
    //                           AppRoute.profileEditScreen, (route) => true);
    //                     },
    //                     icon: Image.asset(
    //                       "assets/images/profile_arrow.png",
    //                     )),
    //
    //               ],
    //             ),
    //             Expanded(child: Divider(thickness: 1,color:AppTheme.gray2)),
    //           ],
    //         ),
    //       ),
    //       SizedBox(
    //         height: height * 0.08,
    //         child: Column(
    //           children: [
    //             Row(
    //               crossAxisAlignment: CrossAxisAlignment.center,
    //               mainAxisAlignment: MainAxisAlignment.start,
    //               children: [
    //                 Image.asset("assets/images/profile_portfolio.png"),
    //                 SizedBox(
    //                   width: width * 0.02,
    //                 ),
    //                 SizedBox(
    //                   width: 0.6* width,
    //                   child:DefaultText(
    //                     text: "Portfolio",
    //                     color: AppTheme.blackGP,
    //                     fontSize: 15,
    //                     fontWeight: FontWeight.normal,
    //                   ),
    //                 ),
    //                 IconButton(
    //                     onPressed: () {
    //                       Navigator.of(context).pushNamedAndRemoveUntil(
    //                           AppRoute.portfolioScreen, (route) => true);
    //                     },
    //                     icon: Image.asset(
    //                       "assets/images/profile_arrow.png",
    //                     )),
    //
    //               ],
    //             ),
    //             Expanded(child: Divider(thickness: 1,color:AppTheme.gray2)),
    //           ],
    //         ),
    //       ),
    //       SizedBox(
    //         height: height * 0.08,
    //         child: Column(
    //           children: [
    //             Row(
    //               crossAxisAlignment: CrossAxisAlignment.center,
    //               mainAxisAlignment: MainAxisAlignment.start,
    //               children: [
    //                 Image.asset("assets/images/profile_lang.png"),
    //                 SizedBox(
    //                   width: width * 0.02,
    //                 ),
    //                 SizedBox(
    //                   width: 0.6* width,
    //                   child:DefaultText(
    //                     text: "Language",
    //                     color: AppTheme.blackGP,
    //                     fontSize: 15,
    //                     fontWeight: FontWeight.normal,
    //                   ),
    //                 ),
    //                 IconButton(
    //                     onPressed: () {
    //                       Navigator.of(context).pushNamedAndRemoveUntil(
    //                           AppRoute.settingsLanguageScreen, (route) => true);
    //                     },
    //                     icon: Image.asset(
    //                       "assets/images/profile_arrow.png",
    //                     )),
    //
    //               ],
    //             ),
    //             Expanded(child: Divider(thickness: 1,color:AppTheme.gray2)),
    //           ],
    //         ),
    //       ),
    //       SizedBox(
    //         height: height * 0.08,
    //         child: Column(
    //           children: [
    //             Row(
    //               crossAxisAlignment: CrossAxisAlignment.center,
    //               mainAxisAlignment: MainAxisAlignment.start,
    //               children: [
    //                 Image.asset("assets/images/profile_notification.png"),
    //                 SizedBox(
    //                   width: width * 0.02,
    //                 ),
    //                 SizedBox(
    //                   width: 0.6* width,
    //                   child:DefaultText(
    //                     text: "Notification",
    //                     color: AppTheme.blackGP,
    //                     fontSize: 15,
    //                     fontWeight: FontWeight.normal,
    //                   ),
    //                 ),
    //                 IconButton(
    //                     onPressed: () {
    //                       Navigator.of(context).pushNamedAndRemoveUntil(
    //                           AppRoute.settingsNotificationScreen, (route) => true);
    //                     },
    //                     icon: Image.asset(
    //                       "assets/images/profile_arrow.png",
    //                     )),
    //
    //               ],
    //             ),
    //             Expanded(child: Divider(thickness: 1,color:AppTheme.gray2)),
    //           ],
    //         ),
    //       ),
    //       SizedBox(
    //         height: height * 0.08,
    //         child: Column(
    //           children: [
    //             Row(
    //               crossAxisAlignment: CrossAxisAlignment.center,
    //               mainAxisAlignment: MainAxisAlignment.start,
    //               children: [
    //                 Image.asset("assets/images/profile_security.png"),
    //                 SizedBox(
    //                   width: width * 0.02,
    //                 ),
    //                 SizedBox(
    //                   width: 0.6* width,
    //                   child:DefaultText(
    //                     text: "Login and Security",
    //                     color: AppTheme.blackGP,
    //                     fontSize: 15,
    //                     fontWeight: FontWeight.normal,
    //                   ),
    //                 ),
    //                 IconButton(
    //                     onPressed: () {
    //                       Navigator.of(context).pushNamedAndRemoveUntil(
    //                           AppRoute.settingsSecurityScreen, (route) => true);
    //                     },
    //                     icon: Image.asset(
    //                       "assets/images/profile_arrow.png",
    //                     )),
    //
    //               ],
    //             ),
    //             Expanded(child: Divider(thickness: 1,color:AppTheme.gray2)),
    //           ],
    //         ),
    //       ),
    //       SizedBox(
    //         height: height * 0.02,
    //       ),
    //       /// others options
    //       Container(
    //         height: height * 0.05,
    //         width: double.infinity,
    //         color: AppTheme.grayLightGP,
    //         child:  DefaultText(
    //           text: "Others",
    //           color: AppTheme.blackGP,
    //           fontSize: 17,
    //           fontWeight: FontWeight.normal,
    //         ),
    //       ),
    //       SizedBox(
    //         height: height * 0.02,),
    //       SizedBox(
    //         height: height * 0.08,
    //         child: Column(
    //           children: [
    //             Row(
    //               crossAxisAlignment: CrossAxisAlignment.center,
    //               mainAxisAlignment: MainAxisAlignment.start,
    //               children: [
    //
    //                 SizedBox(
    //                   width: 0.7* width,
    //                   child:DefaultText(
    //                     text: "Accesibility",
    //                     color: AppTheme.blackGP,
    //                     fontSize: 15,
    //                     fontWeight: FontWeight.normal,
    //                   ),
    //                 ),
    //                 IconButton(
    //                     onPressed: () {
    //                       Navigator.of(context).pushNamedAndRemoveUntil(
    //                           AppRoute.profileEditScreen, (route) => true);
    //                     },
    //                     icon: Image.asset(
    //                       "assets/images/profile_arrow.png",
    //                     )),
    //
    //               ],
    //             ),
    //             Expanded(child: Divider(thickness: 1,color:AppTheme.gray2)),
    //           ],
    //         ),
    //       ),
    //       //SizedBox(height: height * 0.02,),
    //       SizedBox(
    //         height: height * 0.08,
    //         child: Column(
    //           children: [
    //             Row(
    //               crossAxisAlignment: CrossAxisAlignment.center,
    //               mainAxisAlignment: MainAxisAlignment.start,
    //               children: [
    //
    //                 SizedBox(
    //                   width: 0.7* width,
    //                   child:DefaultText(
    //                     text: "Help Center",
    //                     color: AppTheme.blackGP,
    //                     fontSize: 15,
    //                     fontWeight: FontWeight.normal,
    //                   ),
    //                 ),
    //                 IconButton(
    //                     onPressed: () {
    //                       Navigator.of(context).pushNamedAndRemoveUntil(
    //                           AppRoute.helpCenterScreen, (route) => true);
    //                     },
    //                     icon: Image.asset(
    //                       "assets/images/profile_arrow.png",
    //                     )),
    //
    //               ],
    //             ),
    //             Expanded(child: Divider(thickness: 1,color:AppTheme.gray2)),
    //           ],
    //         ),
    //       ),
    //       // SizedBox(height: height * 0.02,),
    //       SizedBox(
    //         height: height * 0.08,
    //         child: Column(
    //           children: [
    //             Row(
    //               crossAxisAlignment: CrossAxisAlignment.center,
    //               mainAxisAlignment: MainAxisAlignment.start,
    //               children: [
    //
    //                 SizedBox(
    //                   width: 0.7* width,
    //                   child:DefaultText(
    //                     text: "Terms & Conditions",
    //                     color: AppTheme.blackGP,
    //                     fontSize: 15,
    //                     fontWeight: FontWeight.normal,
    //                   ),
    //                 ),
    //                 IconButton(
    //                     onPressed: () {
    //                       Navigator.of(context).pushNamedAndRemoveUntil(
    //                           AppRoute.termsConditionsScreen, (route) => true);
    //                     },
    //                     icon: Image.asset(
    //                       "assets/images/profile_arrow.png",
    //                     )),
    //
    //               ],
    //             ),
    //             Expanded(child: Divider(thickness: 1,color:AppTheme.gray2)),
    //           ],
    //         ),
    //       ),
    //       //SizedBox(height: height * 0.02,),
    //       SizedBox(
    //         height: height * 0.08,
    //         child: Column(
    //           children: [
    //             Row(
    //               crossAxisAlignment: CrossAxisAlignment.center,
    //               mainAxisAlignment: MainAxisAlignment.start,
    //               children: [
    //
    //                 SizedBox(
    //                   width: 0.7* width,
    //                   child:DefaultText(
    //                     text: "Privacy Policy",
    //                     color: AppTheme.blackGP,
    //                     fontSize: 15,
    //                     fontWeight: FontWeight.normal,
    //                   ),
    //                 ),
    //                 IconButton(
    //                     onPressed: () {
    //                       Navigator.of(context).pushNamedAndRemoveUntil(
    //                           AppRoute.privacyPolicyScreen, (route) => true);
    //                     },
    //                     icon: Image.asset(
    //                       "assets/images/profile_arrow.png",
    //                     )),
    //
    //               ],
    //             ),
    //             Expanded(child: Divider(thickness: 1,color:AppTheme.gray2)),
    //           ],
    //         ),
    //       ),
    //
    //     ],
    //   ),
    // );
  }
}
