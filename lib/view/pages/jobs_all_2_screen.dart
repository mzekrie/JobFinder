import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../control/cubit/fav_job/app_cubit.dart';
import '../builder_item/all_job_2_item.dart';


class JobsAll2Screen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AppCubit,AppState>(
      listener: (context,state){},
      builder: (context,state) {
        var jobs = AppCubit.get(context).allJobs ;
        return  ListView.separated(
          itemBuilder: (context,index) => BuilderAllJobs2(jobs[index],context) ,
          separatorBuilder: (context,index) => Padding(
            padding: const EdgeInsetsDirectional.only(
              start: 20,
            ),
            child: Container(
              width: double.infinity,
              height: 1,
              color: Colors.grey[300],
            ),
          ),
          itemCount: jobs.length,
        );
      },
    );

  }
}