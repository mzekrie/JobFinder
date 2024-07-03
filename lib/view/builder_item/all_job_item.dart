import 'package:flutter/material.dart';
import '../../model/jobs_all_model.dart';
import '../../model/shared/colors_theme.dart';
import '../../router/router.dart';
import '../widget/default_text_field.dart';

class BuilderAllJobs extends StatefulWidget {
  JobData item;
  BuilderAllJobs({super.key, required this.item});
  @override
  State<BuilderAllJobs> createState() => _BuilderAllJobsState();
}

class _BuilderAllJobsState extends State<BuilderAllJobs> {
 // make the object required
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return  Container(
        decoration: const BoxDecoration(
          color: AppTheme.whiteGP),
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: InkWell(
            onTap: (){
              Navigator.of(context).pushNamedAndRemoveUntil(
                  AppRoute.jobsDetailsScreen, (route) => false);
            },
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Image.network("${widget.item.image}", height: 0.1 * width, width:0.1 * width,),
                    SizedBox(width: 0.1 * width),
                    SizedBox(
                      width: 0.4 * width,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          DefaultText(
                            text: ("${widget.item.name}"),
                            color: Colors.black,
                            fontSize: 15,
                            fontWeight: FontWeight.bold,
                          ),
                          SizedBox(
                            height: height * 0.02,
                          ),
                          DefaultText(
                            text: ("${widget.item.compName}. United States"),
                            color: AppTheme.gray,
                            fontSize: 15,
                            fontWeight: FontWeight.normal,
                          ),
                        ],
                      ),
                    ),
                    SizedBox(width: 0.1 * width),
                    Visibility(
                        visible: ("${widget.item.favorites}" == '0'),
                        child: IconButton(onPressed: (){},icon:Image.asset("assets/images/saved_inactive.png") ),
                        replacement:IconButton(onPressed: (){},icon:Image.asset("assets/images/archive-minus.png") ),
                    ),
                  ],
                ),
                SizedBox(
                  height: height * 0.02,
                ),
                Row(
                  children: [
                    Container(
                      height: height * 0.04,
                      width: width * 0.25,
                      margin: const EdgeInsets.all(2),
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                          color: AppTheme.blueLightGP,
                          border: Border.all(color: Colors.blue, width: 1),
                          borderRadius: BorderRadius.circular(12)),
                      child: DefaultText(
                        text: ("${widget.item.jobType} "),
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
                      child: DefaultText(
                        text: ("${widget.item.jobTimeType} "),
                        color: Colors.blue,
                        fontSize: 12,
                        fontWeight: FontWeight.normal,
                      ),
                    ),

                    DefaultText(
                      text: (" ${widget.item.salary} "),
                      color: Colors.green,
                      fontSize: 20,
                      fontWeight: FontWeight.normal,
                    ),
                    const DefaultText(
                      text: ("/Month"),
                      color: Colors.grey,
                      fontSize: 15,
                      fontWeight: FontWeight.normal,
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),      );

  }
}


Widget listJobItem({required List <JobData> list}){
  return

        /// list
        Expanded(
          child: ListView.separated(
            separatorBuilder: (context, index)=> const SizedBox(height:40,),
            //scrollDirection:Axis.vertical,
            itemCount: list.length,
            shrinkWrap: true,
            itemBuilder: (context, index)=> BuilderAllJobs(
              item: list[index],),
          ),

  );
}
