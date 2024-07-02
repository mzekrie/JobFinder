import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
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
//import '../../model/shared/cache_helper.dart';
//import '../../model/shared/enum.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  //TextEditingController emailController = TextEditingController();
  bool _isRememberMe = false;
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;

    return BlocBuilder<LoginCubit, LoginState>(
      builder: (context, state) {
        return Scaffold(
          body: SafeArea(
            child: Stack(
              children: [
                Positioned(
                    right: 20.0,
                    top: 30.0,
                    child: Image.asset('assets/images/Logo_small.png')),
                Center(
                  child: SingleChildScrollView(
                    child: Form(
                      key: formKey,
                      child: Padding(
                        padding:
                            const EdgeInsets.only(top: 0, left: 20, right: 20),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            SizedBox(height: 0.02 * height),
                            const DefaultText(
                              text: "Login",
                              color: AppTheme.blackGP,
                              fontSize: 30,
                              fontWeight: FontWeight.bold,
                            ),
                            const DefaultText(
                              text: "Please login to find your dream job",
                              color: AppTheme.grayGP,
                              fontSize: 20,
                              fontWeight: FontWeight.normal,
                            ),
                            SizedBox(height: 0.02 * height),
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
                            SizedBox(height: 0.02 * height),

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
                            SizedBox(height: 0.02 * height),

                            ///remember me and forget password
                            Row(
                              children: [
                                Checkbox(
                                    side: const BorderSide(
                                      color: AppTheme.grayGP,
                                    ),
                                    activeColor: AppTheme.blueButtonGP,
                                    checkColor: AppTheme.whiteGP,
                                    value: _isRememberMe,
                                    onChanged: (value) {
                                      setState(() {
                                        _isRememberMe = value!;
                                        CacheHelper.putBOOL(
                                            key: SharedKeys.rememberMeLogin,
                                            value: _isRememberMe);
                                      });
                                    }),
                                const DefaultText(
                                  text: " Remember me",
                                  color: AppTheme.grayGP,
                                  fontSize: 15,
                                  fontWeight: FontWeight.normal,
                                ),
                                SizedBox(width: 0.1 * width),
                                InkWell(
                                  onTap: () {
                                    Navigator.of(context).pushReplacementNamed(
                                        "ForgetPasswordScreen_1");
                                  },
                                  child: const Text(
                                    "      Forgot Password?",
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 15,
                                        color: AppTheme.blueButtonGP),
                                  ),
                                ),
                              ],
                            ),
                            //  register
                            SizedBox(height: 0.02 * height),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  const Text(" Dont’t have an account? "),
                                  InkWell(
                                    onTap: () {
                                      Navigator.of(context)
                                          .pushReplacementNamed(
                                              "RegisterScreen");
                                    },
                                    child: const DefaultText(
                                      text: " Register",
                                      color: AppTheme.blueButtonGP,
                                      fontSize: 15,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(
                                  top: 20, left: 20, right: 20),
                              child: defaultButton(
                                  text: 'Login',
                                  radius: 25,
                                  backGround: AppTheme.blueButtonGP,
                                  function: () async {
                                    if (formKey.currentState!.validate()) {
                                      String? validate =
                                          await LoginCubit.get(context)
                                              .loginByEmailAndPassword(
                                                  email: emailController.text,
                                                  password:
                                                      passwordController.text);
                                      if (validate != ('errorLogin')) {
                                        await CacheHelper.putString(
                                          key: SharedKeys.email,
                                          value: emailController.text,
                                        );
                                        await CacheHelper.putString(
                                          key: SharedKeys.password,
                                          value: passwordController.text,
                                        );
                                        // await CacheHelper.putString(
                                        //   key: SharedKeys.token,
                                        //   value: _validate!,
                                        // );

                                        emailController.clear();
                                        passwordController.clear();

                                        Navigator.of(context)
                                            .pushNamedAndRemoveUntil(
                                                AppRoute.homeScreen,
                                                (route) => false);

                                        Fluttertoast.showToast(
                                          msg: "Login Successfully!",
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
                                                "Incorrect Username or password",
                                            toastLength: Toast.LENGTH_SHORT,
                                            gravity: ToastGravity.BOTTOM,
                                            timeInSecForIosWeb: 3,
                                            backgroundColor: Colors.red,
                                            textColor: Colors.white,
                                            fontSize: 16.0);
                                      }
                                    } else {}
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
                                  text: " Or Login With Account",
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
                                SizedBox(
                                  width: 0.4 * width,
                                  height: 0.05 * height,
                                  child: OutlinedButton(
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

                                        DefaultText(
                                          text: " Google",
                                          color: AppTheme.blackGP,
                                          fontSize: 15,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  width: 0.02 * width,
                                ),
                                SizedBox(
                                  width: 0.4 * width,
                                  height: 0.05 * height,
                                  child: OutlinedButton(
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
                                        DefaultText(
                                          text: " Facebook",
                                          color: AppTheme.blackGP,
                                          fontSize: 15,
                                          fontWeight: FontWeight.bold,
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
