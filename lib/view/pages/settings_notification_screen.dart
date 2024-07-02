import 'package:flutter/material.dart';

import '../../model/shared/colors_theme.dart';
import '../../router/router.dart';
import '../widget/default_text_field.dart';

class SettingsNotificationScreen extends StatefulWidget {
  const SettingsNotificationScreen({super.key});

  @override
  State<SettingsNotificationScreen> createState() => _SettingsNotificationScreenState();
}

class _SettingsNotificationScreenState extends State<SettingsNotificationScreen> {
  bool _switchValue1 = false;
  bool _switchValue2 = false;
  bool _switchValue3 = false;
  bool _switchValue4 = false;
  bool _switchValue5 = false;// Initial switch value
  bool _switchValue6 = false;
  bool _switchValue7 = false;
  bool _switchValue8 = false;
  String mess = "Truned Off"; // Initial message

  // Function to change the message based on the switch value
  // we can use it to display beside the switch control
  void changeMessage() {
    setState(() {
      if (_switchValue1 || _switchValue2 ||_switchValue3 ||_switchValue4 ||_switchValue5) {
        mess = "Truned On";
      } else {
        mess = "Truned Off";
      }
    });
  }
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return  Scaffold(
      appBar:  AppBar(
        leading:IconButton(
            onPressed: (){
              Navigator.of(context).popAndPushNamed(AppRoute.profileScreen);
            },
            icon: Image.asset("assets/images/arrow-left.png",)),
        centerTitle: true,
        title: const Text("Notifications",),

      ),
      body:  SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(
          children: [
            Container(
              padding: const EdgeInsets.all(5),
              width: double.infinity,
              color: AppTheme.chat_bg_text2_gray,
              child:  const DefaultText(
                text: "  Job notification",
                color: AppTheme.blackGP,
                fontSize: 17,
                fontWeight: FontWeight.normal,
              ),
            ),
            Container(
              color:AppTheme.whiteGP,
              child: Padding(
                padding: const EdgeInsets.all(18.0),
                child: SingleChildScrollView(
                  scrollDirection: Axis.vertical,
                  child: Column(
                    children: [
                      SizedBox(
                        height: height * 0.5,
                        child: Column(
                          children: [
                            SwitchListTile(
                              title: const Text('Your Job Search Alert'), // The title of the ListTile
                              activeColor:AppTheme.blueLightGP,
                              activeTrackColor: AppTheme.blueButtonGP,
                              //secondary: Icon(Icons.lightbulb_outline), // Optional leading icon
                              value: _switchValue1, // The current value of the switch
                              onChanged: (newValue) {
                                // Callback when the switch is toggled
                                setState(() {
                                  _switchValue1 = newValue;
                                  changeMessage(); // Call the function to update the message
                                });
                              },
                            ),
                            const Expanded(child: Divider(thickness: 1,color:AppTheme.gray2)),

                            SwitchListTile(
                              title: const Text('Job Application Update '), // The title of the ListTile
                              activeColor:AppTheme.blueLightGP,
                              activeTrackColor: AppTheme.blueButtonGP,
                              //secondary: Icon(Icons.lightbulb_outline), // Optional leading icon
                              value: _switchValue2, // The current value of the switch
                              onChanged: (newValue) {
                                // Callback when the switch is toggled
                                setState(() {
                                  _switchValue2 = newValue;
                                  changeMessage(); // Call the function to update the message
                                });
                              },
                            ),
                            const Expanded(child: Divider(thickness: 1,color:AppTheme.gray2)),

                            SwitchListTile(
                              title: const Text('Job Application Reminders'), // The title of the ListTile
                              activeColor:AppTheme.blueLightGP,
                              activeTrackColor: AppTheme.blueButtonGP,
                              //secondary: Icon(Icons.lightbulb_outline), // Optional leading icon
                              value: _switchValue3, // The current value of the switch
                              onChanged: (newValue) {
                                // Callback when the switch is toggled
                                setState(() {
                                  _switchValue3 = newValue;
                                  changeMessage(); // Call the function to update the message
                                });
                              },
                            ),
                            const Expanded(child: Divider(thickness: 1,color:AppTheme.gray2)),

                            SwitchListTile(
                              title: const Text('Jobs You May Be Interested In'), // The title of the ListTile
                              activeColor:AppTheme.blueLightGP,
                              activeTrackColor: AppTheme.blueButtonGP,
                              //secondary: Icon(Icons.lightbulb_outline), // Optional leading icon
                              value: _switchValue4, // The current value of the switch
                              onChanged: (newValue) {
                                // Callback when the switch is toggled
                                setState(() {
                                  _switchValue4 = newValue;
                                  changeMessage(); // Call the function to update the message
                                });
                              },
                            ),
                            const Expanded(child: Divider(thickness: 1,color:AppTheme.gray2)),
                            SwitchListTile(
                              title: const Text('Job Seeker Updates'), // The title of the ListTile
                              activeColor:AppTheme.blueLightGP,
                              activeTrackColor: AppTheme.blueButtonGP,
                              //secondary: Icon(Icons.lightbulb_outline), // Optional leading icon
                              value: _switchValue5, // The current value of the switch
                              onChanged: (newValue) {
                                // Callback when the switch is toggled
                                setState(() {
                                  _switchValue5 = newValue;
                                  changeMessage(); // Call the function to update the message
                                });
                              },
                            ),
                            const Expanded(child: Divider(thickness: 1,color:AppTheme.gray2)),


                          ],
                        ),
                      ),
                      //SizedBox(height: height * 0.02,),


                    ],
                  ),),),),
            Container(
              padding: const EdgeInsets.all(5),
              width: double.infinity,
              color: AppTheme.chat_bg_text2_gray,
              child:  const DefaultText(
                text: "  Other notification",
                color: AppTheme.blackGP,
                fontSize: 17,
                fontWeight: FontWeight.normal,
              ),
            ),
            Container(
              color:AppTheme.whiteGP,
              child: Padding(
                padding: const EdgeInsets.all(18.0),
                child: SingleChildScrollView(
                  scrollDirection: Axis.vertical,
                  child: Column(
                    children: [
                      SizedBox(
                        height: height * 0.3,
                        child: Column(
                          children: [
                            SwitchListTile(
                              title: const Text('Show Profile'), // The title of the ListTile
                              activeColor:AppTheme.blueLightGP,
                              activeTrackColor: AppTheme.blueButtonGP,
                              //secondary: Icon(Icons.lightbulb_outline), // Optional leading icon
                              value: _switchValue6, // The current value of the switch
                              onChanged: (newValue) {
                                // Callback when the switch is toggled
                                setState(() {
                                  _switchValue6 = newValue;
                                  changeMessage(); // Call the function to update the message
                                });
                              },
                            ),
                            const Expanded(child: Divider(thickness: 1,color:AppTheme.gray2)),
                            SwitchListTile(
                              title: const Text('All Message'), // The title of the ListTile
                              activeColor:AppTheme.blueLightGP,
                              activeTrackColor: AppTheme.blueButtonGP,
                              //secondary: Icon(Icons.lightbulb_outline), // Optional leading icon
                              value: _switchValue7, // The current value of the switch
                              onChanged: (newValue) {
                                // Callback when the switch is toggled
                                setState(() {
                                  _switchValue7 = newValue;
                                  changeMessage(); // Call the function to update the message
                                });
                              },
                            ),
                            const Expanded(child: Divider(thickness: 1,color:AppTheme.gray2)),
                            SwitchListTile(
                              title: const Text('Job Seeker Updates'), // The title of the ListTile
                              activeColor:AppTheme.blueLightGP,
                              activeTrackColor: AppTheme.blueButtonGP,
                              //secondary: Icon(Icons.lightbulb_outline), // Optional leading icon
                              value: _switchValue8, // The current value of the switch
                              onChanged: (newValue) {
                                // Callback when the switch is toggled
                                setState(() {
                                  _switchValue8 = newValue;
                                  changeMessage(); // Call the function to update the message
                                });
                              },
                            ),
                            const Expanded(child: Divider(thickness: 1,color:AppTheme.gray2)),


                          ],
                        ),
                      ),
                      //SizedBox(height: height * 0.02,),


                    ],
                  ),),),),
          ],
        ),
      ),
    );
  }
} // end of statlessWidget