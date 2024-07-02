import 'package:flutter/material.dart';
import 'package:gp_amit60_mary_zekrie/model/user_profile_model.dart';

class BuilderPortfolio extends StatelessWidget {
  Portofolio item;
  BuilderPortfolio({super.key, required this.item});
  // make the object required
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;

    /// to control tabs
    return Container(
      color: Colors.black,
      height: 100,
      width: 100,
    );

  }
}
