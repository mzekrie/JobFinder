import 'package:flutter/material.dart';

import '../../model/shared/colors_theme.dart';
import '../../router/router.dart';
import '../widget/default_text_field.dart';

class MessageMoreOption extends StatelessWidget {
  const MessageMoreOption({super.key});
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(8.0),
          child: SizedBox(
            width: double.infinity,
            child: Padding(
              padding: const EdgeInsets.only(left: 8,right:8 ),
              child: Column(
                children: [
                  InkWell(
                    onTap: (){
                      Navigator.of(context).popAndPushNamed(AppRoute.messageChatScreen);
                    },
                    child: Container(
                      width: 0.5*width,
                      height: 0.01*width,
                      decoration: const BoxDecoration(
                        color: Colors.black,
                      ),
                    ),
                  ),
                  SizedBox(height: 0.03*height,),
                  Padding(
                    padding: const EdgeInsets.all(4.0),
                    child: OutlinedButton(
                      onPressed: () {},
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          const Image(
                              image: AssetImage(
                            'assets/images/m_briefcase.png',
                          )),
                          SizedBox(
                            width: 0.02 * width,
                          ),
                          SizedBox(
                            width: 0.65 * width,
                            child: const DefaultText(
                              text: "Visit job post",
                              color: AppTheme.grayGP,
                              fontSize: 20,
                              fontWeight: FontWeight.normal,
                            ),
                          ),
                          const Image(
                              image: AssetImage(
                            'assets/images/m_arrow-right.png',
                          )),
                        ],
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(4.0),
                    child: OutlinedButton(
                      onPressed: () {},
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          const Image(
                              image: AssetImage(
                            'assets/images/m_note.png',
                          )),
                          SizedBox(
                            width: 0.02 * width,
                          ),
                          SizedBox(
                            width: 0.65 * width,
                            child: const DefaultText(
                              text: "View my application",
                              color: AppTheme.grayGP,
                              fontSize: 20,
                              fontWeight: FontWeight.normal,
                            ),
                          ),
                          const Image(
                              image: AssetImage(
                            'assets/images/m_arrow-right.png',
                          )),
                        ],
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(4.0),
                    child: OutlinedButton(
                      onPressed: () {},
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          const Image(
                              image: AssetImage(
                            'assets/images/m_sms.png',
                          )),
                          SizedBox(
                            width: 0.02 * width,
                          ),
                          SizedBox(
                            width: 0.65 * width,
                            child: const DefaultText(
                              text: "Mark as unread",
                              color: AppTheme.grayGP,
                              fontSize: 20,
                              fontWeight: FontWeight.normal,
                            ),
                          ),
                          const Image(
                              image: AssetImage(
                            'assets/images/m_arrow-right.png',
                          )),
                        ],
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(4.0),
                    child: OutlinedButton(
                      onPressed: () {},
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          const Image(
                              image: AssetImage(
                            'assets/images/m_notification.png',
                          )),
                          SizedBox(
                            width: 0.02 * width,
                          ),
                          SizedBox(
                            width: 0.65 * width,
                            child: const DefaultText(
                              text: "Mute",
                              color: AppTheme.grayGP,
                              fontSize: 20,
                              fontWeight: FontWeight.normal,
                            ),
                          ),
                          const Image(
                              image: AssetImage(
                            'assets/images/m_arrow-right.png',
                          )),
                        ],
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(4.0),
                    child: OutlinedButton(
                      onPressed: () {},
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          const Image(
                              image: AssetImage(
                            'assets/images/m_archive.png',
                          )),
                          SizedBox(
                            width: 0.02 * width,
                          ),
                          SizedBox(
                            width: 0.65 * width,
                            child: const DefaultText(
                              text: "Archive",
                              color: AppTheme.grayGP,
                              fontSize: 20,
                              fontWeight: FontWeight.normal,
                            ),
                          ),
                          const Image(
                              image: AssetImage(
                            'assets/images/m_arrow-right.png',
                          )),
                        ],
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(4.0),
                    child: OutlinedButton(
                      onPressed: () {},
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          const Image(
                              image: AssetImage(
                            'assets/images/m_delete.png',
                          )),
                          SizedBox(
                            width: 0.02 * width,
                          ),
                          SizedBox(
                            width: 0.65 * width,
                            child: const DefaultText(
                              text: "Delete conversation",
                              color: AppTheme.grayGP,
                              fontSize: 20,
                              fontWeight: FontWeight.normal,
                            ),
                          ),
                          const Image(
                              image: AssetImage(
                            'assets/images/m_arrow-right.png',
                          )),
                        ],
                      ),
                    ),
                  ),
                  ElevatedButton(onPressed: () {
                    Navigator.of(context).popAndPushNamed(
                        AppRoute.messageChatScreen);
                  }, child: const Text ("Return back"),),
                ],
              ),
            ),
          ),
        ),
    );
  }
} // end of statlessWidget
