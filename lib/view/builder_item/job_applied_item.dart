import 'package:flutter/material.dart';
import '../../model/jobs_all_model.dart';
import '../../model/jobs_applied_model.dart';
import '../../model/shared/colors_theme.dart';
import '../../router/router.dart';
import '../widget/default_text_field.dart';

class BuilderAppliedJobs extends StatefulWidget {
  Data item;
  BuilderAppliedJobs({super.key, required this.item});
  @override
  State<BuilderAppliedJobs> createState() => _BuilderAppliedJobsState();
}

class _BuilderAppliedJobsState extends State<BuilderAppliedJobs> {
  // make the object required
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Container(
      decoration: const BoxDecoration(color: AppTheme.whiteGP),
      child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(width: 0.1 * width),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  width: 0.7 * width,
                  child: DefaultText(
                    text: ("JOB# ${widget.item.jobsId}"),
                    color: Colors.black,
                    fontSize: 15,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                // SizedBox(
                //   width: 0.7 * width,
                //   child: DefaultText(
                //     text: ("${widget.item.name}"),
                //     color: Colors.black,
                //     fontSize: 15,
                //     fontWeight: FontWeight.bold,
                //   ),
                // ),
                // SizedBox(
                //   width: 0.7 * width,
                //   child: DefaultText(
                //     text: ("${widget.item.email}"),
                //     color: AppTheme.gray,
                //     fontSize: 15,
                //     fontWeight: FontWeight.normal,
                //   ),
                // ),
                Row(children: [
                  Container(
                    height: height * 0.04,
                    width: width * 0.3,
                    margin: const EdgeInsets.all(2),
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                        color: AppTheme.blueLightGP,
                        border: Border.all(color: Colors.blue, width: 1),
                        borderRadius: BorderRadius.circular(12)),
                    child: DefaultText(
                      text: ("${widget.item.workType} "),
                      color: AppTheme.blueButtonGP,
                      fontSize: 12,
                      fontWeight: FontWeight.normal,
                    ),
                  ),
                  Container(
                    height: height * 0.04,
                    width: width * 0.25,
                    margin: const EdgeInsets.all(2),
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                        color: AppTheme.blueLightGP,
                        border: Border.all(color: Colors.blue, width: 1),
                        borderRadius: BorderRadius.circular(12)),
                    child: const DefaultText(
                      text: ("Reviewed"),
                      color: Colors.green,
                      fontSize: 12,
                      fontWeight: FontWeight.normal,
                    ),
                  ),
                ]),
                SizedBox(
                  width: 0.7 * width,
                  child: DefaultText(
                    text: (" CV:  ${widget.item.cvFile} "),
                    color: Colors.green,
                    fontSize: 12,
                    fontWeight: FontWeight.normal,
                  ),
                ),
              ],
            ),
          ]),
    );
  }
}
