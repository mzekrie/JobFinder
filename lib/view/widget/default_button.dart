import 'package:flutter/material.dart';
import '../../model/shared/colors_theme.dart';
Widget defaultButton ({
  double width = 300,
  double height = 40 ,
  double radius = 25,
  required String text ,
  Color backGround =  AppTheme.blueButtonGP,
  required Function function ,
}) => Container(
  width: width,
  height: height,
  decoration: BoxDecoration(
    borderRadius: BorderRadius.circular(radius),
    color: backGround,
  ),
  child: MaterialButton(
    onPressed: (){
      function();
    },
    child: Text(
      text,
      style: const TextStyle(
          fontSize: 20,
          color: AppTheme.whiteGP,
      ),
    ),
  ) ,
);



/// example
// Center(
// child: defaultButton(
// text: 'Verify',
// width: 0.7* width,
// height: 0.06 * height,
// radius: 25,
// backGround: AppTheme.blueButtonGP,
// function: () async {
// if (formKey.currentState!.validate()) {
// // await AuthCubit.get(context).loginByEmailAndPassword
// //   (email: emailController.text,
// //     password: passwordController.text);
// // CacheHelper.putString(key: SharedKeys.email, value: emailController.text,);
// // CacheHelper.putString(key: SharedKeys.password, value: passwordController.text,);
// Navigator.of(context).pushNamedAndRemoveUntil(
// AppRoute.homeScreen, (route) => false);
// }
// }),
// ),