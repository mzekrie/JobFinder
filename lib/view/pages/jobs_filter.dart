import 'package:flutter/material.dart';
import 'package:gp_amit60_mary_zekrie/control/cubit/auth/login_cubit.dart';
import 'package:gp_amit60_mary_zekrie/model/shared/constant_attribute.dart';
import '../../control/cubit/job/all_jobs_cubit.dart';
import '../../model/shared/colors_theme.dart';
import '../../router/router.dart';
import '../widget/default_button.dart';
import '../widget/default_form_field.dart';
import '../widget/default_text_field.dart';

class JobsFilterScreen extends StatefulWidget {
  const JobsFilterScreen({super.key});

  @override
  State<JobsFilterScreen> createState() => _JobsFilterScreenState();
}

class _JobsFilterScreenState extends State<JobsFilterScreen> {
  List<String> salaryList = [
    "-- select salary--",
    "16000",
    "18000",
    "20000",
  ]; // filter list
  String? selectedItem = "-- select salary--"; // default value of the filter

  bool isSelected1 = false;
  bool isSelected2 = false;
  bool isSelected3 = false;
  bool isSelected4 = false;
  bool isSelected5 = false;
  bool isSelected6 = false;

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return SafeArea(
      child: Scaffold(

        body: SingleChildScrollView(
          child: Container(
            width: double.infinity,
            padding: const EdgeInsets.only(left: 10, right: 10, top: 60),
            child: Form(
              key: formKeyJob,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  /// close the filter sheet

                  Row(
                    children: [
                      IconButton(
                          onPressed: (){
                            Navigator.of(context).popAndPushNamed(AppRoute.allJobsScreen);
                          },
                          icon: Image.asset("assets/images/arrow-left.png",)),
                      SizedBox(
                        width: 0.5*width,
                        child: const DefaultText(
                          text: "Set Filter",
                          color: AppTheme.blackGP,
                          fontSize: 25,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      IconButton(
                          onPressed: (){
                            jobTitleController.clear();
                            jobLocationController.clear();
                            selectedItem = "-- select salary--";

                          },
                          icon: Image.asset("assets/images/reset.png",)),
                    ],
                  ),
                  /// title
                  const DefaultText(
                    text: "Job Title",
                    color: AppTheme.blackGP,
                    fontSize: 15,
                    fontWeight: FontWeight.normal,
                  ),
                  SizedBox(
                    height: 0.02 * height,
                  ),
                  DefaultFormField(
                    controller: jobTitleController,
                    prefixIcon: Image.asset("assets/images/j_title.png"),
                    backgroundColor: AppTheme.whiteGP,
                    labelText: "Job Title",
                    keyboardType: TextInputType.text,
                  ),
                  SizedBox(
                    height: 0.02 * height,
                  ),

                  /// location
                  const DefaultText(
                    text: "Job Location",
                    color: AppTheme.blackGP,
                    fontSize: 15,
                    fontWeight: FontWeight.normal,
                  ),
                  SizedBox(
                    height: 0.02 * height,
                  ),
                  DefaultFormField(
                    radius: 10,
                    prefixIcon: Image.asset("assets/images/j_location.png"),
                    backgroundColor: AppTheme.whiteGP,
                    controller: jobLocationController,
                    keyboardType: TextInputType.text,
                    labelText: "Location",

                  ),
                  SizedBox(
                    height: 0.02 * height,
                  ),
                      const DefaultText(
                        text: "Job Salary",
                        color: AppTheme.blackGP,
                        fontSize: 15,
                        fontWeight: FontWeight.normal,
                      ),

                  SizedBox(
                    height: 0.02 * height,
                  ),

                  DropdownButtonFormField(
                    decoration: const InputDecoration(
                      enabledBorder: OutlineInputBorder(borderSide:
                      BorderSide ( color:AppTheme.grayGP, width:1) )
                    ),
                    value: selectedItem,
                    items: salaryList
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
                  SizedBox(
                    height: 0.02 * height,
                  ),

                  const DefaultText(
                    text: "Job Type",
                    color: AppTheme.blackGP,
                    fontSize: 15,
                    fontWeight: FontWeight.normal,
                  ),
                  SizedBox(
                    height: 0.02 * height,
                  ),
                  Wrap(
                    spacing: 0.04 * width,
                    children:[
                      ChoiceChip(
                          label: const Text('Full Time'),
                          backgroundColor: AppTheme.grayLightGP , // Color to be used for the unselected, enabled chip's background.
                          selectedColor: AppTheme.blueLightGP,
                          showCheckmark:false,
                          selected: isSelected1,
                          onSelected: (newBoolValue) {
                            setState(() {
                              isSelected1 = newBoolValue;
                            });
                          }),
                      ChoiceChip(

                          label: const Text('Remote'),
                          backgroundColor: AppTheme.grayLightGP , // Color to be used for the unselected, enabled chip's background.
                          selectedColor: AppTheme.blueLightGP,
                          showCheckmark:false,
                          selected: isSelected2,
                          onSelected: (newBoolValue) {
                            setState(() {
                              isSelected2 = newBoolValue;
                            });
                          }),
                      ChoiceChip(
                          label: const Text('Contract'),
                          backgroundColor: AppTheme.grayLightGP , // Color to be used for the unselected, enabled chip's background.
                          selectedColor: AppTheme.blueLightGP,
                          showCheckmark:false,
                          selected: isSelected3,
                          onSelected: (newBoolValue) {
                            setState(() {
                              isSelected3 = newBoolValue;
                            });
                          }),
                      ChoiceChip(

                          label: const Text('Part Time'),
                          backgroundColor: AppTheme.grayLightGP , // Color to be used for the unselected, enabled chip's background.
                          selectedColor: AppTheme.blueLightGP,
                          showCheckmark:false,
                          selected: isSelected4,
                          onSelected: (newBoolValue) {
                            setState(() {
                              isSelected4 = newBoolValue;
                            });
                          }),
                      ChoiceChip(

                          label: const Text('Onsite'),
                          backgroundColor: AppTheme.grayLightGP , // Color to be used for the unselected, enabled chip's background.
                          selectedColor: AppTheme.blueLightGP,
                          showCheckmark:false,
                          selected: isSelected5,
                          onSelected: (newBoolValue) {
                            setState(() {
                              isSelected5 = newBoolValue;
                            });
                          }),
                      ChoiceChip(
                          label: const Text('Internship'),
                          backgroundColor: AppTheme.grayLightGP , // Color to be used for the unselected, enabled chip's background.
                          selectedColor: AppTheme.blueLightGP,
                          showCheckmark:false,
                          selected: isSelected6,
                          onSelected: (newBoolValue) {
                            setState(() {
                              isSelected6 = newBoolValue;
                            });
                          }),

                    ],
                  ),

                  Padding(padding: const EdgeInsets.all(30),
                            child: defaultButton(
                            text: 'Show Result',
                            width: 300,
                            height: 40,
                            radius: 25,
                            backGround: AppTheme.blueButtonGP,
                            function: () async {

                             await AllJobsCubit.get(context).filterJobs(name:jobTitleController.text, location:jobLocationController.text, salary:selectedItem);

                                Navigator.of(context).pushNamedAndRemoveUntil(
                                    AppRoute.filteredJobsScreen, (route) => false);
                              //}
                            }),),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
} // end of statlessWidget
