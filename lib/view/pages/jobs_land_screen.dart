import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gp_amit60_mary_zekrie/control/cubit/auth/login_cubit.dart';
import '../../control/cubit/job/all_jobs_cubit.dart';
import '../../model/shared/colors_theme.dart';
import '../../router/router.dart';
import '../builder_item/all_job_item.dart';
import '../widget/default_text_field.dart';
import 'jobs_all_screen.dart';

class JobsScreen extends StatefulWidget {
  const JobsScreen({super.key});

  @override
  State<JobsScreen> createState() => _JobsScreenState();
}

class _JobsScreenState extends State<JobsScreen> {
  @override
  void initState() {
    // TODO: implement initState

    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              mainAxisSize: MainAxisSize.max,
              children: [

                /// hi and notification
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    const Padding(
                      padding: EdgeInsets.all(2.0),
                      child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            DefaultText(
                              text: ("Hi,"),
                              color: AppTheme.blackGP,
                              fontSize: 25,
                              fontWeight: FontWeight.bold,
                            ),
                            DefaultText(
                              text: ("Create a better future for yourself here"),
                              color: AppTheme.grayGP,
                              fontSize: 15,
                              fontWeight: FontWeight.normal,
                            ),
                          ]),
                    ),
                    SizedBox(
                      width: 0.08 * width,
                    ),

