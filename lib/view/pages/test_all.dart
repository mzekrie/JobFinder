/// you tube --> file upload
//https://www.youtube.com/watch?v=bDnwMXLDRpw
//https://www.youtube.com/watch?v=scvfDdGXWic

///W/WindowOnBackDispatcher( 6260): Set 'android:enableOnBackInvokedCallback="true"' in the application manifest.
// widget tutorials
// //https://www.youtube.com/watch?v=M9J-JJOuyE0&t=1590s
//https://www.youtube.com/watch?v=rUWhNQlJ61U

/// tab
// https://www.youtube.com/watch?v=m_MXkSKz_F8
///Flutter: Modal Bottom Sheet: Full Screen: Step by step
//https://www.youtube.com/watch?v=2hKSbiEcqoo
/// upload image
// https://www.youtube.com/watch?v=jOOSiJY7Ke4
//  Navigator.pop(context);

//!  dart fix --apply
// dart fix --dry-run



//
// import 'package:flutter/material.dart';
//
// class BuilderOnBoardingScreen extends StatelessWidget {
//   const BuilderOnBoardingScreen({ super.key });
//
//   @override
//   Widget build(BuildContext context) {
//     return  Scaffold(
//       body: PageView.builder(
//         itemBuilder: itemBuilder, itemCount: 3,),
//     );
//   }
// }
/// navigation
// Navigator.of(context).pushNamedAndRemoveUntil(
//                                       AppRoute.homeScreen, (route) => false);                                     AppRoute.homeScreen, (route) => false);
/// toast
//Fluttertoast.showToast(
//                                 msg: "Saved Sucessfully!",
//                                 toastLength: Toast.LENGTH_SHORT,
//                                 gravity: ToastGravity.BOTTOM,
//                                 timeInSecForIosWeb: 3,
//                                 backgroundColor: Colors.green,
//                                 textColor: Colors.white,
//                                 fontSize: 16.0
//                             );
/// decoration
// decoration: InputDecoration(
//                   enabledBorder: OutlineInputBorder(borderSide:
//                   BorderSide ( color:AppTheme.grayGP, width:1) )
//                 ),

//
// decoration: BoxDecoration(
// border:Border.all(
// width: 1,
// color: AppTheme.blueButtonGP,  //                   <--- border width here
// ),
// borderRadius: BorderRadius.circular(25),
// color:  AppTheme.profile_baby_blue),
// child: DefaultText(
// text: "Nunc quis bibendum orci. Donec feugiat massa mi, at hendrerit mauris rutrum at. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nam vel augue sit amet est molestie viverra. Nunc quis bibendum orci. Donec feugiat massa mi, at hendrerit mauris rutrum at. ",
// color: AppTheme.grayGP,
// fontSize: 12,
// fontWeight: FontWeight.normal,
// ),
/// bloc consumer
// body: Stack(
//   children: [
//     BlocConsumer<AllJobsCubit, AllJobsState>(
//       listener: (BuildContext context, state) {
//         if (state is LoadingAllJobsDataState ) {
//           Center(
//             child: CircularProgressIndicator(),
//           );
//         }
//         else if (state is ErrorAllJobsDataState ) {
//           Center(
//             child: Column(
//               children: [
//                 Icon(
//                   Icons.error,
//                   color: AppTheme.kErrorColor,
//                   size: 60,
//                 ),
//                 DefaultText(
//                   text: "Error in loading list of jobs ",
//                   color: AppTheme.kErrorColor,
//                   fontSize: 20,
//                   fontWeight: FontWeight.bold,
//                 ),
//               ],
//             ),
//           );
//         } },
//       builder: (BuildContext context, state) {
//         return SizedBox(height: 20,);
//         //AllJobsCubit.get(context).screens[AllJobsCubit.get(context).currentIndex];
//       },
//     )
//   ],
// ),
/// customize container
//https://stackoverflow.com/questions/57777737/flutter-give-container-rounded-border
/// routing
// Navigator.of(context).pushNamedAndRemoveUntil(AppRoute.notificationNoDataScreen, (route) => false);