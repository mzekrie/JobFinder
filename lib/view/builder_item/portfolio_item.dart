import 'package:flutter/material.dart';
import 'package:gp_amit60_mary_zekrie/model/user_profile_model.dart';

import '../../model/shared/colors_theme.dart';
import '../widget/default_text_field.dart';

class BuilderPortfolio extends StatefulWidget {
  Portofolio item;
  BuilderPortfolio({super.key, required this.item});
   //BuilderPortfolio({super.key});


  @override
  State<BuilderPortfolio> createState() => _BuilderPortfolioState();
}

class _BuilderPortfolioState extends State<BuilderPortfolio> {
  // make the object required
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;

    /// to control tabs
    return  Padding(
      padding: const EdgeInsets.all(12.0),
      child: Container(
        padding: const EdgeInsets.all(12.0),
        decoration: BoxDecoration(
            border:Border.all(
              width: 1,
              color: AppTheme.grayGP,  //                   <--- border width here
            ),
            borderRadius: BorderRadius.circular(10),
            color:  AppTheme.whiteGP),

        child:Row(
          children: [
            Image.asset("assets/images/pdf.png"),
            SizedBox(width: 0.01 * width),

            SizedBox(
              width: 0.4 * width,
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    DefaultText(
                      text: ("UX Design "),
                      //text: ("${widget.item.name}"),
                      color: AppTheme.blackGP,
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                    ),
                    SizedBox(height: 0.01 * height),
                    DefaultText(
                      text: ("CV.pdf 300KB"),
                      //text: ("${widget.item.name}"),
                      color: AppTheme.gray,
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                    ),
                  ]
              ),
            ),
            SizedBox(width: 0.1 * width),
            IconButton(onPressed: (){}, icon: Image.asset("assets/images/edit-2.png")),
            IconButton(onPressed: (){}, icon: Image.asset("assets/images/close-circle.png")),

          ],
        ),
      ),
    );

  }
}