                   IconButton(onPressed: (){
                     Navigator.of(context).pushNamedAndRemoveUntil(AppRoute.notificationScreen, (route) => true);
                   }, icon: Image.asset("assets/images/Notification.png"),)

                  ],
                ),

                /// search
                SizedBox(
                  height: 0.02 * height,
                ),

                Container (
                  padding: const EdgeInsets.only(left:10, top:1, bottom:1, right: 10),
                  width: 0.9*width,
                    decoration: BoxDecoration(
borderRadius: BorderRadius.circular(40),
color:  AppTheme.profile_baby_blue),
                  child: Row(
                    children: [
                      const DefaultText(
                        text: ("Search yor Job "),
                        color: AppTheme.grayGP,
                        fontSize: 15,
                        fontWeight: FontWeight.normal,
                      ),
                      SizedBox(width: 0.4*width,),
                      IconButton(
                          onPressed: () {
                            showSearch(context: context, delegate: CustomSearch());
                          },
                          icon: const Icon(Icons.search),
                        ),
                    ],
                  ),
                ),
                //

                ///    suggested job area
                SizedBox(
                  height: 0.01 * height,
                ),
                Row(
                  children: [
                    SizedBox(width: 0.7*width,
                    child: const DefaultText(
                      text: ("  Suggested Job "),
                      color: AppTheme.black,
                      fontSize: 20,
                      fontWeight: FontWeight.normal,
                    ),),
                    InkWell(
                      onTap: () {
                        Navigator.pushNamed(context, "AllJobsScreen");
                        //Navigator.of(context).pushReplacementNamed("AllJobsScreen");
                      },
                      child: const Text(
                        " view all",
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 15,
                            color: AppTheme.blueButtonGP),
                      ),
                    ),
                  ],
                ),

                SizedBox(
                  height: 0.01 * height,
                ),
                SizedBox(
                  height: 0.2* height,
                  child: ListView.separated(
                    scrollDirection: Axis.horizontal,
                    separatorBuilder: (context, index) => SizedBox(width: width* 0.02,),
                    itemCount: 3,
                    itemBuilder: (context, index) => buildStoryItem(),),
                ),
                SizedBox(height: 0.02* height),
                /// recent jobs title
                Row(
                  children: [

                    SizedBox(width: 0.7*width,
                    child:
                    const DefaultText(
                      text: (" Recent Job "),
                      color: AppTheme.black,
                      fontSize: 20,
                      fontWeight: FontWeight.normal,
                    ),
                    ),
                    InkWell(
                      onTap: () {
                        Navigator.pushNamed(context, "AllJobsScreen");
                        //Navigator.of(context).pushReplacementNamed("AllJobsScreen");
                      },
                      child: const Text(
                        " view all",
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 15,
                            color: AppTheme.blueButtonGP),
                      ),
                    ),
                  ],
                ),
                /// recent jobs list
                SizedBox(height: 0.02* height),
                BlocBuilder<AllJobsCubit, AllJobsState>(
  builder: (context, state) {
    return Expanded(
      child: SizedBox(
        height: 1.5 * height,
                    child: ListView.separated(
                      shrinkWrap: true,
                      separatorBuilder: (context, index) => const Divider(thickness: 1,color: AppTheme.gray,endIndent: 20, indent:
                      20,),
                      itemCount: AllJobsCubit.get(context).jobsList!.length,
                      itemBuilder: (context , index){
                        return BuilderAllJobs(
                          item: AllJobsCubit.get(context).jobsList![index],);
                      },

                    ),
                  ),
    );
  },
),
          //         Container(
          //           height: 0.32* height,
          //           child: ListView.separated(
          //                             scrollDirection: Axis.vertical,
          //                             separatorBuilder: (context, index) => SizedBox(height: 0.01* height),
          //                             shrinkWrap: true,
          //             itemCount: 3,
          //            itemBuilder: (context, index) =>buildStoryItem() ,
          //            // itemBuilder: (context, index) => BuilderAllJobs(AllJobsCubit.get(context).jobsList),),
          //         ),
          //
          //
          // ),
]
        ),
      ),
      ),
    );
  }

  Widget buildStoryItem()=>  Container(
    width: 300,
    decoration: BoxDecoration(
        color: AppTheme.blueDarkGP,
        border: Border.all(color: AppTheme.blueDarkGP, width: 1),
        borderRadius: BorderRadius.circular(12)),
    child:  Padding(
      padding: const EdgeInsets.only(top: 10, left: 10,right: 10),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Image.asset("assets/images/zoom-logo.png", width: 40, height:40,),
              const SizedBox(width: 5),
              const Column(
                crossAxisAlignment:CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  DefaultText(
                    text: ("Product Designer"),
                    color: AppTheme.whiteGP,
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),

                  DefaultText(
                    text: ("Zoom . United States"),
                    color: AppTheme.whiteGP,
                    fontSize:15,
                    fontWeight: FontWeight.normal,
                  ),
                ],
              ),
              const SizedBox(width: 40),
              Image.asset("assets/images/saved_inactive_white.png",width: 30, height: 30,),
            ],
          ),
          const SizedBox(
            height: 4,
          ),
          Row(
            children: [
              Container(
                height: 20,
                width: 70,

              margin: const EdgeInsets.all(2),
                alignment: Alignment.center,
                decoration: BoxDecoration(
                    color: AppTheme.blueDarkGP2,
                    border: Border.all(color: AppTheme.blueDarkGP2, width: 1),
                    borderRadius: BorderRadius.circular(12)),
                child: const DefaultText(
                  text: ("Fulltime "),
                  color: AppTheme.whiteGP,
                  fontSize: 10,
                  fontWeight: FontWeight.normal,
                ),
              ),
              Container(
                height: 20,
                width: 70,
                //color: AppTheme.blueLightGP,
                margin: const EdgeInsets.all(2),
                alignment: Alignment.center,
                decoration: BoxDecoration(
                    color: AppTheme.blueDarkGP2,
                    border: Border.all(color: AppTheme.blueDarkGP2, width: 1),
                    borderRadius: BorderRadius.circular(12)),
                child: const DefaultText(
                  text: ("Remote "),
                  color: AppTheme.whiteGP,
                  fontSize: 10,
                  fontWeight: FontWeight.normal,
                ),
              ),
              Container(
                height: 20,
                width: 70,
                margin: const EdgeInsets.all(2),
                alignment: Alignment.center,
                decoration: BoxDecoration(
                    color: AppTheme.blueDarkGP2,
                    border: Border.all(color: AppTheme.blueDarkGP2, width: 1),
                    borderRadius: BorderRadius.circular(12)),
                child: const DefaultText(
                  text: ("Design"),
                  color: AppTheme.whiteGP,
                  fontSize: 10,
                  fontWeight: FontWeight.normal,
                ),
              ),
            ],),
      Row(
        crossAxisAlignment: CrossAxisAlignment.end,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
      const DefaultText(
        text: (" 1800 "),
        color: AppTheme.whiteGP,
        fontSize:30,
        fontWeight: FontWeight.normal,
      ),
      const DefaultText(
        text: (" /Month "),
        color: AppTheme.whiteGP,
        fontSize: 15,
        fontWeight: FontWeight.normal,
      ),
          const SizedBox(width: 20,),

          ElevatedButton(
            style: ElevatedButton.styleFrom(
                backgroundColor: AppTheme.blueButtonGP,
                shadowColor: Colors.lightBlue,
            ),
            onPressed: () {},
            child:  const DefaultText(
                  text: (" Apply now "),
                  color: AppTheme.whiteGP,
                  fontSize:12,
                  fontWeight: FontWeight.normal,
                ),
          ),
         ],
      ),
        ],
      ),
    ),
  );
}
