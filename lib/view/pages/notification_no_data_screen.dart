import 'package:flutter/material.dart';
import '../../model/shared/colors_theme.dart';
import '../../router/router.dart';
import '../widget/default_text_field.dart';
class NotificationNoDataScreen extends StatefulWidget {
  const NotificationNoDataScreen({super.key});

  @override
  State<NotificationNoDataScreen> createState() => _NotificationNoDataScreenState();
}

class _NotificationNoDataScreenState extends State<NotificationNoDataScreen> {
    @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar:  AppBar(
        leading:IconButton(
            onPressed: (){
              Navigator.of(context).popAndPushNamed(AppRoute.homeScreen);
            },
            icon: Image.asset("assets/images/arrow-left.png",)),

        title:  const Padding(
          padding: EdgeInsets.only(left:50),
          child: Text("Notification",),
        ),
        actions: const [
        ],),
      body: SafeArea(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisSize: MainAxisSize.max,
              children: [
                // search


                Image.asset(
                  'assets/images/a_no_data.png',
                ),
                SizedBox(
                  height: height * 0.06,
                ),
                const DefaultText(
                  text: "No new notifications yet",
                  color: AppTheme.blackGP,
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                ),
                SizedBox(
                  height: height * 0.04,
                ),
                const DefaultText(
                  text:
                  "You will receive a notification if there is something on your account",
                  color: AppTheme.grayGP,
                  fontSize: 20,
                  fontWeight: FontWeight.normal,
                ),

              ],
            ),
          ),
        ),

      ),
    );
  }
}