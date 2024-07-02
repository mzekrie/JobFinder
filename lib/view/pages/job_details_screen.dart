import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gp_amit60_mary_zekrie/view/builder_item/job_Details_item.dart';

import '../../control/cubit/job/all_jobs_cubit.dart';
import '../../model/shared/colors_theme.dart';
import '../../router/router.dart';

//import 'package:flutter_bloc/flutter_bloc.dart';

class JobsDetailsScreen extends StatefulWidget {
  const  JobsDetailsScreen({super.key});

  @override
  State<JobsDetailsScreen> createState() => _JobsDetailsScreenState();
}

class _JobsDetailsScreenState extends State<JobsDetailsScreen> {
  var pageJobController = PageController();
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;

    return BlocBuilder<AllJobsCubit, AllJobsState>(
      builder: (context, state) {
        return SafeArea (
          child: Scaffold(
            appBar:  AppBar(
              backgroundColor: AppTheme.chat_bg_white,
              leading:IconButton(
                  onPressed: (){
                    Navigator.of(context).popAndPushNamed(AppRoute.allJobsScreen);
                  },
                  icon: Image.asset("assets/images/arrow-left.png",)),

              centerTitle: true,
              title: const Text("Job Details",  style: TextStyle(
                  fontWeight: FontWeight.bold, color: Colors.black)),

              actions: [
                Padding(
                  padding: const EdgeInsets.only(right: 10),
                  child: IconButton(
                      onPressed: (){},
                      icon: Image.asset("assets/images/job_saved.png",)),

                ),
              ],
            ),
            body: Padding(
              padding: const EdgeInsets.only(left: 10, right: 10, top: 10),
              child:
                  PageView.builder(
                    controller: pageJobController,
                    itemBuilder: (context , index){
                      return BuilderJobDetails(item: AllJobsCubit.get(context).jobsList![index],);
                    },
                    itemCount:  AllJobsCubit.get(context).jobsList!.length,

                  ),


            ) ,
          ),
        );
      },
    );


  }
}



