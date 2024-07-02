import 'package:flutter/material.dart';
import '../../model/jobs_people_model.dart';
import '../../model/shared/colors_theme.dart';
import '../widget/default_text_field.dart';

class BuilderJobsPeople extends StatelessWidget {
  JobsPeopleModel jobsPeopleModel;
  BuilderJobsPeople({ super.key, required this.jobsPeopleModel});
 // make the object required
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return  Row(
      children: [
        Image.asset("${jobsPeopleModel.image}", height: width * 0.2, width: width * 0.2,),
        SizedBox(
          width: width * 0.01,
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [

            SizedBox(
              width: width * 0.4,
              child: DefaultText(
                text: ("${jobsPeopleModel.name}"),
                color: AppTheme.blackGP,
                fontSize: 15,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(
              height: height * 0.04,
              width: width * 0.4,
              child: DefaultText(
                text:"${jobsPeopleModel.job_title}",
                color: AppTheme.grayGP,
                fontSize: 12,
                fontWeight: FontWeight.normal,
              ),
            ),


          ],
        ),
        SizedBox(
          width: width * 0.01,
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            DefaultText(
              text: ("${jobsPeopleModel.work_duration}"),
              color: AppTheme.grayGP,
              fontSize: 10,
              fontWeight: FontWeight.normal,
            ),

            DefaultText(
              text:"${jobsPeopleModel.duration}",
              color: AppTheme.blueButtonGP,
              fontSize: 12,
              fontWeight: FontWeight.normal,
            ),

          ],
        ),
      ],
    );
  }
}