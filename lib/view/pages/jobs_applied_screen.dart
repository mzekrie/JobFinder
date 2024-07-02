
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gp_amit60_mary_zekrie/control/cubit/applied_job/applied_job_cubit.dart';
import 'package:gp_amit60_mary_zekrie/view/builder_item/job_applied_item.dart';

import '../../model/shared/colors_theme.dart';
import '../../router/router.dart';
//import 'package:flutter_bloc/flutter_bloc.dart';

class AppliedJobsScreen extends StatelessWidget {
  const AppliedJobsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppTheme.chat_bg_white,
        leading: IconButton(
            onPressed: () {
              Navigator.of(context).popAndPushNamed(AppRoute.allJobsScreen);
            },
            icon: Image.asset(
              "assets/images/arrow-left.png",
            )),
        centerTitle: true,
        title: const Text("Applied Job",
            style: TextStyle(fontWeight: FontWeight.bold, color: Colors.black)),
      ),
      body: Expanded(
        child: ListView.separated(
          separatorBuilder: (context, index) => SizedBox(height: height* 0.02,),
          itemCount: AppliedJobCubit.get(context).appliedJobsList!.length,
          itemBuilder: (context , index){
            return BuilderAppliedJobs(
              item: AppliedJobCubit.get(context).appliedJobsList![index],);
          },

        ),
      )
    );
  }
}

// end of state widget
