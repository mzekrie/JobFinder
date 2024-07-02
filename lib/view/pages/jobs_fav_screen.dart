
/// code using API but it gives error
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
                  Navigator.of(context).popAndPushNamed(AppRoute.homeScreen);
                },
                icon: Image.asset(
                  "assets/images/arrow-left.png",
                )),
            title: const Text("Saved job "),

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

/// code using local db
// import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:gp_amit60_mary_zekrie/control/cubit/fav_job/app_cubit.dart';
// import '../../model/shared/colors_theme.dart';
// import '../../router/router.dart';
// import '../widget/default_form_field.dart';
//
//
//
// class SavedJobsScreen extends StatelessWidget {
//   var titleController = TextEditingController();
//   var timeController = TextEditingController();
//   var dateController = TextEditingController();
//   GlobalKey<ScaffoldState> scaffoldKey2 =
//   GlobalKey(); // for making screen detects snack bar
//   GlobalKey<FormState> formKey2 = GlobalKey();
//   @override
//   Widget build(BuildContext context) {
//     return BlocConsumer<AppCubit, AppState>(
//       // الكيوبت يتحرك جوا الشاشه
//       listener: (context, state) {
//         // TODO: implement listener
//         if (state is AppInsertDatabaseState) {
//           Navigator.pop(context);
//         }
//       },
//       builder: (context, state) {
//         AppCubit cubit = AppCubit.get(context);
//         return Scaffold(
//           appBar: AppBar(
//             leading: IconButton(
//                 onPressed: () {
//                   Navigator.of(context).popAndPushNamed(AppRoute.homeScreen);
//                 },
//                 icon: Image.asset(
//                   "assets/images/arrow-left.png",
//                 )),
//             title: const Text("Saved job "),
//             actions: [
//               IconButton(
//                 onPressed: () {
//                   if (cubit.isBottomSheet) {
//                     // true
//                     if (formKey2.currentState!.validate()) {
//                       // nested if
//                       cubit.insertToDatabase(
//                         // calling insert
//                         title: titleController.text,
//                         date: dateController.text,
//                         time: timeController.text,
//                       );
//                     }
//                   } else {
//                     //// false
//                     scaffoldKey2.currentState!
//                         .showBottomSheet(
//                           (context) => Container(
//                         color: Colors.grey[100],
//                         child: Padding(
//                           padding: EdgeInsets.all(20),
//                           child: Form(
//                             key: formKey2,
//                             child: Column(
//                               mainAxisSize: MainAxisSize.min,
//                               children: [
//                                 DefaultFormField(
//                                     radius: 10,
//                                     backgroundColor: AppTheme.whiteGP,
//                                     controller: titleController,
//                                     keyboardType: TextInputType.text,
//                                     labelText: "enter job title ",
//                                     validator: (value) {
//                                       if (value!.isEmpty) {
//                                         return "Username cannot be empty, please enter valid email ";
//                                       } else {
//                                         return null;
//                                       }
//                                     }),
//                                 SizedBox(
//                                   height: 15,
//                                 ),
//                                 DefaultFormField(
//                                     radius: 10,
//                                     backgroundColor: AppTheme.whiteGP,
//                                     controller: timeController,
//                                     keyboardType: TextInputType.text,
//                                     labelText: "enter time ",
//                                     validator: (value) {
//                                       if (value!.isEmpty) {
//                                         return "Username cannot be empty, please enter valid email ";
//                                       } else {
//                                         return null;
//                                       }
//                                     }),
//                                 SizedBox(
//                                   height: 15,
//                                 ),
//                                 DefaultFormField(
//                                     radius: 10,
//                                     backgroundColor: AppTheme.whiteGP,
//                                     controller: dateController,
//                                     keyboardType: TextInputType.text,
//                                     labelText: "enter date title ",
//                                     validator: (value) {
//                                       if (value!.isEmpty) {
//                                         return "Username cannot be empty, please enter valid email ";
//                                       } else {
//                                         return null;
//                                       }
//                                     }),
//                               ],
//                             ),
//                           ),
//                         ),
//                       ),
//                     )
//                         .closed
//                         .then((value) {
//                       cubit.isBottomSheet = false;
//                       cubit.fabIcon = Icons.edit;
//                     });
//                     cubit.isBottomSheet = true;
//                     cubit.fabIcon = Icons.add;
//                   } // else
//                 },
//                 icon: Icon(
//                   cubit.fabIcon,
//                   color: AppTheme.blueButtonGP,
//                 ),
//               )
//             ],
//           ),
//
//           body: Container(),
//           // body: ConditionalBuilder(
//           //             condition: state is! AppCreateDatabaseLoadingState , // طول ما هو مش بيحمل
//           //             builder: (context) => cubit.screens[cubit.currentIndex], // في حالة تحقق  الشرط
//           //             fallback: (context) => Center(child: CircularProgressIndicator()) , // في حالة عدم تحقق الشرط
//           //           ) ,
//         );
//       },
//     );
//   }
//
// } // class