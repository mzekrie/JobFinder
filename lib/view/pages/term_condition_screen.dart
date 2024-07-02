
import 'package:flutter/material.dart';
import '../../model/shared/colors_theme.dart';
import '../../router/router.dart';
import '../widget/default_text_field.dart';

class TermsConditionsScreen extends StatelessWidget {
  const TermsConditionsScreen({super.key});
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    //double width = MediaQuery.of(context).size.width;
    return  SafeArea(
      child: Scaffold(
        appBar:  AppBar(

          leading:IconButton(
              onPressed: (){
                Navigator.of(context).popAndPushNamed(AppRoute.profileScreen);
              },
              icon: Image.asset("assets/images/arrow-left.png",)),
          centerTitle: true,
          title: const Text("Terms & Conditions",),
      
        ),
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const DefaultText(
                  text: "Your Terms & Conditions is important",
                  color: AppTheme.blackGP,
                  fontSize: 15,
                  fontWeight: FontWeight.bold,
                ),
                SizedBox(height: height * 0.02,),
                const DefaultText(
                  text: "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nam vel augue sit amet est molestie viverra. Nunc quis bibendum orci. Donec feugiat massa mi, at hendrerit mauris rutrum at. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nam vel augue sit amet est molestie viverra. Nunc quis bibendum orci. Donec feugiat massa mi, at hendrerit mauris rutrum at. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nam vel augue sit amet est molestie viverra. Nunc quis bibendum orci. Donec feugiat massa mi, at hendrerit mauris rutrum at. ",
                  color: AppTheme.grayGP,
                  fontSize: 12,
                  fontWeight: FontWeight.normal,
                ),
                SizedBox(height: height * 0.02,),
                const DefaultText(
                  text: "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nam vel augue sit amet est molestie viverra. Nunc quis bibendum orci. Donec feugiat massa mi, at hendrerit mauris rutrum at. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nam vel augue sit amet est molestie viverra. Nunc quis bibendum orci. Donec feugiat massa mi, at hendrerit mauris rutrum at. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nam vel augue sit amet est molestie viverra. Nunc quis bibendum orci. Donec feugiat massa mi, at hendrerit mauris rutrum at. ",
                  color: AppTheme.grayGP,
                  fontSize: 12,
                  fontWeight: FontWeight.normal,
                ),
                SizedBox(height: height * 0.02,),
                const DefaultText(
                  text: "Lorem ipsum dolor Agree on Terms & Conditions Lorem ipsum dolor",
                  color: AppTheme.blackGP,
                  fontSize: 15,
                  fontWeight: FontWeight.bold,
                ),
                SizedBox(height: height * 0.02,),
                const DefaultText(
                  text: "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nam vel augue sit amet est molestie viverra. Nunc quis bibendum orci. Donec feugiat massa mi, at hendrerit mauris rutrum at. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nam vel augue sit amet est molestie viverra. Nunc quis bibendum orci. Donec feugiat massa mi, at hendrerit mauris rutrum at. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nam vel augue sit amet est molestie viverra. Nunc quis bibendum orci. Donec feugiat massa mi, at hendrerit mauris rutrum at. ",
                  color: AppTheme.grayGP,
                  fontSize: 12,
                  fontWeight: FontWeight.normal,
                ),
                SizedBox(height: height * 0.02,),
                Container(
                  padding: EdgeInsets.all(8.0),
                  // color: AppTheme.grayGP,
                  height: 0.1*height,
                  width: double.infinity,
                  decoration:
                  BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color:  AppTheme.profile_baby_blue),
                  child: const DefaultText(
                    text: "Nunc quis bibendum orci. Donec feugiat massa mi, at hendrerit mauris rutrum at. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nam vel augue sit amet est molestie viverra. Nunc quis bibendum orci. Donec feugiat massa mi, at hendrerit mauris rutrum at. ",
                  color: AppTheme.grayGP,
                  fontSize: 12,
                  fontWeight: FontWeight.normal,
                ),
                ),
                SizedBox(height: height * 0.02,),
                const DefaultText(
                  text: "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nam vel augue sit amet est molestie viverra. Nunc quis bibendum orci. Donec feugiat massa mi, at hendrerit mauris rutrum at. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nam vel augue sit amet est molestie viverra. Nunc quis bibendum orci. Donec feugiat massa mi, at hendrerit mauris rutrum at. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nam vel augue sit amet est molestie viverra. Nunc quis bibendum orci. Donec feugiat massa mi, at hendrerit mauris rutrum at. ",
                  color: AppTheme.grayGP,
                  fontSize: 12,
                  fontWeight: FontWeight.normal,
                ),
                SizedBox(height: height * 0.02,),
                const DefaultText(
                  text: "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nam vel augue sit amet est molestie viverra. Nunc quis bibendum orci. Donec feugiat massa mi, at hendrerit mauris rutrum at. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nam vel augue sit amet est molestie viverra. Nunc quis bibendum orci. Donec feugiat massa mi, at hendrerit mauris rutrum at. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nam vel augue sit amet est molestie viverra. Nunc quis bibendum orci. Donec feugiat massa mi, at hendrerit mauris rutrum at. ",
                  color: AppTheme.grayGP,
                  fontSize: 12,
                  fontWeight: FontWeight.normal,
                ),
                SizedBox(height: height * 0.02,),
                const DefaultText(
                  text: "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nam vel augue sit amet est molestie viverra. Nunc quis bibendum orci. Donec feugiat massa mi, at hendrerit mauris rutrum at. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nam vel augue sit amet est molestie viverra. Nunc quis bibendum orci. Donec feugiat massa mi, at hendrerit mauris rutrum at. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nam vel augue sit amet est molestie viverra. Nunc quis bibendum orci. Donec feugiat massa mi, at hendrerit mauris rutrum at. ",
                  color: AppTheme.grayGP,
                  fontSize: 12,
                  fontWeight: FontWeight.normal,
                ),
                SizedBox(height: height * 0.02,),
                const DefaultText(
                  text: "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nam vel augue sit amet est molestie viverra. Nunc quis bibendum orci. Donec feugiat massa mi, at hendrerit mauris rutrum at. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nam vel augue sit amet est molestie viverra. Nunc quis bibendum orci. Donec feugiat massa mi, at hendrerit mauris rutrum at. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nam vel augue sit amet est molestie viverra. Nunc quis bibendum orci. Donec feugiat massa mi, at hendrerit mauris rutrum at. ",
                  color: AppTheme.grayGP,
                  fontSize: 12,
                  fontWeight: FontWeight.normal,
                ),
                SizedBox(height: height * 0.02,),
                const DefaultText(
                  text: "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nam vel augue sit amet est molestie viverra. Nunc quis bibendum orci. Donec feugiat massa mi, at hendrerit mauris rutrum at. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nam vel augue sit amet est molestie viverra. Nunc quis bibendum orci. Donec feugiat massa mi, at hendrerit mauris rutrum at. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nam vel augue sit amet est molestie viverra. Nunc quis bibendum orci. Donec feugiat massa mi, at hendrerit mauris rutrum at. ",
                  color: AppTheme.grayGP,
                  fontSize: 12,
                  fontWeight: FontWeight.normal,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
} // end of statlessWidget