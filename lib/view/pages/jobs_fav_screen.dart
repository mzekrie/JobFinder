library;
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gp_amit60_mary_zekrie/control/cubit/fav_job/fav_jobs_cubit.dart';
import 'package:gp_amit60_mary_zekrie/view/builder_item/fav_job_item.dart';
import '../../model/shared/colors_theme.dart';
import '../../router/router.dart';

class SavedJobsScreen extends StatefulWidget {
  const SavedJobsScreen({super.key});
  @override
  State<SavedJobsScreen> createState() => _SavedJobsScreenState();
}
class _SavedJobsScreenState extends State<SavedJobsScreen> {
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;

    return Scaffold(
          appBar: AppBar(
            leading: IconButton(
                onPressed: () {
                  Navigator.of(context).pushNamedAndRemoveUntil(AppRoute.homeScreen, (route) => false);
                },
                icon: Image.asset(
                  "assets/images/arrow-left.png",
                )),
            title: const Text("Saved job "),
            actions:[
              IconButton(
                onPressed: (){
                  Navigator.of(context).pushNamedAndRemoveUntil(AppRoute.jobsFavLayout, (route) => false);

                },
                icon: const Icon(
                  Icons.favorite,
                  color: AppTheme.gray,
                ),
              ),
            ],

          ),
          body:  BlocBuilder<FavJobsCubit, FavJobsState>(
  builder: (context, state) {
    return Expanded(
      child: SizedBox(
        width: double.maxFinite,
        height: double.maxFinite,
        child: ListView.separated(
          shrinkWrap: true,
                           separatorBuilder: (context, index) =>  const Divider(thickness: 1,color: AppTheme.gray,endIndent: 20, indent:
                           20,),
                           itemCount: FavJobsCubit.get(context).favJobList!.length,
                           itemBuilder: (context, index) {
                             return BuilderFavJobs(
                               item: FavJobsCubit.get(context).favJobList![index],
                             );
                           },
                         ),
      ),
    );
  },
),

);
}
}
