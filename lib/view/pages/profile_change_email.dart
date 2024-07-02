import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import '../../control/cubit/auth/login_cubit.dart';
import '../../control/cubit/profile/profile__cubit.dart';
import '../../model/shared/colors_theme.dart';
import '../../model/shared/constant_attribute.dart';
import '../../router/router.dart';
import '../widget/default_button.dart';
import '../widget/default_form_field.dart';
import '../widget/default_phone_field.dart';
import '../widget/default_text_field.dart';


class ChangeEmailScreen extends StatelessWidget {
  const ChangeEmailScreen({super.key});

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
          "Edit Email",
        ),
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Form(
            key: formKeyEmail,
            child: Padding(
              padding: const EdgeInsets.only(top: 0, left: 20, right: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [


                  const DefaultText(
                    text: "email",
                    color: AppTheme.blackGP,
                    fontSize: 15,
                    fontWeight: FontWeight.bold,
                  ),

                  SizedBox(height: 0.02 * height),
                  DefaultFormField(
                      radius: 10,
                      prefixIcon:
                      Image.asset("assets/images/login_username.png"),
                      backgroundColor: AppTheme.whiteGP,
                      controller: emailController,
                      keyboardType: TextInputType.emailAddress,
                      labelText: "enter new email Address",
                      validator: (value) {
                        if (value!.isEmpty) {
                          return "Username cannot be empty, please enter valid email ";
                        }
                        if (!RegExp(
                            "^[a-zA-Z0-9+_.-]+@[a-zA-Z-9+_.-]+.[a-z]")
                            .hasMatch(value)) {
                          return " Please enter valid email format";
                        } else {
                          return null;
                        }
                      }),

SizedBox(height: 0.04 * height,),
                  ///button
                  Padding(
                    padding: const EdgeInsets.all(20),
                    child: defaultButton(
                        text: 'Save',
                        radius: 25,
                        backGround: AppTheme.blueButtonGP,
                        function: () async {
                          if (formKeyEmail.currentState!.validate()) {

                          await ProfileCubit.get(context).editProfile(
                                email: emailController.text,
                                );

                            emailController.clear();
                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(
                                content: Text('Email Updated Successfully'),
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
  } }

