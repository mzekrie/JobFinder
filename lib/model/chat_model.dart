import 'package:flutter/material.dart';
import 'package:gp_amit60_mary_zekrie/model/shared/colors_theme.dart';
class ChatModel {

  String text;
  bool isSender;
  Color color;

  ChatModel({required this.text, required this.isSender,required this.color});

}// end of class

List<ChatModel>  dataChat = [

  ChatModel(
      text: "Hi Rafif!, I'm Melan the selection team from Twitter. Thank you for applying for a job at our company. We have announced that you are eligible for the interview stage." ,
      isSender: false ,
      color:AppTheme.chat_bg_text2_gray,
  ),
  ChatModel(
    text: "Hi Melan, thank you for considering me, this is good news for me." ,
    isSender: true ,
    color:AppTheme.chat_bg_text1_blue,
  ),
  ChatModel(
    text: "Can we have an interview via google meet call today at 3pm?" ,
    isSender: false ,
    color:AppTheme.chat_bg_text2_gray,
  ),
  ChatModel(
    text: "Of course, I can!" ,
    isSender: true ,
    color:AppTheme.chat_bg_text1_blue,
  ),

];