import 'dart:io';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:gp_amit60_mary_zekrie/model/shared/constant_attribute.dart';
import '../../control/cubit/applied_job/applied_job_cubit.dart';
import '../../control/cubit/auth/login_cubit.dart';
import '../../model/shared/colors_theme.dart';
import '../../router/router.dart';
import '../widget/default_button.dart';
import '../widget/default_form_field.dart';
import '../widget/default_phone_field.dart';
import '../widget/default_text_field.dart';
//import 'package:flutter_bloc/flutter_bloc.dart';

class ApplyToJobScreen extends StatefulWidget {
  const ApplyToJobScreen({super.key});

  @override
  State<ApplyToJobScreen> createState() => _ApplyToJobScreenState();
}

class _ApplyToJobScreenState extends State<ApplyToJobScreen> {
  int currentStep = 0; // current step of stepper
  bool isCompleted = false;
  String _workType = "Senior UX Designer"; // value that holds worktype
  FilePickerResult? result_cv;
  FilePickerResult? result_other;
  String? _fileName_cv;
  String? _fileName_other;

  PlatformFile? pickedFile_cv;
  PlatformFile? pickedFile_other; // to save the file itself as a platform
  bool isLoading_cv = false;
  bool isLoading_other = false;
  bool hideUploadIcon_cv = false;
  bool hideUploadIcon_other = false;
  File? fileToDisplay_cv; // to display the file
  File? fileToDisplay_other; // to display the file

  void pickFileOther() async {
    try {
      /// file is still uploading
      setState(() {
        isLoading_other = true;
      });

      /// store the uploaded file on attribute result
      result_other = await FilePicker.platform.pickFiles(
        type: FileType.custom,
        allowedExtensions: ['png', 'jpeg', 'jpg', 'pdf'],
        allowMultiple: false,
      );

      if (result_other!= null) {
        // to get the name of the file
        PlatformFile fileOther = result_other!.files.first;
        _fileName_other = fileOther.name;
        // to save the file itself as a platform
        pickedFile_other= result_other!.files.first;
        // to display the file
        fileToDisplay_other= File(pickedFile_other!.path.toString());
        print('File name is $_fileName_other');
        print(fileOther.bytes);
        print(fileOther.size);
        print(fileOther.extension);
        print(fileOther.path);

      }

      /// file is done uploading
      setState(() {
        isLoading_other= false;
        hideUploadIcon_other = true;
      });
    } catch (e) {
      print(e);
    }
  }

  void pickFileCV() async {
    try {
      /// file is still uploading
      setState(() {
        isLoading_cv = true;
      });

      /// store the uploaded file on attribute result
      result_cv = await FilePicker.platform.pickFiles(
        type: FileType.custom,
        allowedExtensions: ['png', 'jpeg', 'jpg', 'pdf'],
        allowMultiple: false,
      );

      if (result_cv != null) {
        // to get the name of the file
        PlatformFile fileCv = result_cv!.files.first;
        _fileName_cv = fileCv.name;
        // to save the file itself as a platform
        pickedFile_cv = result_cv!.files.first;
        // to display the file
        fileToDisplay_cv = File(pickedFile_cv!.path.toString());
        print('File name is $_fileName_cv');
        print(fileCv.bytes);
        print(fileCv.size);
        print(fileCv.extension);
        print(fileCv.path);

      }

      /// file is done uploading
      setState(() {
        isLoading_cv = false;
        hideUploadIcon_cv = true;
      });
    } catch (e) {
      print(e);
    }
  }


