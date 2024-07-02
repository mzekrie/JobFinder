import 'package:flutter/material.dart';
import '../../model/shared/colors_theme.dart';
import '../../router/router.dart';
import '../widget/default_button.dart';
import '../widget/default_text_field.dart';

class RegisterWorkTypeScreen extends StatefulWidget {
  const RegisterWorkTypeScreen({super.key});

  @override
  State<RegisterWorkTypeScreen> createState() => _RegisterWorkTypeScreenState();
}

class _RegisterWorkTypeScreenState extends State<RegisterWorkTypeScreen> {
  Color boxColor = AppTheme.grayGP;
  Color boxColor_BG = AppTheme.whiteGP;
  bool isSelect1=false;
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
                  padding: const EdgeInsets.only(top: 0, left: 20, right: 20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      SizedBox(
                        height: height * 0.13,
                      ),
                      const DefaultText(
                        text: "What type of work are you interested in?",
                        color: AppTheme.blackGP,
                        fontSize: 30,
                        fontWeight: FontWeight.bold,
                      ),
                      const DefaultText(
                        text:
                            "Tell us what you’re interested in so we can customise the app for your needs.",
                        color: AppTheme.grayGP,
                        fontSize: 20,
                        fontWeight: FontWeight.normal,
                      ),
                      SizedBox(
                        height: height * 0.01,
                      ),

                      // list of choices items
                      Row(
                          children: [
                            InkWell(

                            onLongPress: (){
                              setState(() {
                                boxColor = AppTheme.blueButtonGP;
                                boxColor_BG = AppTheme.blueLightGP;
                              });
                              print('x');
                            },
                            child: Ink(
                                width: width*0.42,
                                height: width*0.32,
                                decoration: BoxDecoration(
                                  color: boxColor_BG,
                                  border: Border.all(color: boxColor),
                                  borderRadius: const BorderRadius.all(Radius.circular(10)),
                                ),
                                child: Padding(
                                  padding: const EdgeInsets.all(10.0),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      Image.asset("assets/images/job_finder_1.png"),
                                      SizedBox(height: height*0.01,),
                                      Text("UI/UX Designer", style: TextStyle(fontSize: 16, fontWeight: FontWeight.normal, color: boxColor),),
                                    ],
                                  ),
                                )
                            ),
                          ),
                          SizedBox(width: 0.02 * width,),
                          InkWell(
                            onLongPress: (){
                              setState(() {
                                boxColor = AppTheme.blueButtonGP;
                                boxColor_BG = AppTheme.blueLightGP;
                              });
                              print('x');
                            },
                            child: Ink(
                                width: width*0.42,
                                height: width*0.32,
                                decoration: BoxDecoration(
                                  color: boxColor_BG,
                                  border: Border.all(color: boxColor),
                                  borderRadius: const BorderRadius.all(Radius.circular(10)),
                                ),
                                child: Padding(
                                  padding: const EdgeInsets.all(10.0),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      Image.asset("assets/images/job_finder_2.png"),
                                      SizedBox(height: height*0.01,),
                                      Text("Ilustrator Designer", style: TextStyle(fontSize: 16, fontWeight: FontWeight.normal, color: boxColor),),
                                    ],
                                  ),
                                )
                            ),
                          ),


                        ],
                      ),
                      SizedBox(height: 0.02 * width,),
                      Row (
                        children:[
                          InkWell(
                            onLongPress: (){
                              setState(() {
                                boxColor = AppTheme.blueButtonGP;
                                boxColor_BG = AppTheme.blueLightGP;
                              });
                              print('x');
                            },
                            child: Ink(
                                width: width*0.42,
                                height: width*0.32,
                                decoration: BoxDecoration(
                                  color: boxColor_BG,
                                  border: Border.all(color: boxColor),
                                  borderRadius: const BorderRadius.all(Radius.circular(10)),
                                ),
                                child: Padding(
                                  padding: const EdgeInsets.all(10.0),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      Image.asset("assets/images/job_finder_3.png"),
                                      SizedBox(height: height*0.01,),
                                      Text("Developer", style: TextStyle(fontSize: 16, fontWeight: FontWeight.normal, color: boxColor),),
                                    ],
                                  ),
                                )
                            ),
                          ),
                          SizedBox(width: 0.02 * width,),
                          InkWell(
                            onLongPress: (){
                              setState(() {
                                boxColor = AppTheme.blueButtonGP;
                                boxColor_BG = AppTheme.blueLightGP;
                              });
                              print('x');
                            },
                            child: Ink(
                                width: width*0.42,
                                height: width*0.32,
                                decoration: BoxDecoration(
                                  color: boxColor_BG,
                                  border: Border.all(color: boxColor),
                                  borderRadius: const BorderRadius.all(Radius.circular(10)),
                                ),
                                child: Padding(
                                  padding: const EdgeInsets.all(10.0),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      Image.asset("assets/images/job_finder_4.png"),
                                      SizedBox(height: height*0.01,),
                                      Text("Management", style: TextStyle(fontSize: 16, fontWeight: FontWeight.normal, color: boxColor),),
                                    ],
                                  ),
                                )
                            ),
                          ),
                        ]
                      ),
                      SizedBox(height: 0.02 * width,),
                      Row (
                          children:[
                            InkWell(
                              onLongPress: (){
                                setState(() {
                                  boxColor = AppTheme.blueButtonGP;
                                  boxColor_BG = AppTheme.blueLightGP;
                                });
                                print('x');
                              },
                              child: Ink(
                                  width: width*0.42,
                                  height: width*0.32,
                                  decoration: BoxDecoration(
                                    color: boxColor_BG,
                                    border: Border.all(color: boxColor),
                                    borderRadius: const BorderRadius.all(Radius.circular(10)),
                                  ),
                                  child: Padding(
                                    padding: const EdgeInsets.all(10.0),
                                    child: Column(
                                      mainAxisAlignment: MainAxisAlignment.start,
                                      children: [
                                        Image.asset("assets/images/job_finder_5.png"),
                                        SizedBox(height: height*0.01,),
                                        Text("Information Technology", style: TextStyle(fontSize: 16, fontWeight: FontWeight.normal, color: boxColor),),
                                      ],
                                    ),
                                  )
                              ),
                            ),
                            SizedBox(width: 0.02 * width,),
                            InkWell(
                              onLongPress: (){
                                setState(() {
                                  boxColor = AppTheme.blueButtonGP;
                                  boxColor_BG = AppTheme.blueLightGP;
                                });
                                print('x');
                              },
                              child: Ink(
                                  width: width*0.42,
                                  height: width*0.32,
                                  decoration: BoxDecoration(
                                    color: boxColor_BG,
                                    border: Border.all(color: boxColor),
                                    borderRadius: const BorderRadius.all(Radius.circular(10)),
                                  ),
                                  child: Padding(
                                    padding: const EdgeInsets.all(10.0),
                                    child: Column(
                                      mainAxisAlignment: MainAxisAlignment.start,
                                      children: [
                                        Image.asset("assets/images/job_finder_6.png"),
                                        SizedBox(height: height*0.01,),
                                        Text("Research and Analytics", style: TextStyle(fontSize: 16, fontWeight: FontWeight.normal, color: boxColor),),
                                      ],
                                    ),
                                  )
                              ),
                            ),
                          ]
                      ),
                      Padding(
                        padding: const EdgeInsets.only(
                            top: 20, left: 20, right: 20),
                        child: defaultButton(
                            text: 'Next',
                            width: 0.8*width,
                            height: 0.08*height,
                            radius: 40,
                            backGround: AppTheme.blueButtonGP,
                            function: () async {
                              Navigator.of(context).pushNamedAndRemoveUntil(
                                  AppRoute.registerWorkLocationScreen, (route) => false);
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
