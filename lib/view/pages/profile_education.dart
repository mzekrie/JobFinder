import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import '../../model/shared/colors_theme.dart';
import '../../model/shared/constant_attribute.dart';
import '../../router/router.dart';
import '../widget/default_button.dart';
import '../widget/default_form_field.dart';
import '../widget/default_text_field.dart';

class ProfileEducationScreen extends StatefulWidget {
  const ProfileEducationScreen({super.key});

  @override
  State<ProfileEducationScreen> createState() => _ProfileEducationScreenState();
}

class _ProfileEducationScreenState extends State<ProfileEducationScreen> {

  bool isUniveristyAdded = false;
  String? university;
  String? title;
  String? startYear;
  String? endYear;


  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            onPressed: () {
              Navigator.of(context).popAndPushNamed(AppRoute.completeProfileScreen);
              universityController.clear();
              titleController.clear();
              startYearController.clear();
              endYearController.clear();
            },
            icon: Image.asset(
              "assets/images/arrow-left.png",
            )),
        centerTitle: true,
        title: const Text(
          "Education ",
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              child: Form(
                key: formKeyEducation,
                child: Padding(
                  padding: const EdgeInsets.only(top: 0, left: 20, right: 20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      const DefaultText(
                        text: "University ",
                        color: AppTheme.blackGP,
                        fontSize: 15,
                        fontWeight: FontWeight.bold,
                      ),
                      SizedBox(height: 0.02 * height),
                      DefaultFormField(
                          radius: 10,
                          //prefixIcon: Image.asset("assets/images/login_username.png"),
                          backgroundColor: AppTheme.whiteGP,
                          controller: universityController,
                          keyboardType: TextInputType.text,
                          labelText: "enter university name ",
                          validator: (value) {
                            if (value!.isEmpty) {
                              return "University cannot be empty ";
                            }
                            else {
                              return null;
                            }
                          }),
                      SizedBox(height: 0.02 * height),
                      const DefaultText(
                        text: "Title ",
                        color: AppTheme.blackGP,
                        fontSize: 15,
                        fontWeight: FontWeight.bold,
                      ),
                      SizedBox(height: 0.02 * height),
                      DefaultFormField(
                          radius: 10,
                          //prefixIcon: Image.asset("assets/images/login_username.png"),
                          backgroundColor: AppTheme.whiteGP,
                          controller: titleController,
                          keyboardType: TextInputType.text,
                          labelText: "enter education type (e.g. Bachelor)",
                          validator: (value) {
                            if (value!.isEmpty) {
                              return "Title cannot be empty ";
                            }
                            else {
                              return null;
                            }
                          }),
                      SizedBox(height: 0.02 * height),
                      const DefaultText(
                        text: "Start Date ",
                        color: AppTheme.blackGP,
                        fontSize: 15,
                        fontWeight: FontWeight.bold,
                      ),
                      SizedBox(height: 0.02 * height),
                      DefaultFormField(
                          radius: 10,
                          suffixIcon: Icon(Icons.calendar_month_outlined) ,
                          backgroundColor: AppTheme.whiteGP,
                          controller: startYearController,
                          keyboardType: TextInputType.text,
                          labelText: "select date ",
                          onTap: (){
                            showDatePicker(
                              context: context,
                              initialDate: DateTime.now(), // start point
                              firstDate: DateTime(2000), // starting date
                              lastDate: DateTime.now(), // end date
                            ).then((value) {
                              startYearController.text = DateFormat.yMMMd().format(value!);
                            });
                          },
                          validator: (value) {
                            if (value!.isEmpty) {
                              return "date cannot be empty ";
                            }
                            else {
                              return null;
                            }
                          }
                ),

                      SizedBox(height: 0.02 * height),
                      const DefaultText(
                        text: "End Date ",
                        color: AppTheme.blackGP,
                        fontSize: 15,
                        fontWeight: FontWeight.bold,
                      ),
                      SizedBox(height: 0.02 * height),
                      DefaultFormField(
                          radius: 10,
                          suffixIcon: Icon(Icons.calendar_month_outlined) ,
                          backgroundColor: AppTheme.whiteGP,
                          controller: endYearController,
                          keyboardType: TextInputType.datetime,
                          labelText: "select date ",
                          onTap: (){

                              showDatePicker(
                                context: context,
                                initialDate: DateTime.now(), // start point
                                firstDate: DateTime(2000), // starting date
                                lastDate:  DateTime.parse("2027-05-13"), // end date
                              ).then((value) {
                                endYearController.text = DateFormat.yMMMd().format(value!);
                              });
                          },
                          validator: (value) {
                            if (value!.isEmpty) {
                              return "date cannot be empty ";
                            }
                            else {
                              return null;
                            }
                          }
                      ),

                      SizedBox(height: 0.04 * height,),
                      ///button
                      Padding(
                        padding: const EdgeInsets.all(20),
                        child: defaultButton(
                            text: 'Save',
                            radius: 25,
                            backGround: AppTheme.blueButtonGP,
                            function: () async {
                               if (formKeyEducation.currentState!.validate()) {

                                university = universityController.text;
                                title = titleController.text;
                                startYear = startYearController.text;
                                endYear =  endYearController.text;
                                //startYear = startYearController.text.split(" ")[0];
                                //endYear =  endYearController.text.split(" ")[0];

                                setState(() {
                                  isUniveristyAdded = true;
                                });

                                Fluttertoast.showToast(
                                    msg: "Saved Successfully!",
                                    toastLength: Toast.LENGTH_SHORT,
                                    gravity: ToastGravity.BOTTOM,
                                    timeInSecForIosWeb: 3,
                                    backgroundColor: Colors.green,
                                    textColor: Colors.white,
                                    fontSize: 16.0
                                );

                                universityController.clear();
                                titleController.clear();
                                startYearController.clear();
                                endYearController.clear();

                                  print ( isUniveristyAdded );
                                }
                              else{
                                return null;
                              }
                            }
                      ),),
                    ],
                  ),
                ),
              ),
            ),
            Center(
              child: Container(
                height: 0.1 * height ,
                width: 0.9* width,
                decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color:  AppTheme.profile_baby_blue),
                  child:Visibility(
                  //maintainSize: true,
                  //maintainAnimation: true,
                  //maintainState: true,
                  visible: isUniveristyAdded ,
                  replacement:Center(
                    child: DefaultText(
                      text : "No Data ",
                      color: AppTheme.blackGP,
                      fontSize: 17,
                      fontWeight: FontWeight.normal,
                    ),
                  ),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset("assets/images/education.png"),
                      SizedBox(width:width*0.03),
                      Container(
                        width:0.4*width,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            DefaultText(
                              text: "$university",
                              color: AppTheme.blackGP,
                              fontSize: 15,
                              fontWeight: FontWeight.bold,
                            ),
                            DefaultText(
                              text: "$title",
                              color: AppTheme.grayGP,
                              fontSize: 14,
                              fontWeight: FontWeight.normal,
                            ),
                            Row(
                              children: [
                                DefaultText(
                                  text: "$startYear",
                                  color: AppTheme.grayGP,
                                  fontSize: 12,
                                  fontWeight: FontWeight.normal,
                                ),
                        DefaultText(
                          text: "-- $endYear",
                          color: AppTheme.grayGP,
                          fontSize: 12,
                          fontWeight: FontWeight.normal,
                        ),

                              ],
                            ),

                          ],
                        ),
                      ),
                      SizedBox(width:width*0.02),
IconButton(onPressed: (){
  isUniveristyAdded = false;

  universityController.text =  university!;
  titleController.text = title!;
  startYearController.text= startYear!;
  endYearController.text= endYear!;

}, icon: Image.asset("assets/images/edit-2.png"),)


                    ],
                  ),
                ),
              
              ),
            )
          ],
        ),
      ),
    );
  } }



