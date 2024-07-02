import 'package:flutter/material.dart';
import '../../model/notification_alert_model.dart';
import '../../model/shared/colors_theme.dart';
import '../widget/default_text_field.dart';

class BuilderNotification extends StatelessWidget {
  AlertNotificatonModel alertNotificationModel;
  BuilderNotification(
      {super.key, required this.alertNotificationModel}); // make the object required

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return SizedBox(
      width: double.infinity,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.center,
        mainAxisSize: MainAxisSize.max,
        children: [

          Image.asset(
            "${alertNotificationModel.image}",
            height: width * 0.15,
            width: width * 0.15,
          ),
          SizedBox(
            width: 0.5*width,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                DefaultText(
                  text: ("${alertNotificationModel.titleDes}"),
                  color: AppTheme.blackGP,
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),

                DefaultText(
                  text: "${alertNotificationModel.detailDes}",
                  color: AppTheme.grayGP,
                  fontSize: 12,
                  fontWeight: FontWeight.normal,
                ),
              ],
            ),
          ),
          SizedBox(
            width: 0.06*width,),
Container(
  height: 0.03*width,
  width: 0.03*width,
  decoration: BoxDecoration(
    color: Colors.amber,
    borderRadius: BorderRadius.circular(50),
  ),
),
      SizedBox(
        width: 0.02*width,),

                    DefaultText(
            text: ("${alertNotificationModel.time}"),
            color: AppTheme.blueButtonGP,
            fontSize: 12,
            fontWeight: FontWeight.normal,
          ),
        ],
      ),
    );
  }
}
