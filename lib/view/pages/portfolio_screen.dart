import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:gp_amit60_mary_zekrie/view/builder_item/portfolio_item.dart';
import '../../control/cubit/profile/profile__cubit.dart';
import '../../model/shared/colors_theme.dart';
import '../../model/shared/constant_attribute.dart';
import '../../router/router.dart';
import '../widget/default_button.dart';
import '../widget/default_text_field.dart';


class PortfolioScreen extends StatefulWidget {
  const PortfolioScreen({super.key});

  @override
  State<PortfolioScreen> createState() => _PortfolioScreenState();
}

class _PortfolioScreenState extends State<PortfolioScreen> {

  void _uploadCV() {
    showModalBottomSheet(context: context, builder: (ctx) => fileCVButtomSheet());
  }
  void _takeUserImage() {
    showModalBottomSheet(context: context, builder: (ctx) => imagebuttomSheet());
  }

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            onPressed: () {
              Navigator.of(context).pushNamedAndRemoveUntil(AppRoute.profileScreen, (route) => false);
            },
            icon: Image.asset(
              "assets/images/arrow-left.png",
            )),
        centerTitle: true,
        title: const Text(
          "Portfolio Screen",
        ),
      ),
      body: BlocBuilder<ProfileCubit, ProfileState>(
        builder: (context, state) {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                height: 0.4 * height,
                width: 0.9 * width,
                decoration: BoxDecoration(
                    border: Border.all(
                      width: 1,
                      color: AppTheme
                          .blueButtonGP,
                    ),
                    borderRadius: BorderRadius.circular(25),
                    color: AppTheme.profile_baby_blue),
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      // for the CV file
                      Visibility(visible: (userCV != null),
                        replacement:  Column(
                          children: [
                            IconButton(
                                onPressed: () {
                                  _uploadCV();
                                },
                                icon: Image.asset('assets/images/uploadfile.png')),

                            const DefaultText(
                              text: "click icon to upload your CV ",
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
                              text: "CV File is uploaded",
                              color: AppTheme.blackGP,
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            ),
                            IconButton(onPressed: (){
                              setState(() {
                                userCV=null;
                              });
                            }, icon: const Icon(Icons.delete), color: Colors.red,),
                          ],
                        ),),
                      SizedBox(
                        height: 0.01 * height,
                      ),
                      // for the profile image
                      Visibility(visible: (userCVImage != null),
                        replacement:  Column(
                          children: [
                            IconButton(
                                onPressed: () {
                                  _takeUserImage();
                                },
                                icon: Image.asset('assets/images/uploadfile.png')),

                            const DefaultText(
                              text: "click icon to upload your profile image ",
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
                              text: "Profile image is uploaded",
                              color: AppTheme.blackGP,
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            ),
                            IconButton(onPressed: (){
                              setState(() {
                                userCVImage=null;
                              });
                            }, icon: const Icon(Icons.delete), color: Colors.red,),
                          ],
                        ),),
                      SizedBox(
                        height: 0.01 * height,
                      ),

                      ///button
                      defaultButton(
                          text: 'Add file',
                          radius: 25,
                          backGround: AppTheme.blueButtonGP,
                          function: () async {
                            /// what we will do is here
                            if (userCV != null && userCVImage != null) {

                              var response = ProfileCubit.get(context).addPortfolio(userCV: userCV, userCVImage: userCVImage);
                              if(response == 'Success') {
                                Fluttertoast.showToast(
                                    msg: "CV Added Successfully!",
                                    toastLength: Toast.LENGTH_SHORT,
                                    gravity: ToastGravity.BOTTOM,
                                    timeInSecForIosWeb: 3,
                                    backgroundColor: Colors.green,
                                    textColor: Colors.white,
                                    fontSize: 16.0);
                              }
                              else{ Fluttertoast.showToast(
                                  msg: "CV Failed",
                                  toastLength: Toast.LENGTH_SHORT,
                                  gravity: ToastGravity.BOTTOM,
                                  timeInSecForIosWeb: 3,
                                  backgroundColor: Colors.red,
                                  textColor: Colors.white,
                                  fontSize: 16.0);}

                            } else {
                              return null;
                            }
                          }),


                    ]),
              ),
              Padding(
                padding: const EdgeInsets.all(12.0),
                child: Container(
                  padding: const EdgeInsets.all(12.0),
                  decoration: BoxDecoration(
                      border:Border.all(
                        width: 1,
                        color: AppTheme.grayGP,  //                   <--- border width here
                      ),
                      borderRadius: BorderRadius.circular(10),
                      color:  AppTheme.whiteGP),

                  child:Row(
                    children: [
                      Image.asset("assets/images/pdf.png"),
                      SizedBox(width: 0.01 * width),

                      SizedBox(
                        width: 0.4 * width,
                        child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const DefaultText(
                                text: ("UX Design "),
                                //text: ("${widget.item.name}"),
                                color: AppTheme.blackGP,
                                fontSize: 15,
                                fontWeight: FontWeight.bold,
                              ),
                              SizedBox(height: 0.01 * height),
                              const DefaultText(
                                text: ("CV.pdf 300KB"),
                                //text: ("${widget.item.name}"),
                                color: AppTheme.gray,
                                fontSize: 15,
                                fontWeight: FontWeight.bold,
                              ),
                            ]
                        ),
                      ),
                      SizedBox(width: 0.1 * width),
                      IconButton(onPressed: (){}, icon: Image.asset("assets/images/edit-2.png")),
                      IconButton(onPressed: (){}, icon: Image.asset("assets/images/close-circle.png")),

                    ],
                  ),
                ),
              ),
              Expanded(
                child: SizedBox(
                  height: 1.5 * height,
                  child: ListView.separated(
                    shrinkWrap: true,
                    separatorBuilder: (context, index) => SizedBox(height: height* 0.02,),
                    itemCount: ProfileCubit.get(context).portofolioList!.length,
                    itemBuilder: (context , index){
                      return BuilderPortfolio(
                        item: ProfileCubit.get(context).portofolioList![index],
                      );
                      //return BuilderPortfolio();
                    },

                  ),
                ),
              ),

            ],
          );
        },
      ),
    );
  }

  Widget fileCVButtomSheet() {
    return Padding(
      padding: const EdgeInsets.all(18.0),
      child: SizedBox(
        width: double.infinity,
        height: 150,
        child: Column(
          children: [
            const DefaultText(
              text: "Select option",
              color: AppTheme.grayGP,
              fontSize: 20,
              fontWeight: FontWeight.normal,
            ),
            const SizedBox(
              height: 20,
            ),
            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.all(4.0),
                  child: OutlinedButton(
                    onPressed: () async {
                      setState(()async {
                        userCV = await ProfileCubit.get(context).uploadImage("cam");
                        if (userCV != null)
                        {
                          Navigator.of(context).pushNamedAndRemoveUntil(AppRoute.portfolioScreen, (route) => false);
                        }
                        else {
                          print ('Still uploding userCV');
                        }
                      });
                    },
                    child: const Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Icon(Icons.camera),
                        SizedBox(
                          width: 10,
                        ),
                        SizedBox(
                          width: 80,
                          child: DefaultText(
                            text: "Camera",
                            color: AppTheme.grayGP,
                            fontSize: 20,
                            fontWeight: FontWeight.normal,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(4.0),
                  child: OutlinedButton(
                    onPressed: () async {
                      setState(() async{
                        userCV= await ProfileCubit.get(context).uploadImage("gallery");
                        if (userCV != null)
                        {
                          Navigator.of(context).pushNamedAndRemoveUntil(AppRoute.portfolioScreen, (route) => false);
                        }
                        else {
                          print ('Still uploding userCV');
                        }

                      });
                    },
                    child: const Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Icon(Icons.image),
                        SizedBox(
                          width: 20,
                        ),
                        SizedBox(
                          width: 80,
                          child: DefaultText(
                            text: "Gallery",
                            color: AppTheme.grayGP,
                            fontSize: 20,
                            fontWeight: FontWeight.normal,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
  Widget imagebuttomSheet() {
    return Padding(
      padding: const EdgeInsets.all(18.0),
      child: SizedBox(
        width: double.infinity,
        height: 150,
        child: Column(
          children: [
            const DefaultText(
              text: "Select option",
              color: AppTheme.grayGP,
              fontSize: 20,
              fontWeight: FontWeight.normal,
            ),
            const SizedBox(
              height: 20,
            ),
            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.all(4.0),
                  child: OutlinedButton(
                    onPressed: () async {
                      setState(()async {
                        userCVImage = await ProfileCubit.get(context).uploadImage("cam");
                        if (userCVImage != null)
                        {
                          Navigator.of(context).pushNamedAndRemoveUntil(AppRoute.portfolioScreen, (route) => false);
                        }
                        else {
                          print ('Still uploding user profile image');
                        }
                      });
                    },
                    child: const Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Icon(Icons.camera),
                        SizedBox(
                          width: 10,
                        ),
                        SizedBox(
                          width: 80,
                          child: DefaultText(
                            text: "Camera",
                            color: AppTheme.grayGP,
                            fontSize: 20,
                            fontWeight: FontWeight.normal,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(4.0),
                  child: OutlinedButton(
                    onPressed: () async {
                      setState(() async{
                        userCVImage= await ProfileCubit.get(context).uploadImage("gallery");
                        if (userCVImage != null)
                        {
                          Navigator.of(context).pushNamedAndRemoveUntil(AppRoute.portfolioScreen, (route) => false);
                        }
                        else {
                          print ('Still uploding user profile image');
                        }

                      });
                    },
                    child: const Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Icon(Icons.image),
                        SizedBox(
                          width: 20,
                        ),
                        SizedBox(
                          width: 80,
                          child: DefaultText(
                            text: "Gallery",
                            color: AppTheme.grayGP,
                            fontSize: 20,
                            fontWeight: FontWeight.normal,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
} // end of statlessWidget




//////////////////
// import 'dart:io';
// import 'package:file_picker/file_picker.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:fluttertoast/fluttertoast.dart';
// import 'package:gp_amit60_mary_zekrie/view/builder_item/portfolio_item.dart';
// import '../../control/cubit/profile/profile__cubit.dart';
// import '../../model/shared/colors_theme.dart';
// import '../../router/router.dart';
// import '../widget/default_button.dart';
// import '../widget/default_text_field.dart';
//
//
// class PortfolioScreen extends StatefulWidget {
//   const PortfolioScreen({super.key});
//
//   @override
//   State<PortfolioScreen> createState() => _PortfolioScreenState();
// }
//
// class _PortfolioScreenState extends State<PortfolioScreen> {
//   FilePickerResult? result;
//   String? _fileName;
//   PlatformFile? pickedFile; // to save the file itself as a platform
//   bool isLoading = false;
//   bool hideUploadIcon = false;
//   File? fileToDisplay; // to display the file
//   void pickFile() async {
//     try {
//       /// file is still uploading
//       setState(() {
//         isLoading = true;
//       });
//
//       /// store the uploaded file on attribute result
//       result = await FilePicker.platform.pickFiles(
//         type: FileType.custom,
//         allowedExtensions: ['png', 'jpeg', 'jpg', 'pdf'],
//         allowMultiple: false,
//       );
//
//       if (result != null) {
//         // to get the name of the file
//         PlatformFile file = result!.files.first;
//         _fileName = file.name;
//         // to save the file itself as a platform
//         pickedFile = result!.files.first;
//         // to display the file
//         fileToDisplay = File(pickedFile!.path.toString());
//         print('File name is $_fileName');
//         print(file.bytes);
//         print(file.size);
//         print(file.extension);
//         print(file.path);
//
//       }
//
//       /// file is done uploading
//       setState(() {
//         isLoading = false;
//         hideUploadIcon = true;
//       });
//     } catch (e) {
//       print(e);
//     }
//   }
//
//
//   @override
//   Widget build(BuildContext context) {
//     double height = MediaQuery.of(context).size.height;
//     double width = MediaQuery.of(context).size.width;
//     return Scaffold(
//       appBar: AppBar(
//         leading: IconButton(
//             onPressed: () {
//               Navigator.of(context).pushNamedAndRemoveUntil(AppRoute.profileScreen, (route) => false);
//             },
//             icon: Image.asset(
//               "assets/images/arrow-left.png",
//             )),
//         centerTitle: true,
//         title: const Text(
//           "Portfolio Screen",
//         ),
//       ),
//       body: BlocBuilder<ProfileCubit, ProfileState>(
//   builder: (context, state) {
//     return Column(
//       crossAxisAlignment: CrossAxisAlignment.center,
//       mainAxisAlignment: MainAxisAlignment.center,
//       mainAxisSize: MainAxisSize.min,
//       children: [
//         Container(
//           height: 0.25 * height,
//           width: 0.9 * width,
//           decoration: BoxDecoration(
//               border: Border.all(
//                 width: 1,
//                 color: AppTheme
//                     .blueButtonGP,
//               ),
//               borderRadius: BorderRadius.circular(25),
//               color: AppTheme.profile_baby_blue),
//           child: Column(
//               crossAxisAlignment: CrossAxisAlignment.center,
//               mainAxisAlignment: MainAxisAlignment.center,
//               children: [
//                 Visibility(visible: (pickedFile!=null),
//                   replacement:  Column(
//                   children: [
//                     IconButton(
//                         onPressed: () {
//                           pickFile();
//                         },
//                         icon: Image.asset('assets/images/uploadfile.png')),
//
//                     const DefaultText(
//                       text: "click icon to upload your file ",
//                       color: AppTheme.blackGP,
//                       fontSize: 15,
//                       fontWeight: FontWeight.bold,
//                     ),
//                     const DefaultText(
//                       text: "Max. file size 10 MB ",
//                       color: AppTheme.grayGP,
//                       fontSize: 12,
//                       fontWeight: FontWeight.bold,
//                     ),
//                   ],
//                 ),
//                   child:  Row(
//                     crossAxisAlignment: CrossAxisAlignment.center,
//                     mainAxisAlignment: MainAxisAlignment.center,
//                     children: [
//                       const DefaultText(
//                       text: "File is uploaded",
//                       color: AppTheme.blackGP,
//                       fontSize: 20,
//                       fontWeight: FontWeight.bold,
//                                       ),
//                     IconButton(onPressed: (){
//                       setState(() {
//                         pickedFile=null;
//                         isLoading = false;
//                       });
//                     }, icon: const Icon(Icons.delete), color: Colors.red,),
//                     ],
//                   ),),
//                 SizedBox(
//                   height: 0.01 * height,
//                 ),
//
//                 ///button
//                 defaultButton(
//                     text: 'Add file',
//                     radius: 25,
//                     backGround: AppTheme.blueButtonGP,
//                     function: () async {
//                       //if (formKeyPortfolio.currentState!.validate()) {
//                       /// what we will do is here
//                       if (pickedFile != null) {
//                         ProfileCubit.get(context).uploadImageAndCVFile(pickedFile:fileToDisplay, fileName:_fileName!);
//                         Fluttertoast.showToast(
//                             msg: "Uploaded Successfully!",
//                             toastLength: Toast.LENGTH_SHORT,
//                             gravity: ToastGravity.BOTTOM,
//                             timeInSecForIosWeb: 3,
//                             backgroundColor: Colors.green,
//                             textColor: Colors.white,
//                             fontSize: 16.0);
//
//                       } else {
//                         return null;
//                       }
//                     }),
//
//
//               ]),
//         ),
//         Padding(
//           padding: const EdgeInsets.all(12.0),
//           child: Container(
//             padding: const EdgeInsets.all(12.0),
//             decoration: BoxDecoration(
//                 border:Border.all(
//                   width: 1,
//                   color: AppTheme.grayGP,  //                   <--- border width here
//                 ),
//                 borderRadius: BorderRadius.circular(10),
//                 color:  AppTheme.whiteGP),
//
//             child:Row(
//               children: [
//                 Image.asset("assets/images/pdf.png"),
//                 SizedBox(width: 0.01 * width),
//
//                 SizedBox(
//                   width: 0.4 * width,
//                   child: Column(
//                       crossAxisAlignment: CrossAxisAlignment.start,
//                       children: [
//                         const DefaultText(
//                           text: ("UX Design "),
//                           //text: ("${widget.item.name}"),
//                           color: AppTheme.blackGP,
//                           fontSize: 15,
//                           fontWeight: FontWeight.bold,
//                         ),
//                         SizedBox(height: 0.01 * height),
//                         const DefaultText(
//                           text: ("CV.pdf 300KB"),
//                           //text: ("${widget.item.name}"),
//                           color: AppTheme.gray,
//                           fontSize: 15,
//                           fontWeight: FontWeight.bold,
//                         ),
//                       ]
//                   ),
//                 ),
//                 SizedBox(width: 0.1 * width),
//                 IconButton(onPressed: (){}, icon: Image.asset("assets/images/edit-2.png")),
//                 IconButton(onPressed: (){}, icon: Image.asset("assets/images/close-circle.png")),
//
//               ],
//             ),
//           ),
//         ),
//      Expanded(
//             child: SizedBox(
//               height: 1.5 * height,
//               child: ListView.separated(
//                 shrinkWrap: true,
//                 separatorBuilder: (context, index) => SizedBox(height: height* 0.02,),
//                 itemCount: ProfileCubit.get(context).portofolioList!.length,
//                 itemBuilder: (context , index){
//                   return BuilderPortfolio(
//                     item: ProfileCubit.get(context).portofolioList![index],
//                   );
//                   //return BuilderPortfolio();
//                 },
//
//               ),
//             ),
//           ),
//
//
//
//
//       ],
//     );
//   },
// ),
//     );
//   }
// } // end of statlessWidget
