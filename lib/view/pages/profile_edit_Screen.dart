import 'dart:io';
import 'package:flutter/material.dart';
import '../../control/cubit/profile/profile__cubit.dart';
import '../../model/shared/colors_theme.dart';
import '../../model/shared/constant_attribute.dart';
import '../../router/router.dart';
import '../widget/default_button.dart';
import '../widget/default_form_field.dart';
import '../widget/default_phone_field.dart';
import '../widget/default_text_field.dart';


class ProfileEditScreen extends StatefulWidget {
  const ProfileEditScreen({super.key});

  @override
  State<ProfileEditScreen> createState() => _ProfileEditScreenState();
}

class _ProfileEditScreenState extends State<ProfileEditScreen> {
  void _OpenCameraGallery() {
    showModalBottomSheet(context: context, builder: (ctx) => buttomSheet());
  }
  File? userImage;

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            onPressed: () {
              Navigator.of(context).popAndPushNamed(AppRoute.profileScreen);
            },
            icon: Image.asset(
              "assets/images/arrow-left.png",
            )),
        centerTitle: true,
        title: const Text(
          "Edit Profile",
        ),
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Form(
            key: formKeyProfile,
            child: Padding(
              padding: const EdgeInsets.only(top: 0, left: 20, right: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Center(
                    child: Stack(
                      children: [
                        CircleAvatar(
                          minRadius: 60,
                          backgroundImage: userImage == null? const AssetImage(
                            "assets/images/Profile.png") : FileImage (File(userImage!.path)),
                          ),
                        
                        Positioned(
                          bottom: 20,
                          right: 130,
                          child: //Icon(Icons.camera)
                              InkWell(
                            onTap: _OpenCameraGallery,
                            child: Image.asset(
                              "assets/images/camera.png",
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Center(
                    child: InkWell(
                      onTap: _OpenCameraGallery,
                      child: const Text(
                        " Change Photo",
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 15,
                            color: AppTheme.blueButtonGP),
                      ),
                    ),
                  ),
                  SizedBox(height: 0.02 * height),
                  const DefaultText(
                    text: "Interested Work",
                    color: AppTheme.blackGP,
                    fontSize: 15,
                    fontWeight: FontWeight.bold,
                  ),

                  SizedBox(height: 0.02 * height),
                  DefaultFormField(
                      radius: 10,
                      backgroundColor: AppTheme.whiteGP,
                      controller: interstedWorkController,
                      keyboardType: TextInputType.text,
                      labelText: "Interested Work",
                      validator: (value) {
                        if (value!.isEmpty) {
                          return "Required ";
                        } else {
                          return null;
                        }
                      }),
                  SizedBox(height: 0.02 * height),
                  const DefaultText(
                    text: "Bio",
                    color: AppTheme.blackGP,
                    fontSize: 15,
                    fontWeight: FontWeight.bold,
                  ),
                  SizedBox(height: 0.02 * height),
                  DefaultFormField(
                      radius: 10,
                      backgroundColor: AppTheme.whiteGP,
                      controller: bioController,
                      keyboardType: TextInputType.text,
                      labelText: "Bio",
                      validator: (value) {
                        if (value!.isEmpty) {
                          return "bio cannot be empty ";
                        } else {
                          return null;
                        }
                      }),
                  SizedBox(height: 0.02 * height),
                  const DefaultText(
                    text: "Address",
                    color: AppTheme.blackGP,
                    fontSize: 15,
                    fontWeight: FontWeight.bold,
                  ),
                  SizedBox(height: 0.02 * height),
                  DefaultFormField(
                      radius: 10,
                      backgroundColor: AppTheme.whiteGP,
                      controller: addressController,
                      keyboardType: TextInputType.text,
                      labelText: "Address",
                      validator: (value) {
                        if (value!.isEmpty) {
                          return "Address cannot be empty ";
                        } else {
                          return null;
                        }
                      }),
                  SizedBox(height: 0.02 * height),
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

                  SizedBox(
                    height: 0.04 * height,
                  ),

                  ///button
                  Padding(
                    padding: const EdgeInsets.all(20),
                    child: defaultButton(
                        text: 'Save',
                        radius: 25,
                        backGround: AppTheme.blueButtonGP,
                        function: () async {
                          if (formKeyProfile.currentState!.validate()) {
                            await ProfileCubit.get(context).editProfile(
                                interestedWork :interstedWorkController.text,
                                bio: bioController.text,
                                address: addressController.text,
                                mobile:
                                    "${myCountry.dialCode}${handPhoneController.text}");

                            interstedWorkController.clear();
                            bioController.clear();
                            addressController.clear();
                            handPhoneController.clear();
                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(
                                content: Text('Successfully edit profile'),
                                duration: Duration(seconds: 2),
                              ),
                            );
                            Navigator.of(context).pushNamedAndRemoveUntil(
                                AppRoute.profileScreen, (route) => false);
                          }
                        }),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget buttomSheet() {
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
                      userImage = await ProfileCubit.get(context).uploadImage("cam");
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
                      userImage= await ProfileCubit.get(context).uploadImage("gallery");
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
} // end of Widget
