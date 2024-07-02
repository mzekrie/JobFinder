import 'package:flutter/material.dart';
import '../../model/shared/colors_theme.dart';
import '../../router/router.dart';
import '../widget/default_text_field.dart';
import 'message_filter.dart';
class MessageNoDataScreen extends StatefulWidget {
  const MessageNoDataScreen({super.key});

  @override
  State<MessageNoDataScreen> createState() => _MessageNoDataScreenState();
}

class _MessageNoDataScreenState extends State<MessageNoDataScreen> {
  void _OpenFilterSheet2(){
    showModalBottomSheet(
        context: context,
        builder: (ctx)=> const MessageFilter());}
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar:  AppBar(
        leading:IconButton(
            onPressed: (){
              Navigator.of(context).popAndPushNamed(AppRoute.messageScreen);
            },
            icon: Image.asset("assets/images/arrow-left.png",)),

        title:  const Padding(
          padding: EdgeInsets.only(left:50),
          child: Text("Message",),
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
                            onPressed: _OpenFilterSheet2,
                            icon: Image.asset("assets/images/message_Filter.png",height: 0.1*width, width: 0.1*width ,)),

                      ],
                    ),
                    SizedBox(
                      height: height * 0.06,
                    ),
                    Image.asset(
                      'assets/images/message_nodata.png',
                    ),
                    SizedBox(
                      height: height * 0.06,
                    ),
                    const DefaultText(
                      text: "You have not received any messages",
                      color: AppTheme.blackGP,
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                    ),
                    SizedBox(
                      height: height * 0.04,
                    ),
                    const DefaultText(
                      text:
                      "Once your application has reached the interview stage, you will get a message from the recruiter.",
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