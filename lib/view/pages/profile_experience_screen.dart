import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import '../../model/shared/colors_theme.dart';
import '../../model/shared/constant_attribute.dart';
import '../../router/router.dart';
import '../widget/default_button.dart';
import '../widget/default_form_field.dart';
import '../widget/default_text_field.dart';

class ProfileExperienceScreen extends StatefulWidget {
  const ProfileExperienceScreen({super.key});

  @override
  State<ProfileExperienceScreen> createState() => _ProfileExperienceScreenState();
}

class _ProfileExperienceScreenState extends State<ProfileExperienceScreen> {

  bool isExperienceAdded = false;
  String? position;
  String? companyName;
  String? location;
  String? startYear;
  String? endYear;
  bool _isEnded = false;


  /// drop down list
   List<String> workTypeList = [
      "-- select type--",
      "Remote",
      "Full Time",
      "Part Time",
    ]; // filter list
    String? selectedItem = "-- select type--"; // default value of the filter

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
              positionController.clear();
              locationController.clear();
              startYearExperienceController.clear();
              endYearExperienceController.clear();
              companyNameController.clear();
              selectedItem = "-- select type--";
            },
            icon: Image.asset(
              "assets/images/arrow-left.png",
            )),
        centerTitle: true,
        title: const Text(
          "Experience",
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Form(
              key: formKeyExperience,
              child: Padding(
                padding: const EdgeInsets.only(top: 0, left: 20, right: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const DefaultText(
                      text: "Position ",
                      color: AppTheme.blackGP,
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                    ),
                    SizedBox(height: 0.01 * height),
                    DefaultFormField(
                        radius: 10,
                        //prefixIcon: Image.asset("assets/images/login_username.png"),
                        backgroundColor: AppTheme.whiteGP,
                        controller: positionController,
                        keyboardType: TextInputType.text,
                        labelText: "enter position name ",
                        validator: (value) {
                          if (value!.isEmpty) {
                            return "Position cannot be empty ";
                          }
                          else {
                            return null;
                          }
                        }),
                    SizedBox(height: 0.01 * height),
                    const DefaultText(
                      text: "Type of Work  ",
                      color: AppTheme.blackGP,
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                    ),
                    /// drop down list type of work
                    ///
                    DropdownButtonFormField(
                      decoration: const InputDecoration(
                          enabledBorder: OutlineInputBorder(borderSide:
                          BorderSide ( color:AppTheme.grayGP, width:1) )
                      ),
                      value: selectedItem,
                      items: workTypeList
                          .map((item) => DropdownMenuItem(
                        value: item,
                        child:  DefaultText(
                          text: item,
                          color: AppTheme.grayGP,
                          fontSize: 15,
                          fontWeight: FontWeight.normal,
                        ),
                      ))
                          .toList(),
                      onChanged: (item) => setState(() {
                        selectedItem = item;
                      }),
                    ),
                    SizedBox(height: 0.01 * height),
                    const DefaultText(
                      text: "Company Name",
                      color: AppTheme.blackGP,
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                    ),
                    SizedBox(height: 0.01 * height),
                    DefaultFormField(
                        radius: 10,
                        //prefixIcon: Image.asset("assets/images/login_username.png"),
                        backgroundColor: AppTheme.whiteGP,
                        controller: companyNameController,
                        keyboardType: TextInputType.text,
                        labelText: "enter company (e.g. MIC Company)",
                        validator: (value) {
                          if (value!.isEmpty) {
                            return "Company cannot be empty ";
                          }
                          else {
                            return null;
                          }
                        }),
                    SizedBox(height: 0.01 * height),
                    const DefaultText(
                      text: "Location",
                      color: AppTheme.blackGP,
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                    ),
                    SizedBox(height: 0.01 * height),
                    DefaultFormField(
                        radius: 10,
                        prefixIcon: Image.asset("assets/images/login_username.png"),
                        backgroundColor: AppTheme.whiteGP,
                        controller: locationController,
                        keyboardType: TextInputType.text,
                        labelText: "enter location",
                        validator: (value) {
                          if (value!.isEmpty) {
                            return "location cannot be empty ";
                          }
                          else {
                            return null;
                          }
                        }),
                    SizedBox(height: 0.01 * height),
                    const DefaultText(
                      text: "Start Year ",
                      color: AppTheme.blackGP,
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                    ),
                    SizedBox(height: 0.01 * height),
                    DefaultFormField(
                        radius: 10,
                        suffixIcon: Icon(Icons.calendar_month_outlined) ,
                        backgroundColor: AppTheme.whiteGP,
                        controller: startYearExperienceController,
                        keyboardType: TextInputType.text,
                        labelText: "select date ",
                        onTap: (){
                          showDatePicker(
                            context: context,
                            initialDate: DateTime.now(), // start point
                            firstDate: DateTime(2000), // starting date
                            lastDate: DateTime.now(), // end date
                          ).then((value) {
                            startYearExperienceController.text = DateFormat.yMMMd().format(value!);
                          });
                        },
                        validator: (value) {
                          if (value!.isEmpty) {
                            return "Date cannot be empty ";
                          }
                          else {
                            return null;
                          }
                        }
                    ),

                    /// check box
                    Row(
                      children: [
                        Checkbox(
                            side: const BorderSide(
                              color: AppTheme.grayGP,
                            ),
                            activeColor: AppTheme.blueButtonGP,
                            checkColor: AppTheme.whiteGP,
                            value: _isEnded   ,
                            onChanged: (value) {
                              setState(() {
                                _isEnded = value!;
                              });
                            }),
                        const DefaultText(
                          text: " I am currently working in this role",
                          color: AppTheme.grayGP,
                          fontSize: 15,
                          fontWeight: FontWeight.normal,
                        ),
                      ],
                    ),

                    //SizedBox(height: 0.01 * height),


                    /// End Year visiability

                    Visibility(
                      //maintainSize: true,
                      //maintainAnimation: true,
                      //maintainState: true,
                      visible: _isEnded ,
                      replacement: Column (
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const DefaultText(
                            text: "End Year ",
                            color: AppTheme.blackGP,
                            fontSize: 15,
                            fontWeight: FontWeight.bold,
                          ),
                          SizedBox(height: 0.01 * height),
                          DefaultFormField(
                              radius: 10,
                              suffixIcon: Icon(Icons.calendar_month_outlined) ,
                              backgroundColor: AppTheme.whiteGP,
                              controller: endYearExperienceController,
                              keyboardType: TextInputType.datetime,
                              labelText: "select date ",
                              onTap: (){
                                showDatePicker(
                                  context: context,
                                  initialDate: DateTime.now(), // start point
                                  firstDate: DateTime(2000), // starting date
                                  lastDate:  DateTime.parse("2027-05-13"), // end date
                                ).then((value) {
                                  endYearExperienceController.text = DateFormat.yMMMd().format(value!);
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
                        ],
                      ),
                      child: DefaultText(
                        text: "Job has not ended yet ",
                        color: AppTheme.blackGP,
                        fontSize: 15,
                        fontWeight: FontWeight.bold,
                      ),
                    ),





                    SizedBox(height: 0.01 * height,),
                    ///button
                    Padding(
                      padding: const EdgeInsets.all(20),
                      child: defaultButton(
                          text: 'Save',
                          radius: 25,
                          backGround: AppTheme.blueButtonGP,
                          function: () async {
                            if (formKeyExperience.currentState!.validate()) {

                              position = positionController.text;
                              companyName = companyNameController.text;
                              location = locationController.text;
                              startYear = startYearExperienceController.text;
                              endYear =  endYearExperienceController.text;


                              setState(() {
                                isExperienceAdded = true;
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

                              positionController.clear();
                              locationController.clear();
                              companyNameController.clear();
                              startYearExperienceController.clear();
                              endYearExperienceController.clear();
                              selectedItem = "-- select type--";

                              print ( isExperienceAdded );
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
                  visible: isExperienceAdded ,
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
                      Image.asset("assets/images/experience.png"),
                      SizedBox(width:width*0.03),
                      Container(
                        width:0.4*width,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            DefaultText(
                              text: "$position",
                              color: AppTheme.blackGP,
                              fontSize: 15,
                              fontWeight: FontWeight.bold,
                            ),
                            DefaultText(
                              text: "$selectedItem  *  $companyName",
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
                        isExperienceAdded = false;

                        positionController.text =  position!;
                        companyNameController.text = companyName!;
                        startYearExperienceController.text= startYear!;
                        endYearExperienceController.text= endYear!;
                        locationController.text = location!;

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




