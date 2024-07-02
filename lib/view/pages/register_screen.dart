import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:gp_amit60_mary_zekrie/control/cubit/register/register_cubit.dart';
import '../../model/shared/colors_theme.dart';
import '../../model/shared/constant_attribute.dart';
import '../../router/router.dart';
import '../widget/default_button.dart';
import '../widget/default_form_field.dart';
import '../widget/default_text_field.dart';

class RegisterScreen extends StatelessWidget {
  const RegisterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return BlocBuilder<RegisterCubit, RegisterState>(
      builder: (context, state) {
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
                    child: Form(
                      key: formKeyRegister,
                      child: Padding(
                        padding:
                            const EdgeInsets.only(top: 0, left: 20, right: 20),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            const SizedBox(
                              height: 20,
                            ),
                            const DefaultText(
                              text: "Create Account",
                              color: AppTheme.blackGP,
                              fontSize: 30,
                              fontWeight: FontWeight.bold,
                            ),
                            const DefaultText(
                              text:
                                  "Please create an account to find your dream job",
                              color: AppTheme.grayGP,
                              fontSize: 20,
                              fontWeight: FontWeight.normal,
                            ),
                            const SizedBox(
                              height: 30,
                            ),
                            DefaultFormField(
                                controller: nameController,
                                prefixIcon: Image.asset(
                                    "assets/images/login_username.png"),
                                backgroundColor: AppTheme.whiteGP,
                                labelText: "Full Name",
                                keyboardType: TextInputType.text,
                                validator: (value) {
                                  if (value!.length <= 3) {
                                    return "Name length should be 3 or more characters ";
                                  }
                                  return null;
                                }),
                            const SizedBox(
                              height: 20,
                            ),
                            DefaultFormField(
                                radius: 10,
                                prefixIcon: Image.asset(
                                    "assets/images/login_email.png"),
                                backgroundColor: AppTheme.whiteGP,
                                controller: emailController,
                                keyboardType: TextInputType.emailAddress,
                                labelText: "Username/email",
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
                            const SizedBox(
                              height: 20,
                            ),
                            DefaultFormField(
                                controller: passwordController,
                                prefixIcon: Image.asset(
                                    "assets/images/login_password.png"),
                                suffixIcon: Image.asset(
                                    "assets/images/login_eye_close.png"),
                                backgroundColor: AppTheme.whiteGP,
                                labelText: "Password",
                                keyboardType: TextInputType.visiblePassword,
                                validator: (value) {
                                  if (value!.length <= 8) {
                                    return "Password length should be 8 or more characters ";
                                  }
                                  return null;
                                }),
                            const SizedBox(
                              height: 10,
                            ),
                            const Text(
                              "Password must be at least 8 characters",
                              style: TextStyle(
                                  fontSize: 15,
                                  fontWeight: FontWeight.normal,
                                  color: AppTheme.greenGP),
                            ),
                            const SizedBox(
                              height: 20,
                            ),

                            //remember me and forget password
                            const Padding(
                              padding: EdgeInsets.all(8.0),
                            ),
                            //  register
                            const SizedBox(
                              height: 90,
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  const Text(
                                    " Already have an account? ",
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 15,
                                        color: AppTheme.grayGP),
                                  ),
                                  InkWell(
                                    onTap: () {
                                      Navigator.of(context)
                                          .pushReplacementNamed("loginScreen");
                                    },
                                    child: const Text(
                                      " Login",
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 15,
                                          color: AppTheme.blueButtonGP),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(
                                  top: 20, left: 20, right: 20),
                              child: defaultButton(
                                  text: 'Create Account',
                                  width: 300,
                                  height: 40,
                                  radius: 25,
                                  backGround: AppTheme.blueButtonGP,
                                  function: () async {
                                    if (formKeyRegister.currentState!
                                        .validate()) {
                                      String? _validate =
                                          await RegisterCubit.get(context)
                                              .RegisterByEmailAndPassword(
                                                  user_name:
                                                      nameController.text,
                                                  user_email:
                                                      emailController.text,
                                                  user_password:
                                                      passwordController.text);

                                      if (_validate != ('errorLogin')) {
                                        nameController.clear();
                                        emailController.clear();
                                        passwordController.clear();

                                        Navigator.of(context)
                                            .pushNamedAndRemoveUntil(
                                                AppRoute.loginScreen,
                                                (route) => false);

                                        Fluttertoast.showToast(
                                          msg: "Register Successfully!",
                                          toastLength: Toast.LENGTH_SHORT,
                                          gravity: ToastGravity.BOTTOM,
                                          timeInSecForIosWeb: 3,
                                          backgroundColor: Colors.green,
                                          textColor: Colors.white,
                                          fontSize: 16.0,
                                        );
                                      } else {
                                        Fluttertoast.showToast(
                                            msg:
                                                "Incorrect registration trial ",
                                            toastLength: Toast.LENGTH_SHORT,
                                            gravity: ToastGravity.BOTTOM,
                                            timeInSecForIosWeb: 3,
                                            backgroundColor: Colors.red,
                                            textColor: Colors.white,
                                            fontSize: 16.0);
                                      }
                                    } else {
                                      Fluttertoast.showToast(
                                        msg: "Incorrect registration trial ",
                                        toastLength: Toast.LENGTH_SHORT,
                                        gravity: ToastGravity.BOTTOM,
                                        timeInSecForIosWeb: 3,
                                        backgroundColor: Colors.red,
                                        textColor: Colors.white,
                                        fontSize: 16.0,
                                      );
                                    }
                                  }),
                            ),
                            SizedBox(height: 0.04 * height),
                            Row(
                              children: [
                                Expanded(
                                  child: Divider(
                                    height: 0.02 * height,
                                    thickness: 1.0,
                                    color: AppTheme.grayGP,
                                    indent: 20,
                                    endIndent: 10,
                                  ),
                                ),
                                const DefaultText(
                                  text: " Or Register With Account",
                                  color: AppTheme.grayGP,
                                  fontSize: 15,
                                  fontWeight: FontWeight.normal,
                                ),
                                Expanded(
                                  child: Divider(
                                    height: 0.02 * height,
                                    thickness: 1.0,
                                    color: AppTheme.grayGP,
                                    indent: 10,
                                    endIndent: 20,
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(height: 0.04 * height),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                OutlinedButton(
                                  onPressed: () {},
                                  child: const Row(
                                    children: [
                                      //Icon(Icons.email),
                                      SizedBox(
                                          height: 20,
                                          width: 30,
                                          child: Image(
                                              image: AssetImage(
                                            'assets/images/login_google.png',
                                          ))),
                                      Text(
                                        '  Google',
                                        style: TextStyle(
                                          color: Colors.black,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                const SizedBox(
                                  width: 10,
                                ),
                                OutlinedButton(
                                  onPressed: () {},
                                  child: const Row(
                                    children: [
                                      //Icon(Icons.email),
                                      SizedBox(
                                          height: 20,
                                          width: 30,
                                          child: Image(
                                              image: AssetImage(
                                            'assets/images/login_fb.png',
                                          ))),
                                      Text(
                                        'Facebook',
                                        style: TextStyle(
                                          color: Colors.black,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
