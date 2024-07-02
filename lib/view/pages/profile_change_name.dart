import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import '../../control/cubit/auth/login_cubit.dart';
import '../../model/shared/cache_helper.dart';
import '../../model/shared/colors_theme.dart';
import '../../model/shared/constant_attribute.dart';
import '../../model/shared/enum.dart';
import '../../router/router.dart';
import '../widget/default_button.dart';
import '../widget/default_form_field.dart';
import '../widget/default_text_field.dart';


class ChangeNameScreen extends StatelessWidget {
  const ChangeNameScreen({super.key});

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
          "Change Full Name ",
        ),
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Form(
            key: formKey,
            child: Padding(
              padding: const EdgeInsets.only(top: 0, left: 20, right: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [


                  const DefaultText(
                    text: "Full Name ",
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
                      controller: nameController,
                      keyboardType: TextInputType.text,
                      labelText: "enter new name",
                      validator: (value) {
                        if (value!.isEmpty) {
                          return "Username cannot be empty ";
                        }
                        else {
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
                          if (formKey.currentState!.validate()) {

    String? validate = await LoginCubit.get(context).updateName(
                              name: nameController.text,
                            );

    if (validate != ('error')) {

      CacheHelper.putString(key: SharedKeys.name, value: nameController.text);
      Navigator.of(context)
          .pushNamedAndRemoveUntil(
          AppRoute.profileScreen,
              (route) => false);

      nameController.clear();

      Fluttertoast.showToast(
        msg: "Name changed Successfully",
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
        timeInSecForIosWeb: 5,
        backgroundColor: Colors.green,
        textColor: Colors.white,
        fontSize: 16.0,
      );
    } else {
      Fluttertoast.showToast(
          msg:
          "Incorrect updating trial ",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.BOTTOM,
          timeInSecForIosWeb: 3,
          backgroundColor: Colors.red,
          textColor: Colors.white,
          fontSize: 16.0);
    }
                          } else {
                            Fluttertoast.showToast(
                              msg: "Incorrect updating  trial ",
                              toastLength: Toast.LENGTH_SHORT,
                              gravity: ToastGravity.BOTTOM,
                              timeInSecForIosWeb: 3,
                              backgroundColor: Colors.red,
                              textColor: Colors.white,
                              fontSize: 16.0,
                            );
                          }

                          }),
                  ),//paading
                ],
              ),
            ),
          ),
        ),
      ),
    );
  } }

