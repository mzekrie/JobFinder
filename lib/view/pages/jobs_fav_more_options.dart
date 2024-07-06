import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

import '../../model/shared/colors_theme.dart';
import '../../router/router.dart';
import '../widget/default_text_field.dart';

class FavJobsOptions extends StatefulWidget {
  const FavJobsOptions({super.key});

  @override
  State<FavJobsOptions> createState() => _FavJobsOptionsState();
}

class _FavJobsOptionsState extends State<FavJobsOptions> {
  void _OpenSocialShare() {
    showModalBottomSheet(context: context, builder: (ctx) => buttomSheetSocial());
  }

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
                    Navigator.of(context).popAndPushNamed(AppRoute.savedJobsScreen);
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

                const DefaultText(
                  text: "Select one of the following options ",
                  color: AppTheme.blueButtonGP,
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
                SizedBox(height: 0.03*height,),
                Padding(
                  padding: const EdgeInsets.all(4.0),
                  child: OutlinedButton(
                    onPressed: () {

                      Navigator.of(context).pushNamedAndRemoveUntil(AppRoute.applyToJobScreen, (route) => false);

                    },
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        const Image(
                            image: AssetImage(
                              'assets/images/Fav_apply.png',
                            )),
                        SizedBox(
                          width: 0.02 * width,
                        ),
                         SizedBox(
                          width: 0.6 * width,
                          child: const DefaultText(
                            text: "Apply Job",
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
                    onPressed: () {
                       _OpenSocialShare();

                    },
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        const Image(
                            image: AssetImage(
                              'assets/images/fav_share.png',
                            )),
                        SizedBox(
                          width: 0.02 * width,
                        ),

                        SizedBox(
                          width: 0.6 * width,
                          child: const DefaultText(
                            text: "Share via ...",
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
                    onPressed: () {

                      Fluttertoast.showToast(
                        msg: " Job is removed from saved Jobs List!",
                        toastLength: Toast.LENGTH_SHORT,
                        gravity: ToastGravity.BOTTOM,
                        timeInSecForIosWeb: 3,
                        backgroundColor: Colors.green,
                        textColor: Colors.white,
                        fontSize: 16.0,
                      );
                      Navigator.of(context).pushNamedAndRemoveUntil(AppRoute.savedJobsScreen, (route) => false);

                    },
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        const Image(
                            image: AssetImage(
                              'assets/images/fav_arch.png',
                            )),
                        SizedBox(
                          width: 0.02 * width,
                        ),
                        SizedBox(
                          width: 0.6 * width,
                          child: const DefaultText(
                            text: "Cancel save",
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
                      AppRoute.savedJobsScreen);
                }, child: const Text ("Return back"),),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget buttomSheetSocial() {
    return Padding(
      padding: const EdgeInsets.all(18.0),
      child: SizedBox(
        width: double.infinity,
        height: 150,
        child: Column(
          children: [
            const DefaultText(
              text: "Share Via ",
              color: AppTheme.grayGP,
              fontSize: 20,
              fontWeight: FontWeight.normal,
            ),
            const SizedBox(
              height: 20,
            ),
            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.all(4.0),
                  child: OutlinedButton(
                    onPressed: () async {
                      Navigator.of(context).pushNamedAndRemoveUntil(
                          AppRoute.savedJobsScreen, (route) => false);

                      Fluttertoast.showToast(
                        msg: " Job is shared successfully!",
                        toastLength: Toast.LENGTH_SHORT,
                        gravity: ToastGravity.BOTTOM,
                        timeInSecForIosWeb: 3,
                        backgroundColor: Colors.green,
                        textColor: Colors.white,
                        fontSize: 16.0,
                      );
                    },
                    child: const Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Icon(Icons.facebook, color:AppTheme.blueButtonGP),
                        SizedBox(
                          width: 10,
                        ),
                        SizedBox(
                          width: 80,
                          child: DefaultText(
                            text: "Facebook",
                            color: AppTheme.grayGP,
                            fontSize: 15,
                            fontWeight: FontWeight.normal,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(4.0),
                  child: OutlinedButton(
                    onPressed: () async {
                      Navigator.of(context).pushNamedAndRemoveUntil(
                          AppRoute.savedJobsScreen, (route) => false);

                      Fluttertoast.showToast(
                        msg: " Job is shared successfully!",
                        toastLength: Toast.LENGTH_SHORT,
                        gravity: ToastGravity.BOTTOM,
                        timeInSecForIosWeb: 3,
                        backgroundColor: Colors.green,
                        textColor: Colors.white,
                        fontSize: 16.0,
                      );
                    },
                    child: const Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Icon(Icons.email, color:AppTheme.blueButtonGP),
                        SizedBox(
                          width: 20,
                        ),
                        SizedBox(
                          width: 80,
                          child: DefaultText(
                            text: "email",
                            color: AppTheme.grayGP,
                            fontSize: 15,
                            fontWeight: FontWeight.normal,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
} // end of statlessWidget
