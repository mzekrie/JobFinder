import 'package:flutter/material.dart';

import '../../model/shared/colors_theme.dart';
import '../../router/router.dart';
import '../widget/default_text_field.dart';

class FavJobsOptions extends StatelessWidget {
  const FavJobsOptions({super.key});
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
                    onPressed: () {},
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
                    onPressed: () {},
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
                    onPressed: () {},
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
} // end of statlessWidget
