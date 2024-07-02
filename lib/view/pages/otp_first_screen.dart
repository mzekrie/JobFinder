

import 'package:flutter/material.dart';
import 'package:timer_count_down/timer_count_down.dart';
import '../../model/shared/colors_theme.dart';
import '../../model/shared/constant_attribute.dart';
import '../../router/router.dart';
import '../widget/default_button.dart';
import '../widget/default_form_field.dart';
import '../widget/default_text_field.dart';

class FirstOTPScreen extends StatefulWidget {
  const FirstOTPScreen({super.key});

  @override
  State<FirstOTPScreen> createState() => _FirstOTPScreenState();
}

class _FirstOTPScreenState extends State<FirstOTPScreen> {
  bool _switchValue1 = false;
  String mess = "Truned Off"; // Initial message

  // Function to change the message based on the switch value
  // we can use it to display beside the switch control
  void changeMessage() {
    setState(() {
      if (_switchValue1 ) {
        mess = "Truned On";
      } else {
        mess = "Truned Off";
      }
    });
  }


  List<String> method_otp = [
    'Telephone number (SMS)',
    'Email',

  ];

  String? dropdownvalue ;

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return  Scaffold(
      appBar:  AppBar(
        leading:IconButton(
            onPressed: (){
              Navigator.of(context).popAndPushNamed(AppRoute.settingsSecurityScreen);
            },
            icon: Image.asset("assets/images/arrow-left.png",)),
        centerTitle: true,
        title: const Text("Two-step verification",),

      ),
      body:  Form(
        key: formKeyOTP,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [

                SwitchListTile(
                  title: Text('Secure your account with two-step verification'), // The title of the ListTile
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
                SizedBox(height: 0.02*height,),

                Visibility(
                  //maintainSize: true,
                  //maintainAnimation: true,
                  //maintainState: true,
                  visible: _switchValue1,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        DefaultText(
                          text : "Select a verification method",
                          color: AppTheme.blackGP,
                          fontSize: 17,
                          fontWeight: FontWeight.normal,
                        ),
                        SizedBox(height: 0.02*height,),

                        DropdownButton(
                          // Initial Value
                          value: dropdownvalue,
                          icon: const Icon(Icons.keyboard_arrow_down),
                          isExpanded: true,
                          items: method_otp.map((String dropdownvalue) {
                            return DropdownMenuItem(
                              value: dropdownvalue,
                              child: Text(dropdownvalue),
                            );
                          }).toList(),
                          hint:DefaultText(
                            text : " -- Select --",
                            color: AppTheme.blackGP,
                            fontSize: 15,
                            fontWeight: FontWeight.normal,
                          ),
                          onChanged: (String? newValue) {
                            setState(() {
                              dropdownvalue = newValue!;
                            });
                          },
                        ),
                        SizedBox(height: 0.02*height,),

                        const DefaultText(
                          text : "Note : Turning this feature will sign you out anywhere you’re currently signed in. We will then require you to enter a verification code the first time you sign with a new device or Joby mobile application.",
                          color: AppTheme.grayGP,
                          fontSize: 15,
                          fontWeight: FontWeight.normal,
                        ),
                        SizedBox(height: 0.05* height,),
                        Center(
                          child: defaultButton(
                              text: 'Next',
                              width: 0.7* width,
                              height: 0.06 * height,
                              radius: 25,
                              backGround: AppTheme.blueButtonGP,
                              function: () async {
                                if (formKeyOTP.currentState!.validate()) {
                                  Navigator.of(context).pushNamedAndRemoveUntil(
                                      AppRoute.secondOTPScreen, (route) => false);
                                }
                              }),
                        ),
                      ],
                    ),
                  ),
                  replacement: Column(
                    children: [
                       Row(
                         children: [
                           Image.asset("assets/images/otp1.png"),
                           SizedBox(width: 0.02*width,),
                           Container(
                             width: 0.8*width,
                             child: const DefaultText(
                              text : "Two-step verification provides additional security by asking for a verification code every time you log in on another device.",
                              color: AppTheme.grayGP,
                              fontSize: 15,
                              fontWeight: FontWeight.normal,
                                                   ),
                           ),
                         ],
                       ),
                      SizedBox(height: 0.02*height,),
                      Row(
                        children: [
                          Image.asset("assets/images/otp2.png"),
                          SizedBox(width: 0.02*width,),
                          Container(
                            width: 0.8*width,
                            child: const DefaultText(
                              text : "Adding a phone number or using an authenticator will help keep your account safe from harm.",
                              color: AppTheme.grayGP,
                              fontSize: 15,
                              fontWeight: FontWeight.normal,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),





              ],
            ),
          ),
        ),
      ),
    );
  }
} // end of statlessWidget