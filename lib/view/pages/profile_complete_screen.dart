import 'package:flutter/material.dart';
import '../../model/shared/colors_theme.dart';
import '../../router/router.dart';
import 'package:pie_chart/pie_chart.dart';

import '../widget/default_text_field.dart';


class CompleteProfileScreen extends StatefulWidget {
  const CompleteProfileScreen({super.key});

  @override
  State<CompleteProfileScreen> createState() => _CompleteProfileScreenState();
}
class _CompleteProfileScreenState extends State<CompleteProfileScreen> {
  Map<String, double> dataMap = {
    "Completed": 2,
    "Incomplete": 2,
  };

  List<Color> colorList = [
    // blue
    const Color(0xff3366ff),
 // gray
   const Color(0xffe5e7eb),

  ];

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            onPressed: () {
              Navigator.of(context).popAndPushNamed(AppRoute.homeScreen);
            },
            icon: Image.asset(
              "assets/images/arrow-left.png",
            )),
        centerTitle: true,
        title: const Text(
          "Complete Profile",
        ),

      ),
      body:
      SingleChildScrollView(
        child: Container(
          color: AppTheme. whiteGP,
          width: double.maxFinite,
          padding: const EdgeInsets.all(10),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisSize: MainAxisSize.max,
        
            children: [
              SizedBox(height: 0.02* height),
              PieChart(
                dataMap: dataMap,
                centerWidget: Container(color: AppTheme. whiteGP, child: const DefaultText(
          text: " 50%",
          color: AppTheme.blueButtonGP,
          fontSize: 40,
          fontWeight: FontWeight.normal,
          ),),
                animationDuration: const Duration(milliseconds: 800),
                chartLegendSpacing: 30,
                chartRadius: MediaQuery.of(context).size.width / 3,
                colorList: colorList,
                initialAngleInDegree: 0,
                chartType: ChartType.ring,
                ringStrokeWidth: 10,
                centerText: "HYBRID",
                legendOptions: const LegendOptions(
                  showLegendsInRow: false,
                  legendPosition: LegendPosition.right,
                  showLegends: true,
                  //legendShape: _BoxShape.circle,
                  legendTextStyle: TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                chartValuesOptions: const ChartValuesOptions(
                  showChartValueBackground: true,
                  showChartValues: false,
                  showChartValuesInPercentage: true,
                  showChartValuesOutside: true,
                  decimalPlaces: 1,
        
                ),
                // gradientList: ---To add gradient colors---
                // emptyColorGradient: ---Empty Color gradient---
              ),
              SizedBox(height: 0.02* height),
        
              const DefaultText(
                text: " 2/4 Completed",
                color: AppTheme.blueButtonGP,
                fontSize: 30,
                fontWeight: FontWeight.normal,
              ),
              const DefaultText(
                text: "Complete your profile before applying for a job",
                color: AppTheme.grayGP,
                fontSize: 15,
                fontWeight: FontWeight.normal,
              ),
        SizedBox(height: height * 0.02,),
              Container(
                height: height * 0.12,
                padding: const EdgeInsets.all(8),
                decoration: BoxDecoration(
                    border: Border.all(
                      width: 1,
                      color: AppTheme
                          .blueButtonGP, //                   <--- border width here
                    ),
                    borderRadius: BorderRadius.circular(10),
                  color:  AppTheme.profile_baby_blue),
        
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Image.asset("assets/images/tick_bluee.png"),
                    SizedBox(
                      width: width * 0.04,
                    ),
                    SizedBox(
                      width: 0.6* width,
                      child:const Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          DefaultText(
                            text: "Personal Details",
                            color: AppTheme.blackGP,
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                          DefaultText(
                            text: "Full name, email, phone number, and your address",
                            color: AppTheme.grayGP,
                            fontSize: 14,
                            fontWeight: FontWeight.normal,
                          ),
                        ],
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
                )),
              SizedBox(height: height * 0.02,),
              Container(
                  height: height * 0.12,
                  padding: const EdgeInsets.all(8),
                  decoration: BoxDecoration(
                      border: Border.all(
                        width: 1,
                        color: AppTheme
                            .blueButtonGP, //                   <--- border width here
                      ),
                      borderRadius: BorderRadius.circular(10),
                      color:  AppTheme.profile_baby_blue),
        
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Image.asset("assets/images/tick_bluee.png"),
                      SizedBox(
                        width: width * 0.04,
                      ),
                      SizedBox(
                        width: 0.6* width,
                        child:const Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            DefaultText(
                              text: "Education",
                              color: AppTheme.blackGP,
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                            ),
                            DefaultText(
                              text: "Enter your educational history to be considered by the recruiter",
                              color: AppTheme.grayGP,
                              fontSize: 14,
                              fontWeight: FontWeight.normal,
                            ),
                          ],
                        ),
                      ),
                      IconButton(
                          onPressed: () {
                            Navigator.of(context).pushNamedAndRemoveUntil(
                                AppRoute.profileEducationScreen, (route) => true);
                          },
                          icon: Image.asset(
                            "assets/images/profile_arrow.png",
                          )),
        
                    ],
                  )),
              SizedBox(height: height * 0.02,),
              Container(
                  height: height * 0.12,
                  padding: const EdgeInsets.all(8),
                  decoration: BoxDecoration(
                      border: Border.all(
                        width: 1,
                        color: AppTheme
                            .blueButtonGP, //                   <--- border width here
                      ),
                      borderRadius: BorderRadius.circular(10),
                      color:  AppTheme.chat_bg_text2_gray),
        
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Image.asset("assets/images/tick_gray.png"),
                      SizedBox(
                        width: width * 0.04,
                      ),
                      SizedBox(
                        width: 0.6* width,
                        child:const Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            DefaultText(
                              text: "Experience",
                              color: AppTheme.blackGP,
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                            ),
                            DefaultText(
                              text: "Enter your work experience to be considered by the recruiter",
                              color: AppTheme.grayGP,
                              fontSize: 14,
                              fontWeight: FontWeight.normal,
                            ),
                          ],
                        ),
                      ),
                      IconButton(
                          onPressed: () {
                            Navigator.of(context).pushNamedAndRemoveUntil(
                                AppRoute.profileExperienceScreen, (route) => true);
                          },
                          icon: Image.asset(
                            "assets/images/profile_arrow.png",
                          )),
        
                    ],
                  )),
              SizedBox(height: height * 0.02,),
              Container(
                  height: height * 0.12,
                  padding: const EdgeInsets.all(8),
                  decoration: BoxDecoration(
                      border: Border.all(
                        width: 1,
                        color: AppTheme
                            .blueButtonGP, //                   <--- border width here
                      ),
                      borderRadius: BorderRadius.circular(10),
                      color:  AppTheme.chat_bg_text2_gray),
        
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Image.asset("assets/images/tick_gray.png"),
                      SizedBox(
                        width: width * 0.04,
                      ),
                      SizedBox(
                        width: 0.6* width,
                        child:const Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                             DefaultText(
                              text: "Portfolio",
                              color: AppTheme.blackGP,
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                            ),
                             DefaultText(
                              text: "Create your portfolio. Applying for various types of jobs is easier.",
                              color: AppTheme.grayGP,
                              fontSize: 14,
                              fontWeight: FontWeight.normal,
                            ),
                          ],
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
                  )),
        
        
            ],
          ),
        ),
      ),
    );
  }
} // end of statlessWidget