  List<Step> getSteps() => [
    Step(
      state: currentStep > 0 ? StepState.complete:StepState.indexed,
      isActive: currentStep >= 0,
      title: const Text('Bio'),
      content: Form(
        key: formKeyApplyJob1,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const DefaultText(
              text: "Biodata",
              color: AppTheme.blackGP,
              fontSize: 15,
              fontWeight: FontWeight.bold,
            ),
            const DefaultText(
              text: "Fill in your bio data correctly",
              color: AppTheme.grayGP,
              fontSize: 12,
              fontWeight: FontWeight.normal,
            ),
            const SizedBox(height: 10),
            const DefaultText(
              text: "Full Name*",
              color: AppTheme.blackGP,
              fontSize: 15,
              fontWeight: FontWeight.bold,
            ),
            const SizedBox(height: 10),
            DefaultFormField(
                radius: 10,
                backgroundColor: AppTheme.whiteGP,
                controller: nameController,
                keyboardType: TextInputType.text,
                labelText: "name",
                validator: (value) {
                  if (value!.isEmpty) {
                    return "name cannot be empty ";
                  } else {
                    return null;
                  }
                }),
            const SizedBox(height:10),
            const DefaultText(
              text: "Email",
              color: AppTheme.blackGP,
              fontSize: 15,
              fontWeight: FontWeight.bold,
            ),
            const SizedBox(height: 10),
            DefaultFormField(
                radius: 10,
                prefixIcon: Image.asset(
                    "assets/images/login_username.png"),
                backgroundColor: AppTheme.whiteGP,
                controller: emailController,
                keyboardType: TextInputType.emailAddress,
                labelText: "Username",
                validator: (value) {
                  if (value!.isEmpty) {
                    return "email cannot be empty";
                  }
                  if (!RegExp(
                      "^[a-zA-Z0-9+_.-]+@[a-zA-Z-9+_.-]+.[a-z]")
                      .hasMatch(value)) {
                    return " Please enter valid email format";
                  } else {
                    return null;
                  }
                }),
            const SizedBox(height: 10),
            DefaultPhoneField(
              controller: handPhoneController,
              validator: (value) {
                if (value!.isEmpty) {
                  return "phone number must not be empty ";
                }
                return null;
              },
              labelText: "Phone Number",
              onChange: (countryCode) {
                myCountry = countryCode;
              },
              hintText: "Contact Phone Number",
            ),
          ],
        ),
      ),
    ), //step1
    Step(
      state: currentStep > 1 ? StepState.complete:StepState.indexed,
      isActive: currentStep >= 1,
      title: const Text('Work Type '),
      content: Form(
        key: formKeyApplyJob2,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const DefaultText(
              text: "Type of work",
              color: AppTheme.blackGP,
              fontSize: 15,
              fontWeight: FontWeight.bold,
            ),
            const DefaultText(
              text: "Fill in your bio data correctly",
              color: AppTheme.grayGP,
              fontSize: 12,
              fontWeight: FontWeight.normal,
            ),
            const SizedBox(height: 10),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: SingleChildScrollView(
                scrollDirection: Axis.vertical,
                child:  ListView(
                  shrinkWrap: true,
                  children: [
                    RadioListTile(
                      value: "Senior UX Designer",
                      controlAffinity: ListTileControlAffinity.trailing,
                      tileColor: AppTheme.whiteGP,
                      selectedTileColor:AppTheme.blueButtonGP ,
                      activeColor: AppTheme.blueButtonGP,
                      hoverColor:AppTheme.grayLightGP,
                      title: const Row(
                        children: <Widget>[
                          Expanded(
                            flex: 3,
                            child: Text(
                              "Senior UX Designer",
                              overflow: TextOverflow.ellipsis,
                              maxLines: 3,
                              style: TextStyle(color: AppTheme.blackGP, fontSize: 15.0),
                            ),
                          ),

                        ],
                      ),
                      groupValue: _workType,
                      onChanged: (val) => setState(() {
                        _workType = val!;
                      }),
                    ),
                    const Divider(thickness:1, color: AppTheme.gray,),
                    RadioListTile(
                      controlAffinity: ListTileControlAffinity.trailing,
                      tileColor: AppTheme.whiteGP,
                      selectedTileColor:AppTheme.blueButtonGP ,
                      activeColor: AppTheme.blueButtonGP,
                      hoverColor:AppTheme.grayLightGP,
                      value:"Senior UI Designer",
                      title: const Row(
                        children: <Widget>[

                          Expanded(
                            flex: 3,
                            child: Text(
                              "Senior UI Designer",
                              overflow: TextOverflow.ellipsis,
                              maxLines: 3,
                              style: TextStyle(color: AppTheme.blackGP, fontSize: 15.0),
                            ),
                          ),

                        ],
                      ),
                      groupValue: _workType,
                      onChanged: (val) => setState(() {
                        _workType = val!;
                      }),
                    ),
                    const Divider(thickness:1, color: AppTheme.gray,),
                    RadioListTile(
                      controlAffinity: ListTileControlAffinity.trailing,
                      tileColor: AppTheme.whiteGP,
                      selectedTileColor:AppTheme.blueButtonGP ,
                      activeColor: AppTheme.blueButtonGP,
                      hoverColor:AppTheme.grayLightGP,
                      value: "Graphik Designer",
                      title: const Row(
                        children: <Widget>[

                          Expanded(
                            flex: 3,
                            child: Text(
                              "Graphik Designer",
                              overflow: TextOverflow.ellipsis,
                              maxLines: 3,
                              style: TextStyle(color: AppTheme.blackGP, fontSize: 15.0),
                            ),
                          ),

                        ],
                      ),
                      groupValue: _workType,
                      onChanged: (val) => setState(() {
                        _workType = val!;
                      }),
                    ),
                    const Divider(thickness:1, color: AppTheme.gray,),
                    RadioListTile(
                      controlAffinity: ListTileControlAffinity.trailing,
                      tileColor: AppTheme.whiteGP,
                      selectedTileColor:AppTheme.blueButtonGP ,
                      activeColor: AppTheme.blueButtonGP,
                      hoverColor:AppTheme.grayLightGP,
                      value: "Front-End Developer",
                      title: const Row(
                        children: <Widget>[
                          Expanded(
                            flex: 3,
                            child: Text(
                              "Front-End Developer",
                              overflow: TextOverflow.ellipsis,
                              maxLines: 3,
                              style: TextStyle(color: AppTheme.blackGP, fontSize: 15.0),
                            ),
                          ),

                        ],
                      ),
                      groupValue: _workType,
                      onChanged: (val) => setState(() {
                        _workType = val!;
                      }),
                    ),
                    const Divider(thickness:1, color: AppTheme.gray,),

                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    ), //step2
    Step(
      state: currentStep > 2 ? StepState.complete:StepState.indexed,
      isActive: currentStep >= 2,
      title: const Text('Portfolio'),
      content: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Visibility(visible: (pickedFile_cv!=null),
            replacement:  Column(
              children: [
                IconButton(
                    onPressed: () {
                      pickFileCV();
                    },
                    icon: Image.asset('assets/images/uploadfile.png')),

                const DefaultText(
                  text: "click icon to upload your CV file ",
                  color: AppTheme.blackGP,
                  fontSize: 15,
                  fontWeight: FontWeight.bold,
                ),
                const DefaultText(
                  text: "Max. file size 10 MB ",
                  color: AppTheme.grayGP,
                  fontSize: 12,
                  fontWeight: FontWeight.bold,
                ),
              ],
            ),
            child:  Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const DefaultText(
                  text: "File is uploaded",
                  color: AppTheme.blackGP,
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
                IconButton(onPressed: (){
                  setState(() {
                    pickedFile_cv=null;
                    isLoading_cv = false;
                  });
                }, icon: const Icon(Icons.delete), color: Colors.red,),
              ],
            ),),
          const SizedBox(
            height: 10,
          ),

          Visibility(visible: (pickedFile_other!=null),
            replacement:  Column(
              children: [
                IconButton(
                    onPressed: () {
                      pickFileOther();
                    },
                    icon: Image.asset('assets/images/uploadfile.png')),

                const DefaultText(
                  text: "click icon to upload your other file ",
                  color: AppTheme.blackGP,
                  fontSize: 15,
                  fontWeight: FontWeight.bold,
                ),
                const DefaultText(
                  text: "Max. file size 10 MB ",
                  color: AppTheme.grayGP,
                  fontSize: 12,
                  fontWeight: FontWeight.bold,
                ),
              ],
            ),
            child:  Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const DefaultText(
                  text: "File is uploaded",
                  color: AppTheme.blackGP,
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
                IconButton(onPressed: (){
                  setState(() {
                    pickedFile_other=null;
                    isLoading_other= false;
                  });
                }, icon: const Icon(Icons.delete), color: Colors.red,),
              ],
            ),),
          const SizedBox(
            height: 10,
          ),
        ],
      ),
    ),  //step3
  ];
