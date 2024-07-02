/// video https://www.youtube.com/watch?v=OL1jD2rIPS4&list=PLdmIkT-iS3fKhQn4hSsDhqjnUUwegHH5J&index=2
library;

import 'package:chat_bubbles/bubbles/bubble_normal_image.dart';
import 'package:chat_bubbles/bubbles/bubble_special_three.dart';
import 'package:flutter/material.dart';
import 'package:gp_amit60_mary_zekrie/router/router.dart';
import '../../model/shared/colors_theme.dart';
import '../../model/shared/constant_attribute.dart';
import '../widget/default_form_field.dart';
import '../widget/default_text_field.dart';
import 'message_more_option.dart';

class MessageChatScreen extends StatefulWidget{
  const MessageChatScreen({super.key});
  @override
  State<MessageChatScreen> createState() => _MessageChatScreenState();
}
class _MessageChatScreenState extends State<MessageChatScreen> {

  void _OpenIconButtonPressed(){
    showModalBottomSheet(
        context: context,
        builder: (ctx)=> const MessageMoreOption());
  }
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return SafeArea(
      child: Scaffold(
        appBar:  AppBar(
          backgroundColor: AppTheme.chat_bg_white,
          leading:IconButton(
            onPressed: (){
              Navigator.of(context).popAndPushNamed(AppRoute.messageScreen);
              },
          icon: Image.asset("assets/images/arrow-left.png",)),

      centerTitle: true,
          title: const Text("Twitter Chat",  style: TextStyle(
                fontWeight: FontWeight.bold, color: Colors.black)),

          actions: [
            Padding(
              padding: const EdgeInsets.only(right: 10),
              child: IconButton(
                  onPressed: _OpenIconButtonPressed,
                  icon: Image.asset("assets/images/more.png",)),

            ),
          ],
        ),
        body: Container(
          color: AppTheme.chat_bg_gray,
          child: Column(
            children: [
               const Row(
                 children: [
                   Expanded(child: Divider( indent: 20, endIndent: 10, thickness: 2, color:AppTheme.chat_bg_text2_gray,)),
                   DefaultText(
                     text: "Tuesday 09:00 am",
                     color: AppTheme.grayGP,
                     fontSize: 15,
                     fontWeight: FontWeight.normal,
                   ),
                   Expanded(child: Divider( indent: 10, endIndent: 20,thickness: 2, color:AppTheme.chat_bg_text2_gray,)),

                 ],
               ),

              Expanded(
                child: ListView.builder(
                  itemCount: 2,
                  itemBuilder: (context,index)=> Column(
                    children: [
                      BubbleNormalImage(
                        id: 'id001',
                        image:  Image.asset("assets/images/Background_onboarding3.png",),
                        color: Colors.purpleAccent,
                        tail: true,
                        delivered: true,
                      ),
                
                      const BubbleSpecialThree(
                        text: "Hi Rafif!, I'm Melan the selection team from Twitter. Thank you for applying for a job at our company. We have announced that you are eligible for the interview stage." ,
                        color: AppTheme.chat_bg_text2_gray,
                        tail: true,
                        isSender: true,
                        textStyle: TextStyle(
                            color: AppTheme.chat_text_gray,
                            fontSize: 16
                        ),
                      ),
                      const BubbleSpecialThree(
                        text: 'Hi Melan, thank you for considering me, this is good news for me.',
                        color: AppTheme.chat_bg_text1_blue,
                        tail: true,
                        isSender: false,
                        textStyle: TextStyle(
                            color: Colors.white,
                            fontSize: 16
                        ),
                      ),
                      const BubbleSpecialThree(
                        text: 'Sure',
                        color: AppTheme.chat_bg_text2_gray,
                        isSender: true,
                        tail: true,
                        textStyle: TextStyle(
                            color: AppTheme.chat_text_gray,
                            fontSize: 16
                        ),
                
                      ),
                      const BubbleSpecialThree(
                        text: "I tried. It's awesome!!!",
                        color: AppTheme.chat_bg_text1_blue,
                        tail: true,
                        isSender: false,
                        textStyle: TextStyle(
                            color: AppTheme.chat_bg_white,
                            fontSize: 16
                        ),
                      ),
                      const BubbleSpecialThree(
                        text: "Thanks",
                        color: AppTheme.chat_bg_text1_blue,
                        tail: true,
                        isSender: false,
                        textStyle: TextStyle(
                            color: AppTheme.chat_bg_white,
                            fontSize: 16
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              // Expanded(
              //   child: ListView.builder(
              //     itemCount: chat.length,
              //       itemBuilder: (context,index)=> BubbleSpecialThree(
              //         isSender: true, // change directoin
              //         text: chat[index].toString(),
              //         color: AppTheme.chat_bg_text1_blue,
              //         tail: true,
              //         textStyle: const TextStyle(
              //             color: Colors.white,
              //             fontSize: 16
              //         ),
              //       ),),
              // ),
              Container(
                height: 0.08*height,
                color: AppTheme.chat_bg_white,
                //color: AppTheme.blackGP,
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SizedBox( width: 0.04*width,),
                    Image.asset("assets/images/message_attachment.png",),
                    SizedBox( width: 0.04*width,),
                   Expanded(
                      child: DefaultFormField(
                          radius: 35,
                          height: 0.06*height,
                          backgroundColor: AppTheme.chat_bg_gray,
                          controller: text,
                          keyboardType: TextInputType.text,
                          labelText: "Write a message",
                          validator: (value) {
                            if (value!.isEmpty) {
                              return "please write your message";
                            }
                            else {
                              return null;
                            }
                          }),
                    ),
                    SizedBox( width: 0.04*width,),
                    Image.asset("assets/images/message_microphone.png",),
                    IconButton(
                        onPressed: (){
                          text.text = "";
                        },
                        icon: const Icon(Icons.send, color: AppTheme.blueButtonGP,)),
                  ],
                ),
              ),
            ],
          )
        ),
      ),
    );
  }
} // end of statlessWidget