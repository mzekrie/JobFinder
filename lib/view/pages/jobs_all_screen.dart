import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gp_amit60_mary_zekrie/control/cubit/job/all_jobs_cubit.dart';
import 'package:gp_amit60_mary_zekrie/view/pages/jobs_filter.dart';
import '../../model/shared/colors_theme.dart';
import '../../router/router.dart';
import '../builder_item/all_job_item.dart';
import '../widget/default_text_field.dart';


class AllJobsScreen extends StatefulWidget {
   const AllJobsScreen({super.key});

  @override
  State<AllJobsScreen> createState() => _AllJobsScreenState();
}

class _AllJobsScreenState extends State<AllJobsScreen> {


  void _OpenFilter(){
    showModalBottomSheet(
        isScrollControlled: true,
        context: context,
        builder: (ctx)=> const JobsFilterScreen());
  }

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;

    return BlocBuilder<AllJobsCubit, AllJobsState>(
      builder: (context, state) {
        return SafeArea(
          child: Scaffold(
            appBar: AppBar(
              ///search
              leading: IconButton(
                  onPressed: () {
                    Navigator.of(context).popAndPushNamed(AppRoute.homeScreen);
                  },
                  icon: Image.asset(
                    "assets/images/arrow-left.png",
                  )),
              title: const Text("Search job "),
              actions: [
                /// search delegate
                IconButton(
                  onPressed: () {
                    showSearch(context: context, delegate: CustomSearch());
                  },
                  icon: const Icon(Icons.search),
                ),
              ],
            ),
            body: Padding(
              padding: const EdgeInsets.only(left: 10, right: 10, top: 20),
              child: Column(
                children: [
                  ///filter
                  Row(
                    children: [

                      IconButton(
                          onPressed : _OpenFilter,
                          icon: Image.asset("assets/images/Job_filter.png",)),

                      SizedBox(
                        width: 0.02 * width,
                      ),
                      OutlinedButton(
                        onPressed: () {},
                        child: const Row(
                          children: [
                            //Icon(Icons.email),
                            Text(
                              'Remote',
                              style: TextStyle(
                                color: AppTheme.gray,
                              ),
                            ),
                            SizedBox(
                                height: 20,
                                width: 30,
                                child: Image(
                                    image: AssetImage(
                                  'assets/images/arrow-down_gray.png',
                                ))),
                          ],
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: height * 0.02,
                  ),

                  /// list of jobs
                  SizedBox(
                    height: height * 0.02,
                  ),
                  Expanded(
                    child: ListView.separated(
                      separatorBuilder: (context, index) => const Divider(thickness: 1,color: AppTheme.gray,endIndent: 20, indent:
                      20,),
                      itemCount: AllJobsCubit.get(context).jobsList!.length,
                      itemBuilder: (context, index) {
                        return BuilderAllJobs(
                          item: AllJobsCubit.get(context).jobsList![index],
                        );
                      },
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );

    /// if we need to get the list but it has errors
    // return BlocBuilder<AllJobsCubit, AllJobsState>(
    //   builder: (context, state) {
    //     return listJobItem(list:AllJobsCubit
    //         .get(context)
    //         .jobsList!);
    //   },
    // );
  }
}

class CustomSearch extends SearchDelegate {
  List? filterlist;
  final List _joblist = ["Test Engineers","Machine learning Engineer", "Flutter Developer"];
  final List _recentJobSearchList = ["Junior UI Designer","Junior UX Designer", "Product Designer","Project Manager" ];
  @override
  List<Widget>? buildActions(BuildContext context) {
    ///return list of widget like icons
    ///has a build in query that hold search criteria

    return [
      IconButton(
          onPressed: () {
            query = "";
          },
          icon: const Icon(Icons.close)),

    ];
  }

  @override
  Widget? buildLeading(BuildContext context) {
    return IconButton(
        onPressed: () {
          close(context, null);
        },
        icon: const Icon(Icons.arrow_back));
  }

  @override
  Widget buildResults(BuildContext context) {
    return
       Column (
         crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: 50,
          width: double.infinity,
          color: AppTheme.gray,
          child:
          const Padding(
            padding: EdgeInsets.all(8.0),
            child: DefaultText(
              text: ("    Result: Featuring 120+ jobs"),
              color: AppTheme.grayGP,
              fontSize: 15,
              fontWeight: FontWeight.normal,
            ),
          ),),
          Expanded(
            child: ListView.separated(
              separatorBuilder: (context, index) => const Divider(thickness: 1,color: AppTheme.gray,endIndent: 20, indent:
                 20,),
              itemCount: AllJobsCubit.get(context).jobsList!.length,
              itemBuilder: (context, index) {
                return BuilderAllJobs(
                  item: AllJobsCubit.get(context).jobsList![index],
                );
              },
            ),
          ),
        ],
      )
    ;
  }
  @override
  Widget buildSuggestions(BuildContext context) {
/// show no result
    if(query == ''){
      return Padding(
        padding: const EdgeInsets.all(18.0),
        child: Expanded(
          child:
           Column(
             children: [
               Image.asset("assets/images/job_no_search.png"),
               const SizedBox(height: 20,),
               const DefaultText(
                 text: ("Search not found"),
                 color: AppTheme.blackGP,
                 fontSize: 30,
                 fontWeight: FontWeight.normal,
               ),
               const SizedBox(height: 20,),
               const DefaultText(
                 text: ("Try searching with different keywords so we can show you"),
                 color: AppTheme.grayGP,
                 fontSize: 15,
                 fontWeight: FontWeight.normal,
               ),

             ],
           ),

        ),
      );
    }
    else{
      /// i created a temp list that will hold the list of names from the job list
      filterlist = _joblist.where((element) => element.contains(query)).toList();
      return Column(
        children: [
          Container(
            height: 40,
            width: double.infinity,
            color: AppTheme.gray,
            child:
            const Padding(
              padding: EdgeInsets.all(8.0),
              child: DefaultText(
                text: ("  Recent searches"),
                color: AppTheme.grayGP,
                fontSize: 15,
                fontWeight: FontWeight.normal,
              ),
            ),),
          Expanded(
            child: ListView.builder(
              itemCount: _recentJobSearchList.length,
              itemBuilder: (context, index) {
                return Card(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      children: [
                        Image.asset("assets/images/clock.png"),
                        const SizedBox(width: 10,),
                        SizedBox(
                          width : 250,
                          child:  DefaultText(
                            text: ("${_recentJobSearchList[index]}"),
                            color: AppTheme.grayGP,
                            fontSize: 15,
                            fontWeight: FontWeight.normal,
                          ),
                        ),
                        IconButton(
                          onPressed: () {
                            showResults(context);
                          },
                          icon: Image.asset("assets/images/close-circle.png"),
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
          Container(
            height: 40,
            width: double.infinity,
            color: AppTheme.gray,
            child:
            const Padding(
              padding: EdgeInsets.all(8.0),
              child: DefaultText(
                text: ("  Popular searches"),
                color: AppTheme.grayGP,
                fontSize: 15,
                fontWeight: FontWeight.normal,
              ),
            ),),
          Expanded(
            child: ListView.builder(
              itemCount: filterlist!.length,
              itemBuilder: (context, index) {
                return Card(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      children: [
                        Image.asset("assets/images/search-status.png"),
                        const SizedBox(width: 10,),
                        SizedBox(
                          width : 250,
                          child:  DefaultText(
                            text: ("${filterlist?[index]}"),
                            color: AppTheme.grayGP,
                            fontSize: 15,
                            fontWeight: FontWeight.normal,
                          ),
                        ),
                        IconButton(
                          onPressed: () {
                            showResults(context);
                          },
                          icon: Image.asset("assets/images/arrow-right.png"),
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
          // Expanded(
          //   child: ListView.builder(
          //     itemCount: AllJobsCubit.get(context).jobsList!.length,
          //     itemBuilder: (context, index) {
          //       return Card(
          //         child: Padding(
          //           padding: const EdgeInsets.all(8.0),
          //           child: Row(
          //             children: [
          //               Image.asset("assets/images/search-status.png"),
          //               SizedBox(width: 10,),
          //               Container(
          //                 width : 250,
          //                 child:  DefaultText(
          //                   text: ("${AllJobsCubit.get(context).jobsList![index].name}"),
          //                   color: AppTheme.grayGP,
          //                   fontSize: 15,
          //                   fontWeight: FontWeight.normal,
          //                 ),
          //               ),
          //               IconButton(
          //                 onPressed: () {
          //                   showResults(context);
          //                 },
          //                 icon: Image.asset("assets/images/arrow-right.png"),
          //               ),
          //             ],
          //           ),
          //         ),
          //       );
          //     },
          //   ),
          // ),
        ],
      );


   }

  }
}
