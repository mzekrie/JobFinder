import 'dart:io';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gp_amit60_mary_zekrie/view/builder_item/portfolio_item.dart';
import '../../control/cubit/profile/profile__cubit.dart';
import '../../model/shared/colors_theme.dart';
import '../../router/router.dart';
import '../widget/default_button.dart';
import '../widget/default_text_field.dart';


class PortfolioScreen extends StatefulWidget {
  const PortfolioScreen({super.key});

  @override
  State<PortfolioScreen> createState() => _PortfolioScreenState();
}

class _PortfolioScreenState extends State<PortfolioScreen> {
  FilePickerResult? result;
  String? _fileName;
  PlatformFile? pickedFile; // to save the file itself as a platform
  bool isLoading = false;
  bool hideUploadIcon = false;
  File? fileToDisplay; // to display the file
  void pickFile() async {
    try {
      /// file is still uploading
      setState(() {
        isLoading = true;
      });

      /// store the uploaded file on attribute result
      result = await FilePicker.platform.pickFiles(
        type: FileType.custom,
        allowedExtensions: ['png', 'jpeg', 'jpg', 'pdf'],
        allowMultiple: false,
      );

      if (result != null) {
        // to get the name of the file
        PlatformFile file = result!.files.first;
        _fileName = file.name;
        // to save the file itself as a platform
        pickedFile = result!.files.first;
        // to display the file
        fileToDisplay = File(pickedFile!.path.toString());
        print('File name is $_fileName');
        print(file.bytes);
        print(file.size);
        print(file.extension);
        print(file.path);

      }

      /// file is done uploading
      setState(() {
        isLoading = false;
        hideUploadIcon = true;
      });
    } catch (e) {
      print(e);
    }
  }

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
          "Portfolio Screen",
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              height: 0.25 * height,
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
                    Visibility(visible: (pickedFile!=null),
                      replacement:  Column(
                      children: [
                        IconButton(
                            onPressed: () {
                              pickFile();
                            },
                            icon: Image.asset('assets/images/uploadfile.png')),

                        const DefaultText(
                          text: "click icon to upload your file ",
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
                            pickedFile=null;
                            isLoading = false;
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
                          //if (formKeyPortfolio.currentState!.validate()) {
                          /// what we will do is here
                          if (pickedFile != null) {
                            ProfileCubit.get(context).uploadImageAndCVFile(pickedFile:fileToDisplay, fileName:_fileName!);
                            // Fluttertoast.showToast(
                            //     msg: "Uploaded Successfully!",
                            //     toastLength: Toast.LENGTH_SHORT,
                            //     gravity: ToastGravity.BOTTOM,
                            //     timeInSecForIosWeb: 3,
                            //     backgroundColor: Colors.green,
                            //     textColor: Colors.white,
                            //     fontSize: 16.0);

                          } else {
                            return null;
                          }
                        }),


                  ]),
            ),
           
       
            BlocBuilder<ProfileCubit, ProfileState>(
  builder: (context, state) {
    return Expanded(
                child: ListView.separated(
                  shrinkWrap: true,
                  separatorBuilder: (context, index) => SizedBox(height: height* 0.02,),
                  itemCount: ProfileCubit.get(context).portofolioList!.length,
                  itemBuilder: (context , index){
                    return BuilderPortfolio(
                      item: ProfileCubit.get(context).portofolioList![index],
                    );
                  },
        
                ),
              );
  },
),
            
          ],
        ),
      ),
    );
  }
} // end of statlessWidget
