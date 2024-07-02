
import 'package:flutter/material.dart';
import 'package:gp_amit60_mary_zekrie/model/message_model.dart';
import 'package:gp_amit60_mary_zekrie/view/builder_item/message_item.dart';
import 'package:gp_amit60_mary_zekrie/view/pages/message_filter.dart';

import '../../router/router.dart';
//import 'package:flutter_bloc/flutter_bloc.dart';

class MessageScreen extends StatefulWidget {
  const MessageScreen({super.key});

  @override
  State<MessageScreen> createState() => _MessageScreenState();
}

class _MessageScreenState extends State<MessageScreen> {
  void _OpenFilterSheet(){
    showModalBottomSheet(
        context: context,
        builder: (ctx)=> const MessageFilter());
  }
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
          centerTitle: true,
          title: const Text("Message",),

        ),
        body: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
            children: [
              //search
              Row(
                  children: [
                    TextFormField(
                      decoration: InputDecoration(
                        contentPadding: const EdgeInsets.symmetric(vertical: 1),
                        hintText: "Search",
                        constraints: BoxConstraints(
                          maxHeight: 0.06 * height,
                          maxWidth: 0.8 * width,
                        ),
                        prefixIcon: const Icon(
                          Icons.search,
                          color: Colors.blue,
                        ),
                        border: OutlineInputBorder(
                          borderSide: BorderSide.none,
                          borderRadius: BorderRadius.circular(35.5),
                        ),
                        fillColor: Colors.grey.withOpacity(0.2),
                        filled: true,
                      ),
                      keyboardType: TextInputType.text,
                    ),
                    IconButton(
                        onPressed: _OpenFilterSheet,
                        icon: Image.asset("assets/images/message_Filter.png",height: 0.1*width, width: 0.1*width ,)),

                  ],
                ),

              SizedBox(height: height*0.02,),
              Expanded(
              child: ListView.separated(
                separatorBuilder: (context, index) => SizedBox(height: height* 0.02,),
                itemCount: dataMessage.length,
                itemBuilder: (context , index){
            return BuilderMessage(messageModel: dataMessage[index],);
        },

        ),
          ),

               ]
          ),
        ),
    );
  }
} // end of statlessWidget