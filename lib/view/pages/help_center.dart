

import 'package:flutter/material.dart';

import '../../model/shared/colors_theme.dart';
import '../../router/router.dart';
import '../widget/default_text_field.dart';
//import 'package:flutter_bloc/flutter_bloc.dart';

class HelpCenterScreen extends StatelessWidget {
  const HelpCenterScreen({super.key});
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return  SafeArea(
      child: Scaffold(
        appBar:  AppBar(
          backgroundColor: AppTheme.whiteGP,
          leading:IconButton(
              onPressed: (){
                Navigator.of(context).popAndPushNamed(AppRoute.profileScreen);
              },
              icon: Image.asset("assets/images/arrow-left.png",)),
          centerTitle: true,
          title: const Text("Help Center",),

        ),
        body: Container(
          color:AppTheme.whiteGP,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: SingleChildScrollView(
              scrollDirection: Axis.vertical,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: 0.02 * height,
                  ),
                  Container(
                    child: TextFormField(
                      decoration: InputDecoration(
                        contentPadding: const EdgeInsets.symmetric(vertical: 2),
                        hintText: "What can we help?",
                        constraints: BoxConstraints(
                          maxHeight: 0.06 * height,
                          maxWidth: 0.94 * width,
                        ),
                        prefixIcon: const Icon(
                          Icons.search,
                          color: AppTheme.gray,
                        ),
                        border: OutlineInputBorder(
                          borderSide: BorderSide(width: 0.05, color:AppTheme.gray2),
                          borderRadius: BorderRadius.circular(35.5),

                        ),
                        fillColor: AppTheme.whiteGP,
                        filled: true,
                      ),
                      keyboardType: TextInputType.text,
                    ),
                  ),
                  SizedBox(height: 0.02* height,),
                  ExpansionTile(
                    backgroundColor: AppTheme.whiteGP,
                    collapsedBackgroundColor: AppTheme.profile_baby_blue,
                    title: const DefaultText(
                      text: "Lorem ipsum dolor sit amet",
                      color: AppTheme.blackGP,
                      fontSize: 12,
                      fontWeight: FontWeight.bold,
                    ),
                    children: <Widget>[
                      ListTile(
                        title: const DefaultText(
                          text: "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nam vel augue sit amet est molestie viverra. Nunc quis bibendum orci. Donec feugiat massa mi, at hendrerit mauris rutrum at. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nam vel augue sit amet est molestie viverra. Nunc quis bibendum orci. Donec feugiat massa mi, at hendrerit mauris rutrum at. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nam vel augue sit amet est molestie viverra. Nunc quis bibendum orci. Donec feugiat massa mi, at hendrerit mauris rutrum at. ",
                          color: AppTheme.grayGP,
                          fontSize: 12,
                          fontWeight: FontWeight.normal,
                        ),
                      )
                    ],
                  ),
                  SizedBox(height: 0.02* height,),
                  ExpansionTile(
                    backgroundColor: AppTheme.whiteGP,
                    collapsedBackgroundColor: AppTheme.profile_baby_blue,
                    title: const DefaultText(
                      text: "Lorem ipsum dolor sit amet",
                      color: AppTheme.blackGP,
                      fontSize: 12,
                      fontWeight: FontWeight.bold,
                    ),
                    children: <Widget>[
                      ListTile(
                        title: const DefaultText(
                          text: "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nam vel augue sit amet est molestie viverra. Nunc quis bibendum orci. Donec feugiat massa mi, at hendrerit mauris rutrum at. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nam vel augue sit amet est molestie viverra. Nunc quis bibendum orci. Donec feugiat massa mi, at hendrerit mauris rutrum at. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nam vel augue sit amet est molestie viverra. Nunc quis bibendum orci. Donec feugiat massa mi, at hendrerit mauris rutrum at. ",
                          color: AppTheme.grayGP,
                          fontSize: 12,
                          fontWeight: FontWeight.normal,
                        ),
                      )
                    ],
                  ),
                  SizedBox(height: 0.02* height,),
                  ExpansionTile(
                    backgroundColor: AppTheme.whiteGP,
                    collapsedBackgroundColor: AppTheme.profile_baby_blue,
                    title: const DefaultText(
                      text: "Lorem ipsum dolor sit amet",
                      color: AppTheme.blackGP,
                      fontSize: 12,
                      fontWeight: FontWeight.bold,
                    ),
                    children: <Widget>[
                      ListTile(
                        title: const DefaultText(
                          text: "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nam vel augue sit amet est molestie viverra. Nunc quis bibendum orci. Donec feugiat massa mi, at hendrerit mauris rutrum at. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nam vel augue sit amet est molestie viverra. Nunc quis bibendum orci. Donec feugiat massa mi, at hendrerit mauris rutrum at. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nam vel augue sit amet est molestie viverra. Nunc quis bibendum orci. Donec feugiat massa mi, at hendrerit mauris rutrum at. ",
                          color: AppTheme.grayGP,
                          fontSize: 12,
                          fontWeight: FontWeight.normal,
                        ),
                      )
                    ],
                  ),
                  SizedBox(height: 0.02* height,),
                  ExpansionTile(
                    backgroundColor: AppTheme.whiteGP,
                    collapsedBackgroundColor: AppTheme.profile_baby_blue,
                    title: const DefaultText(
                      text: "Lorem ipsum dolor sit amet",
                      color: AppTheme.blackGP,
                      fontSize: 12,
                      fontWeight: FontWeight.bold,
                    ),
                    children: <Widget>[
                      ListTile(
                        title: const DefaultText(
                          text: "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nam vel augue sit amet est molestie viverra. Nunc quis bibendum orci. Donec feugiat massa mi, at hendrerit mauris rutrum at. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nam vel augue sit amet est molestie viverra. Nunc quis bibendum orci. Donec feugiat massa mi, at hendrerit mauris rutrum at. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nam vel augue sit amet est molestie viverra. Nunc quis bibendum orci. Donec feugiat massa mi, at hendrerit mauris rutrum at. ",
                          color: AppTheme.grayGP,
                          fontSize: 12,
                          fontWeight: FontWeight.normal,
                        ),
                      )
                    ],
                  ),
                  SizedBox(height: 0.02* height,),
                  ExpansionTile(
                    backgroundColor: AppTheme.whiteGP,
                    collapsedBackgroundColor: AppTheme.profile_baby_blue,
                    title: const DefaultText(
                      text: "Lorem ipsum dolor sit amet",
                      color: AppTheme.blackGP,
                      fontSize: 12,
                      fontWeight: FontWeight.bold,
                    ),
                    children: <Widget>[
                      ListTile(
                        title: const DefaultText(
                          text: "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nam vel augue sit amet est molestie viverra. Nunc quis bibendum orci. Donec feugiat massa mi, at hendrerit mauris rutrum at. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nam vel augue sit amet est molestie viverra. Nunc quis bibendum orci. Donec feugiat massa mi, at hendrerit mauris rutrum at. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nam vel augue sit amet est molestie viverra. Nunc quis bibendum orci. Donec feugiat massa mi, at hendrerit mauris rutrum at. ",
                          color: AppTheme.grayGP,
                          fontSize: 12,
                          fontWeight: FontWeight.normal,
                        ),
                      )
                    ],
                  ),
                  SizedBox(height: 0.02* height,),
                  ExpansionTile(
                    backgroundColor: AppTheme.whiteGP,
                    collapsedBackgroundColor: AppTheme.profile_baby_blue,
                    title: const DefaultText(
                      text: "Lorem ipsum dolor sit amet",
                      color: AppTheme.blackGP,
                      fontSize: 12,
                      fontWeight: FontWeight.bold,
                    ),
                    children: <Widget>[
                      ListTile(
                        title: const DefaultText(
                          text: "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nam vel augue sit amet est molestie viverra. Nunc quis bibendum orci. Donec feugiat massa mi, at hendrerit mauris rutrum at. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nam vel augue sit amet est molestie viverra. Nunc quis bibendum orci. Donec feugiat massa mi, at hendrerit mauris rutrum at. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nam vel augue sit amet est molestie viverra. Nunc quis bibendum orci. Donec feugiat massa mi, at hendrerit mauris rutrum at. ",
                          color: AppTheme.grayGP,
                          fontSize: 12,
                          fontWeight: FontWeight.normal,
                        ),
                      )
                    ],
                  ),
                  SizedBox(height: 0.02* height,),
                  ExpansionTile(
                    backgroundColor: AppTheme.whiteGP,
                    collapsedBackgroundColor: AppTheme.profile_baby_blue,
                    title: const DefaultText(
                      text: "Lorem ipsum dolor sit amet",
                      color: AppTheme.blackGP,
                      fontSize: 12,
                      fontWeight: FontWeight.bold,
                    ),
                    children: <Widget>[
                      ListTile(
                        title: const DefaultText(
                          text: "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nam vel augue sit amet est molestie viverra. Nunc quis bibendum orci. Donec feugiat massa mi, at hendrerit mauris rutrum at. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nam vel augue sit amet est molestie viverra. Nunc quis bibendum orci. Donec feugiat massa mi, at hendrerit mauris rutrum at. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nam vel augue sit amet est molestie viverra. Nunc quis bibendum orci. Donec feugiat massa mi, at hendrerit mauris rutrum at. ",
                          color: AppTheme.grayGP,
                          fontSize: 12,
                          fontWeight: FontWeight.normal,
                        ),
                      )
                    ],
                  ),






                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
} // end of statlessWidget