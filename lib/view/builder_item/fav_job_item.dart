import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gp_amit60_mary_zekrie/control/cubit/fav_job/fav_jobs_cubit.dart';
import '../../model/fav_job_model.dart';
import '../../model/shared/colors_theme.dart';
import '../pages/jobs_fav_more_options.dart';
import '../widget/default_text_field.dart';

class BuilderFavJobs extends StatefulWidget {
  Data item;
  BuilderFavJobs({super.key, required this.item});
  @override
  State<BuilderFavJobs> createState() => _BuilderFavJobsState();
}

class _BuilderFavJobsState extends State<BuilderFavJobs> {
 // make the object required

  void _OpenMoreOptionSheet(){
    showModalBottomSheet(
        context: context,
        builder: (ctx)=> const FavJobsOptions());
  }
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return  BlocConsumer<FavJobsCubit, FavJobsState>(

    // TODO: implement listener

      listener: (BuildContext context, state) {
        if (state is LoadingFavJobsState) {
          const Center(
            child: const CircularProgressIndicator(),
          );
        }
        else if (state is ErrorGetFavJobsState) {
          const Center(
            child: const Column(
              children: [
                Icon(
                  Icons.error,
                  color: AppTheme.kErrorColor,
                  size: 60,
                ),
                DefaultText(
                  text: "Error in loading list of jobs ",
                  color: AppTheme.kErrorColor,
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ],
            ),
          );
        }
        }, builder: (BuildContext context, FavJobsState state) {
      return Container(
        decoration: const BoxDecoration(
            color: AppTheme.whiteGP),
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Image.network(
                    "${widget.item.image}", height: 0.1 * width,
                    width: 0.1 * width,),
                  SizedBox(width: 0.03 * width),
                  SizedBox(
                    width: 0.5 * width,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment
                          .start,
                      children: [
                        DefaultText(
                          text: ("${widget.item.jobs!.name}"),
                          color: Colors.black,
                          fontSize: 15,
                          fontWeight: FontWeight.bold,
                        ),
                        SizedBox(
                          height: height * 0.02,
                        ),
                        DefaultText(
                          text: ("${widget.item.jobs!
                              .compName}. United States"),
                          color: AppTheme.gray,
                          fontSize: 15,
                          fontWeight: FontWeight.normal,
                        ),
                      ],
                    ),
                  ),
                  SizedBox(width: 0.1 * width),
                  IconButton(
                    onPressed:_OpenMoreOptionSheet,
                    icon: Image.asset("assets/images/more.png"),)

                ],
              ),
              SizedBox(
                height: height * 0.02,
              ),
              Row(
                children: [
                  const DefaultText(
                    text: (" Posted 2 days ago "),
                    color: AppTheme.grayGP,
                    fontSize: 12,
                    fontWeight: FontWeight.normal,
                  ),
                  SizedBox(
                    width: width * 0.17,
                  ),
                  Image.asset("assets/images/clockFav.png"),
                  SizedBox(
                    width: width * 0.02,
                  ),
                  const DefaultText(
                    text: ("Be an early applicant"),
                    color: AppTheme.grayGP,
                    fontSize: 12,
                    fontWeight: FontWeight.normal,
                  ),
                ],
              ),
            ],
          ),
        ),);
    },
);

  }
}

Widget listFavJobItem({required List <Data> list}){
  return

    /// list
    Expanded(
      child: ListView.separated(
        separatorBuilder: (context, index)=> const SizedBox(height:40,),
        //scrollDirection:Axis.vertical,
        itemCount: list.length,
        shrinkWrap: true,
        itemBuilder: (context, index)=> BuilderFavJobs(
          item: list[index],),
      ),

    );
}
