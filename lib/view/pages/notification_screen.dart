import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import '../../model/notification_alert_model.dart';
import '../../model/shared/colors_theme.dart';
import '../../router/router.dart';
import '../builder_item/notification_item.dart';
import '../widget/default_text_field.dart';


class NotificationScreen extends StatefulWidget {
  const NotificationScreen({super.key});

  @override
  State<NotificationScreen> createState() => _NotificationScreenState();
}
class _NotificationScreenState extends State<NotificationScreen> {
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            onPressed: () {
              Navigator.of(context).popAndPushNamed(AppRoute.homeScreen);
            },
            icon: Image.asset(
              "assets/images/arrow-left.png",
            )),
        centerTitle: true,
        title: const Text(
          "Notification",
        ),
        actions: [
          InkWell(
            onTap: (){

              Navigator.of(context).pushNamedAndRemoveUntil(AppRoute.notificationNoDataScreen, (route) => false);
              Fluttertoast.showToast(
                                msg: "All Cleared Sucessfully!",
                                toastLength: Toast.LENGTH_SHORT,
                                gravity: ToastGravity.BOTTOM,
                                timeInSecForIosWeb: 3,
                                backgroundColor: Colors.green,
                                textColor: Colors.white,
                                fontSize: 16.0
                            );
            },
            child: DefaultText(
              text: " Clear     ",
              color: AppTheme.blueButtonGP,
              fontSize: 15,
              fontWeight: FontWeight.normal,
            ),
          ),
        ],
      ),
      body:
      Column(
        mainAxisAlignment: MainAxisAlignment.start,
        mainAxisSize: MainAxisSize.max,

        children: [
          Container(
            padding: EdgeInsets.all(4),
            width: double.infinity,
            color: AppTheme.chat_bg_text2_gray,
            child:  DefaultText(
              text: "  New",
              color: AppTheme.blackGP,
              fontSize: 17,
              fontWeight: FontWeight.normal,
            ),
          ),
          SizedBox(
            height: height * 0.02,
          ),
          SizedBox(
            height: 0.5*height,
            child: Expanded(
              child: ListView.separated(
                separatorBuilder: (context, index) => SizedBox(
                  height: height * 0.02,
                ),
                itemCount: newDataMessage.length,
                itemBuilder: (context, index) {
                  return BuilderNotification(
                    alertNotificationModel: newDataMessage[index],
                  );
                },
              ),
            ),
          ),
          Container(
            padding: EdgeInsets.all(4),
            width: double.infinity,
            color: AppTheme.chat_bg_text2_gray,
            child:  DefaultText(
              text: "  Yesterday",
              color: AppTheme.blackGP,
              fontSize: 17,
              fontWeight: FontWeight.normal,
            ),
          ),
          SizedBox(
            height: height * 0.02,
          ),
          Expanded(
            child: ListView.separated(
              separatorBuilder: (context, index) => SizedBox(
                height: height * 0.02,
              ),
              itemCount: yesterdayDataMessage.length,
              itemBuilder: (context, index) {
                return BuilderNotification(
                  alertNotificationModel: yesterdayDataMessage[index],
                );
              },
            ),
          ),
        ],
      ),
    );
  }
} // end of statlessWidget
