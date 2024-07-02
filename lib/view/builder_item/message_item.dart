import 'package:flutter/material.dart';
import 'package:gp_amit60_mary_zekrie/model/message_model.dart';
import '../../model/shared/colors_theme.dart';
import '../../router/router.dart';
import '../widget/default_text_field.dart';

class BuilderMessage extends StatelessWidget {
  MessageModel messageModel;
  BuilderMessage(
      {super.key, required this.messageModel}); // make the object required

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return InkWell(
      onTap: (){
        if (messageModel.count == '0') {
          Navigator.of(context).pushNamedAndRemoveUntil(
              AppRoute.messageNoDataScreen, (route) => false);
        }
        else
          {
            Navigator.of(context).pushNamedAndRemoveUntil(
                AppRoute.messageChatScreen, (route) => false);
          }
      },
      child: SizedBox(
        width: double.infinity,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          mainAxisSize: MainAxisSize.max,
          children: [

            Stack(
              children: [

              Image.asset(
                "${messageModel.image}",
                height: width * 0.2,
                width: width * 0.2,
              ),
                CircleAvatar(
                  backgroundColor: Colors.greenAccent[400],
                  radius: 15,
                  child: Text(
                    '${messageModel.count}',
                    style: const TextStyle(fontSize: 15, color: Colors.white),
                  ), //Text
                ),
              ],

            ),
            // SizedBox(
            //   width: width * 0.04,
            // ),
            SizedBox(
              width: 0.6*width,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  DefaultText(
                    text: ("${messageModel.titleDes}"),
                    color: AppTheme.blackGP,
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                  SizedBox(
                    height: height * 0.02,
                  ),
                  DefaultText(
                    text: "${messageModel.detailDes}",
                    color: AppTheme.grayGP,
                    fontSize: 12,
                    fontWeight: FontWeight.normal,
                  ),
                ],
              ),
            ),

            DefaultText(
              text: ("${messageModel.time}"),
              color: AppTheme.blueButtonGP,
              fontSize: 12,
              fontWeight: FontWeight.normal,
            ),
          ],
        ),
      ),
    );
  }
}