@override
  void initState() {
    // TODO: implement initState
  LoginCubit.get(context).getUser();
  super.initState();
  }


  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppTheme.chat_bg_white,
        leading: IconButton(
            onPressed: () {
              Navigator.of(context).pushNamedAndRemoveUntil(AppRoute.allJobsScreen, (route) => false);
            },
            icon: Image.asset(
              "assets/images/arrow-left.png",
            )),
        centerTitle: true,
        title: const Text("Apply to Job",
            style: TextStyle(fontWeight: FontWeight.bold, color: Colors.black)),
      ),
      body: isCompleted
          ? buildCompleted()
          :
      Theme(
        data: Theme.of(context).copyWith(colorScheme: const ColorScheme.light(primary: AppTheme.blueButtonGP)),
        child: Stepper(
          type: StepperType.horizontal,
          steps: getSteps(),
          currentStep: currentStep,
          onStepTapped: (step) => setState(() => currentStep = step), // to move between steps by clicking on number

          onStepContinue: () async {
            final isLastStep = currentStep == getSteps().length - 1;
            if (isLastStep) {
              setState(() {
                isCompleted = true;  // to show the sucess widget and exit
              });
              print('Completed');

              ///TODO
              /// send data to server

              if ((formKeyApplyJob1.currentState!.validate()) && (formKeyApplyJob2.currentState!.validate()) ) {

                String? validate =await AppliedJobCubit.get(context).applyToJob(
                      name: nameController.text,
                      email:emailController.text, mobile: "${myCountry.dialCode}${handPhoneController.text}", workType:_workType, cvFile:fileToDisplay_cv, cvFileName: _fileName_cv, otherFile:fileToDisplay_other, otherFileName:_fileName_other);

                if (validate != ('Error')) {


                  showAppliedMessage = true;  // to display message container at the home page
                  emailController.clear();
                  nameController.clear();
                  handPhoneController.clear();
                  _workType = "Senior UX Designer";

                  // Navigator.of(context)
                  //     .pushNamedAndRemoveUntil(
                  //     AppRoute.homeScreen,
                  //         (route) => false);
                  buildCompleted();

                  Fluttertoast.showToast(
                    msg: " Successfully applied to Job!",
                    toastLength: Toast.LENGTH_SHORT,
                    gravity: ToastGravity.BOTTOM,
                    timeInSecForIosWeb: 3,
                    backgroundColor: Colors.green,
                    textColor: Colors.white,
                    fontSize: 16.0,
                  );
                }
                else {
                  showAppliedMessage = true;  // to display message container at the home page
                  // Navigator.of(context)
                  //     .pushNamedAndRemoveUntil(
                  //     AppRoute.homeScreen,
                  //         (route) => false);
                  buildCompleted();
                  Fluttertoast.showToast(
                    msg: " Error  applied to Job!",
                    toastLength: Toast.LENGTH_SHORT,
                    gravity: ToastGravity.BOTTOM,
                    timeInSecForIosWeb: 3,
                    backgroundColor: Colors.red,
                    textColor: Colors.white,
                    fontSize: 16.0,
                  );
                }
              }
              else {
                Fluttertoast.showToast(
                  msg: " Something went wrong please check your input!",
                  toastLength: Toast.LENGTH_SHORT,
                  gravity: ToastGravity.BOTTOM,
                  timeInSecForIosWeb: 3,
                  backgroundColor: Colors.red,
                  textColor: Colors.white,
                  fontSize: 16.0,
                );
              }
            }
            else {
              setState(() {
                currentStep = currentStep + 1;
                /// go to next step
              });
            }
          },
          onStepCancel: () {
            if (currentStep ==0) {
              currentStep = 0;
            } else {
              setState(() {
                currentStep = currentStep - 1;

                /// go to next step
              });
            }
          },

          /// to control the shape and display of the button but
          // controlsBuilder: (context, onStepContinue) {
          //   return Container(
          //   margin: EdgeInsets.only(top:50),
          //     child: Row(
          //       children: [
          //         Expanded(child: defaultButton(
          //             text: 'Next ' ,
          //             radius: 25,
          //             backGround: AppTheme.blueButtonGP,
          //             function:(){onStepContinue;} ),),
          //       ],
          //     ),
          //   );
          // },

        ),
      ),
    );
  }
  Widget buildCompleted(){
    return Center(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const DefaultText(
            text: "Congratulation!",
            color: AppTheme.blueButtonGP,
            fontSize: 40,
            fontWeight: FontWeight.bold,
          ),
          const SizedBox(height: 20,),
          const DefaultText(
            text: "You have applied to the job",
            color: AppTheme.blackGP,
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
      const SizedBox(height: 20,),

      defaultButton(
                    text:  "Apply to Another Job ",
                    radius: 25,
                    backGround: AppTheme.greenGP,
                    function:(){
                      Navigator.of(context)
                          .pushNamedAndRemoveUntil(
                          AppRoute.allJobsScreen,
                              (route) => false);
                    } ),
          const SizedBox(height: 30,),

          defaultButton(
              text:  "Go To Home ",
              radius: 25,
              backGround: AppTheme.blueButtonGP,
              function:(){
                Navigator.of(context)
                    .pushNamedAndRemoveUntil(
                    AppRoute.jobsScreen,
                        (route) => false);
              } ),


        ],
      ),
    );
  }
} // end of state widget
