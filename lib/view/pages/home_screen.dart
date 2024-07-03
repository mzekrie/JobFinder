import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gp_amit60_mary_zekrie/model/shared/colors_theme.dart';
import 'package:gp_amit60_mary_zekrie/view/pages/profile_screen.dart';
import 'package:gp_amit60_mary_zekrie/view/pages/jobs_fav_screen.dart';
import '../../control/cubit/job/all_jobs_cubit.dart';
import '../../model/shared/constant_attribute.dart';
import 'jobs_applied_screen.dart';
import 'jobs_land_screen.dart';
import 'message_screen.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});
  @override

  List <Widget> screens =[
     const JobsScreen(),
     const MessageScreen(),
     const AppliedJobsScreen(),
     const SavedJobsScreen(),
     const ProfileScreen()
  ];

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AllJobsCubit, AllJobsState>(
  listener: (BuildContext context, state) {
    // TODO: implement listener
  },
  builder: (context, state) {
    return Scaffold(
      extendBody: true,
      key: scaffoldKey,
      body: screens[AllJobsCubit.get(context).currentIndex],


      bottomNavigationBar: BottomNavigationBar(
          selectedFontSize: 12,
          unselectedFontSize: 10,
          type: BottomNavigationBarType.fixed,
          backgroundColor: Colors.white,
          selectedItemColor: AppTheme.blueButtonGP,
          unselectedItemColor: AppTheme.grayGP,
          elevation: 0,
          currentIndex: AllJobsCubit.get(context).currentIndex,
          onTap: (index) => AllJobsCubit.get(context).changeButtonNavbar(index),
          items: [
            BottomNavigationBarItem(
              icon: Image.asset("assets/images/menu_home_inactive.png"),
              activeIcon:Image.asset("assets/images/menu_home_active.png"),
              label: "Home",
            ),
            BottomNavigationBarItem(
              icon: Image.asset("assets/images/menu_message_inactive.png"),
              activeIcon:Image.asset("assets/images/menu_message_active.png"),
              label: "Messages",
            ),
            BottomNavigationBarItem(
              icon: Image.asset("assets/images/menu_applied_inactive.png"),
              activeIcon:Image.asset("assets/images/menu_applied_active.png"),
              label: "Applied",
            ),
            BottomNavigationBarItem(
              icon: Image.asset("assets/images/menu_saved_inactive.png"),
              activeIcon:Image.asset("assets/images/menu_saved_active.png"),
              label: "Saved",
            ),
            BottomNavigationBarItem(
              icon: Image.asset("assets/images/menu_profile_inactive.png"),
              activeIcon:Image.asset("assets/images/menu_profile_active.png"),
              label: "Profile",
            )
          ]),
    );
  },
);
  }
}
