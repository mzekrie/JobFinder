import 'package:flutter/material.dart';
import '../../model/shared/colors_theme.dart';
import '../../model/shared/constant_attribute.dart';
import '../../router/router.dart';
import '../widget/default_button.dart';
import '../widget/default_form_field.dart';
import '../widget/default_text_field.dart';
//import '../../model/shared/cache_helper.dart';
//import '../../model/shared/enum.dart';

class ForgetPasswordScreen_1 extends StatelessWidget {
  const ForgetPasswordScreen_1({super.key});

  //TextEditingController emailController = TextEditingController();
  //TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      body: SafeArea(
        child:Stack(
          children:[
            Positioned(
                right: 20.0,top:30.0,
                child: Image.asset('assets/images/Logo_small.png')),
            Center(
              child: SingleChildScrollView(
                child: Form(
                  key: formKey,
                  child: Padding(
                    padding: const EdgeInsets.only(top: 0, left: 20, right: 20),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        const SizedBox(height: 20),
                        const DefaultText(
                          text: "Reset Password",
                          color: AppTheme.blackGP,
                          fontSize: 30,
                          fontWeight: FontWeight.bold,
                        ),
                        const DefaultText(
                          text: "Enter the email address you used when you joined and we’ll send you instructions to reset your password.",
                          color: AppTheme.grayGP,
                          fontSize: 20,
                          fontWeight: FontWeight.normal,
                        ),
                        const SizedBox(
                            height: 30),
                        DefaultFormField(
                            radius: 10,
                            prefixIcon:
                            Image.asset("assets/images/login_email.png"),
                            backgroundColor: AppTheme.whiteGP,
                            controller: emailController,
                            keyboardType: TextInputType.emailAddress,
                            labelText: "enter your email username ",
                            validator: (value) {
                              if (value!.isEmpty) {
                                return "Username cannot be empty, please enter valid email ";
                              }
                              if (!RegExp("^[a-zA-Z0-9+_.-]+@[a-zA-Z-9+_.-]+.[a-z]")
                                  .hasMatch(value)) {
                                return " Please enter valid email format";
                              } else {
                                return null;
                              }
                            }),
                        const SizedBox(height: 20),


                        //remember me and forget password
                        //  register
                        const SizedBox(height: 40),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              const Text(" You remember your password "),
                              InkWell(
                                onTap: () {
                                  Navigator.of(context)
                                      .pushReplacementNamed("LoginScreen");
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
                        Padding(padding: const EdgeInsets.only( top:20, left: 20, right: 20),
                          child: defaultButton(
                              text: 'Request password reset',
                              width: 300,
                              height: 40,
                              radius: 25,
                              backGround: AppTheme.blueButtonGP,
                              function: () async {
                                if (formKey.currentState!.validate()) {
                                  // await AuthCubit.get(context).loginByEmailAndPassword
                                  //   (email: emailController.text,
                                  //     password: passwordController.text);
                                  // CacheHelper.putString(key: SharedKeys.email, value: emailController.text,);
                                  // CacheHelper.putString(key: SharedKeys.password, value: passwordController.text,);
                                  Navigator.of(context).pushNamedAndRemoveUntil(
                                      AppRoute.forgetPasswordScreen_2, (route) => false);
                                }
                              }),),

                      ],
                    ),
                  ),
                ),
              ),
            ),
          ],),
      ),
    );
  }
}
