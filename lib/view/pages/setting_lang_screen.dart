import 'package:flutter/material.dart';

import '../../model/shared/colors_theme.dart';
import '../../router/router.dart';
//import 'package:flutter_bloc/flutter_bloc.dart';

class SettingsLanguageScreen extends StatefulWidget {
   const SettingsLanguageScreen({super.key});

  @override
  State<SettingsLanguageScreen> createState() => _SettingsLanguageScreenState();
}

class _SettingsLanguageScreenState extends State<SettingsLanguageScreen> {
  int _paymentType = 1;
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;

    return  Scaffold(
      appBar:  AppBar(
        backgroundColor: AppTheme.whiteGP,
        leading:IconButton(
            onPressed: (){
              Navigator.of(context).popAndPushNamed(AppRoute.profileScreen);
            },
            icon: Image.asset("assets/images/arrow-left.png",)),
        centerTitle: true,
        title: const Text("Language",),

      ),
      body: Container(
        color:AppTheme.whiteGP,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child:  ListView(
            shrinkWrap: true,
            children: [
              RadioListTile(
                value: 1,
                controlAffinity: ListTileControlAffinity.trailing,
                tileColor: AppTheme.blueButtonGP,
                selectedTileColor:AppTheme.blueButtonGP ,
                activeColor: AppTheme.blueButtonGP,
                hoverColor:AppTheme.grayLightGP,
                title: Row(
                  children: <Widget>[
                    Expanded(
                      flex: 1,
                      child: Image.asset("assets/images/lang_1.png"),

                    ),
                    Expanded(
                      flex: 3,
                      child: Text(
                        "Arabic",
                        overflow: TextOverflow.ellipsis,
                        maxLines: 3,
                        style: TextStyle(color: AppTheme.blackGP, fontSize: 15.0),
                      ),
                    ),

                  ],
                ),
                groupValue: _paymentType,
                onChanged: (val) => setState(() {
                  _paymentType = val! as int;
                }),
              ),
              Divider(thickness:1, color: AppTheme.gray,),
              RadioListTile(
                controlAffinity: ListTileControlAffinity.trailing,
                tileColor: AppTheme.blueButtonGP,
                selectedTileColor:AppTheme.blueButtonGP ,
                activeColor: AppTheme.blueButtonGP,
                hoverColor:AppTheme.grayLightGP,
                value: 2,
                title: Row(
                  children: <Widget>[
                    Expanded(
                      flex: 1,
                      child: Image.asset("assets/images/lang_2.png"),

                    ),
                    Expanded(
                      flex: 3,
                      child: Text(
                        "Arabic",
                        overflow: TextOverflow.ellipsis,
                        maxLines: 3,
                        style: TextStyle(color: AppTheme.blackGP, fontSize: 15.0),
                      ),
                    ),

                  ],
                ),
                groupValue: _paymentType,
                onChanged: (val) => setState(() {
                  _paymentType = val! as int;
                }),
              ),
              Divider(thickness:1, color: AppTheme.gray,),
              RadioListTile(
                controlAffinity: ListTileControlAffinity.trailing,
                tileColor: AppTheme.blueButtonGP,
                selectedTileColor:AppTheme.blueButtonGP ,
                activeColor: AppTheme.blueButtonGP,
                hoverColor:AppTheme.grayLightGP,
                value: 3,
                title: Row(
                  children: <Widget>[
                    Expanded(
                      flex: 1,
                      child: Image.asset("assets/images/lang_3.png"),

                    ),
                    Expanded(
                      flex: 3,
                      child: Text(
                        "Arabic",
                        overflow: TextOverflow.ellipsis,
                        maxLines: 3,
                        style: TextStyle(color: AppTheme.blackGP, fontSize: 15.0),
                      ),
                    ),

                  ],
                ),
                groupValue: _paymentType,
                onChanged: (val) => setState(() {
                  _paymentType = val! as int;
                }),
              ),
              Divider(thickness:1, color: AppTheme.gray,),
              RadioListTile(
                controlAffinity: ListTileControlAffinity.trailing,
                tileColor: AppTheme.blueButtonGP,
                selectedTileColor:AppTheme.blueButtonGP ,
                activeColor: AppTheme.blueButtonGP,
                hoverColor:AppTheme.grayLightGP,
                value: 4,
                title: Row(
                  children: <Widget>[
                    Expanded(
                      flex: 1,
                      child: Image.asset("assets/images/lang_4.png"),

                    ),
                    Expanded(
                      flex: 3,
                      child: Text(
                        "Arabic",
                        overflow: TextOverflow.ellipsis,
                        maxLines: 3,
                        style: TextStyle(color: AppTheme.blackGP, fontSize: 15.0),
                      ),
                    ),

                  ],
                ),
                groupValue: _paymentType,
                onChanged: (val) => setState(() {
                  _paymentType = val! as int;
                }),
              ),
              Divider(thickness:1, color: AppTheme.gray,),
              RadioListTile(
                value: 5,
                controlAffinity: ListTileControlAffinity.trailing,
                tileColor: AppTheme.blueButtonGP,
                selectedTileColor:AppTheme.blueButtonGP ,
                activeColor: AppTheme.blueButtonGP,
                hoverColor:AppTheme.grayLightGP,
                title: Row(
                  children: <Widget>[
                    Expanded(
                      flex: 1,
                      child: Image.asset("assets/images/lang_5.png"),

                    ),
                    Expanded(
                      flex: 3,
                      child: Text(
                        "Arabic",
                        overflow: TextOverflow.ellipsis,
                        maxLines: 3,
                        style: TextStyle(color: AppTheme.blackGP, fontSize: 15.0),
                      ),
                    ),

                  ],
                ),
                groupValue: _paymentType,
                onChanged: (val) => setState(() {
                  _paymentType = val! as int;
                }),
              ),
              Divider(thickness:1, color: AppTheme.gray,),
              /////
              RadioListTile(
                value: 6,
                controlAffinity: ListTileControlAffinity.trailing,
                tileColor: AppTheme.blueButtonGP,
                selectedTileColor:AppTheme.blueButtonGP ,
                activeColor: AppTheme.blueButtonGP,
                hoverColor:AppTheme.grayLightGP,
                title: Row(
                  children: <Widget>[
                    Expanded(
                      flex: 1,
                      child: Image.asset("assets/images/lang_6.png"),

                    ),
                    Expanded(
                      flex: 3,
                      child: Text(
                        "Arabic",
                        overflow: TextOverflow.ellipsis,
                        maxLines: 3,
                        style: TextStyle(color: AppTheme.blackGP, fontSize: 15.0),
                      ),
                    ),

                  ],
                ),
                groupValue: _paymentType,
                onChanged: (val) => setState(() {
                  _paymentType = val! as int;
                }),
              ),
              Divider(thickness:1, color: AppTheme.gray,),
              RadioListTile(
                value: 7,
                controlAffinity: ListTileControlAffinity.trailing,
                tileColor: AppTheme.blueButtonGP,
                selectedTileColor:AppTheme.blueButtonGP ,
                activeColor: AppTheme.blueButtonGP,
                hoverColor:AppTheme.grayLightGP,
                title: Row(
                  children: <Widget>[
                    Expanded(
                      flex: 1,
                      child: Image.asset("assets/images/lang_7.png"),

                    ),
                    Expanded(
                      flex: 3,
                      child: Text(
                        "Arabic",
                        overflow: TextOverflow.ellipsis,
                        maxLines: 3,
                        style: TextStyle(color: AppTheme.blackGP, fontSize: 15.0),
                      ),
                    ),

                  ],
                ),
                groupValue: _paymentType,
                onChanged: (val) => setState(() {
                  _paymentType = val! as int;
                }),
              ),
              Divider(thickness:1, color: AppTheme.gray,),
              RadioListTile(
                value: 8,
                controlAffinity: ListTileControlAffinity.trailing,
                tileColor: AppTheme.blueButtonGP,
                selectedTileColor:AppTheme.blueButtonGP ,
                activeColor: AppTheme.blueButtonGP,
                hoverColor:AppTheme.grayLightGP,
                title: Row(
                  children: <Widget>[
                    Expanded(
                      flex: 1,
                      child: Image.asset("assets/images/lang_8.png"),

                    ),
                    Expanded(
                      flex: 3,
                      child: Text(
                        "Arabic",
                        overflow: TextOverflow.ellipsis,
                        maxLines: 3,
                        style: TextStyle(color: AppTheme.blackGP, fontSize: 15.0),
                      ),
                    ),

                  ],
                ),
                groupValue: _paymentType,
                onChanged: (val) => setState(() {
                  _paymentType = val! as int;
                }),
              ),
              Divider(thickness:1, color: AppTheme.gray,),
              RadioListTile(
                value: 9,
                controlAffinity: ListTileControlAffinity.trailing,
                tileColor: AppTheme.blueButtonGP,
                selectedTileColor:AppTheme.blueButtonGP ,
                activeColor: AppTheme.blueButtonGP,
                hoverColor:AppTheme.grayLightGP,
                title: Row(
                  children: <Widget>[
                    Expanded(
                      flex: 1,
                      child: Image.asset("assets/images/lang_9.png"),

                    ),
                    Expanded(
                      flex: 3,
                      child: Text(
                        "Arabic",
                        overflow: TextOverflow.ellipsis,
                        maxLines: 3,
                        style: TextStyle(color: AppTheme.blackGP, fontSize: 15.0),
                      ),
                    ),

                  ],
                ),
                groupValue: _paymentType,
                onChanged: (val) => setState(() {
                  _paymentType = val! as int;
                }),
              ),
              Divider(thickness:1, color: AppTheme.gray,),
              RadioListTile(
                value: 10,
                controlAffinity: ListTileControlAffinity.trailing,
                tileColor: AppTheme.blueButtonGP,
                selectedTileColor:AppTheme.blueButtonGP ,
                activeColor: AppTheme.blueButtonGP,
                hoverColor:AppTheme.grayLightGP,
                title: Row(
                  children: <Widget>[
                    Expanded(
                      flex: 1,
                      child: Image.asset("assets/images/lang_10.png"),

                    ),
                    Expanded(
                      flex: 3,
                      child: Text(
                        "Arabic",
                        overflow: TextOverflow.ellipsis,
                        maxLines: 3,
                        style: TextStyle(color: AppTheme.blackGP, fontSize: 15.0),
                      ),
                    ),

                  ],
                ),
                groupValue: _paymentType,
                onChanged: (val) => setState(() {
                  _paymentType = val! as int;
                }),
              ),
              Divider(thickness:1, color: AppTheme.gray,),
            ],
          ),
            ),
          ),
        ),

    );
  }
} // end of statlessWidget