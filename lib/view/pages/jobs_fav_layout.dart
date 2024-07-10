import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:fluttertoast/fluttertoast.dart';
import '../../control/cubit/fav_job/app_cubit.dart';
import '../../model/shared/colors_theme.dart';
import '../../router/router.dart';
import '../widget/default_form_field.dart';

class JobsFavLayout extends StatefulWidget {
  @override
  State<JobsFavLayout> createState() => _JobsFavLayoutState();
}

class _JobsFavLayoutState extends State<JobsFavLayout> {
  var titleJobController = TextEditingController() ;

  var compNameController = TextEditingController();

  var jobTimeTypeController = TextEditingController() ;

  var jobTypeController = TextEditingController();

  var salaryController = TextEditingController();

  var locationController = TextEditingController();

  var favoritesController = TextEditingController(text: '0');

  GlobalKey<ScaffoldState> scaffoldKey1 = GlobalKey();
 // for making screen detects snack bar
  GlobalKey<FormState> formKey2Jobs = GlobalKey();

  @override
  Widget build(BuildContext context) {

     var height = MediaQuery.of(context).size.height;
    //var width = MediaQuery.of(context).size.width;
    return BlocProvider( // السيستم بقا جوا البلوك
      create: (context) => AppCubit()..createDatabase(), // ربطت الكود بل كيوبت و استدعاء الداتا بيس
      child: BlocConsumer<AppCubit,AppState>(
        listener: (context ,  AppState state){
          if (AppState is AppInsertDatabaseState){
            Navigator.pop(context);
          }
        },
        builder: (context, AppState state){  // ربطنا الكود بل بلوك
          AppCubit cubit = AppCubit.get(context); // الكيوبت يتحرك جوا الشاشه
          return   Scaffold(
            key: scaffoldKey1,
            appBar: AppBar(
              backgroundColor: AppTheme.blueButtonGP,
              title: Text(
                cubit.titles[cubit.currentIndex],
                style: const TextStyle(
                  color: Colors.white,
                ),
              ),
              actions: [
                IconButton(
                  onPressed: (){
                    Navigator.of(context).pushNamedAndRemoveUntil(AppRoute.savedJobsScreen, (route) => false);
                  },
                  icon: const Icon(
                    Icons.close,
                    color: AppTheme.whiteGP,
                  ),
                ),
              ],
            ),
            body: ConditionalBuilder(
              condition: state is! AppCreateDatabaseLoadingState , // طول ما هو مش بيحمل
              builder: (context) => cubit.screens[cubit.currentIndex], // في حالة تحقق  الشرط
              fallback: (context) => const Center(child: CircularProgressIndicator()) , // في حالة عدم تحقق الشرط
            ) ,
            floatingActionButton: FloatingActionButton(
              backgroundColor: AppTheme.blueButtonGP,
              onPressed: () {
                if(cubit.isBottomSheet){ // true
                  if(formKey2Jobs.currentState!.validate()){// if user filled all the data = true
                    AppCubit.get(context).insertToDatabase
                      (title: titleJobController.text,
                        companyName: compNameController.text,
                        jobTimeType: jobTimeTypeController.text,
                        jobType: jobTypeController.text,
                        salary: salaryController.text,
                        location: locationController.text,
                        favorites: favoritesController.text);

                    titleJobController.clear();
                    compNameController.clear();
                    jobTimeTypeController.clear();
                    jobTypeController.clear();
                    salaryController.clear();
                    locationController.clear();
                    favoritesController.clear();

                    Navigator.pop(context);

                    Fluttertoast.showToast(
                        msg: "Fav added Successfully",
                        toastLength: Toast.LENGTH_SHORT,
                        gravity: ToastGravity.CENTER,
                        timeInSecForIosWeb: 1,
                        backgroundColor: Colors.green,
                        textColor: Colors.white,
                        fontSize: 16.0
                    );


                  }
                  else{print('form not validated');}
                }
                else{ // false
                  scaffoldKey1.currentState!.showBottomSheet( // if form validation gives error i will keep page
                        (context) => Container(
                      color: Colors.grey[100],
                      //height: double.infinity,
                      child: Padding(
                        padding: const EdgeInsets.all(20),
                        child: SingleChildScrollView(
                          child: Form(
                            key: formKey2Jobs,
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                DefaultFormField(
                                    radius: 10,
                                    backgroundColor: AppTheme.whiteGP,
                                    controller: titleJobController,
                                    keyboardType: TextInputType.text,
                                    labelText: "Job title",
                                    validator: (value) {
                                      if (value!.isEmpty) {
                                        return "Please enter value ";
                                      } else {
                                        return null;
                                      }
                                    }),
                                SizedBox(height: 0.02 * height),

                              DefaultFormField(
                                  radius: 10,
                                  backgroundColor: AppTheme.whiteGP,
                                  controller: compNameController,
                                  keyboardType: TextInputType.text,
                                  labelText: "Company Name",
                                  validator: (value) {
                                    if (value!.isEmpty) {
                                      return "Please enter value ";
                                    } else {
                                      return null;
                                    }
                                  }),
                              SizedBox(height: 0.02 * height),

                              DefaultFormField(
                                  radius: 10,
                                  backgroundColor: AppTheme.whiteGP,
                                  controller: jobTimeTypeController,
                                  keyboardType: TextInputType.text,
                                  labelText: "Job Time",
                                  validator: (value) {
                                    if (value!.isEmpty) {
                                      return "Please enter value ";
                                    } else {
                                      return null;
                                    }
                                  }),
                              SizedBox(height: 0.02 * height),

                              DefaultFormField(
                                  radius: 10,
                                  backgroundColor: AppTheme.whiteGP,
                                  controller: jobTypeController,
                                  keyboardType: TextInputType.text,
                                  labelText: "Job Type",
                                  validator: (value) {
                                    if (value!.isEmpty) {
                                      return "Please enter value ";
                                    } else {
                                      return null;
                                    }
                                  }),
                              SizedBox(height: 0.02 * height),

                              DefaultFormField(
                                  radius: 10,
                                  backgroundColor: AppTheme.whiteGP,
                                  controller: salaryController,
                                  keyboardType: TextInputType.text,
                                  labelText: "Salary",
                                  validator: (value) {
                                    if (value!.isEmpty) {
                                      return "Please enter value ";
                                    } else {
                                      return null;
                                    }
                                  }),
                              SizedBox(height: 0.02 * height),

                              DefaultFormField(
                                  radius: 10,
                                  backgroundColor: AppTheme.whiteGP,
                                  controller: locationController,
                                  keyboardType: TextInputType.text,
                                  labelText: "Location",
                                  validator: (value) {
                                    if (value!.isEmpty) {
                                      return "Please enter value ";
                                    } else {
                                      return null;
                                    }
                                  }),
                              SizedBox(height: 0.02 * height),

                              DefaultFormField(
                                  radius: 10,
                                  backgroundColor: AppTheme.whiteGP,
                                  controller: favoritesController,
                                  keyboardType: TextInputType.text,
                                  labelText: "Favorite ( 0 / 1 )",
                                  validator: (value) {
                                    if (value!.isEmpty) {
                                      return "Please enter value ";
                                    } else {
                                      return null;
                                    }
                                  }),
                              SizedBox(height: 0.02 * height),

                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                  ).closed.then((value){
                    cubit.isBottomSheet = false ;
                    cubit.fabIcon = Icons.add;
                    // titleJobController.clear();
                    // compNameController.clear();
                    // jobTimeTypeController.clear();
                    // jobTypeController.clear();
                    // salaryController.clear();
                    // locationController.clear();
                    // favoritesController.clear();


                  });
                  cubit.isBottomSheet = true ;
                  cubit.fabIcon = Icons.save_sharp;
                } // else
              },
              child:  Icon(
                cubit.fabIcon,
                color: Colors.white,
              ),
            ),
            bottomNavigationBar: BottomNavigationBar(
              currentIndex: cubit.currentIndex, // نقطة البداية
              backgroundColor: Colors.white,
              onTap: (index){ // 0
                //  cubit.currentIndex = index ;
                cubit.changeIndex(index);
              },
              elevation: 0,
              items: const [ // minim 2   BottomNavigationBarItem
                BottomNavigationBarItem(
                  icon: Icon(
                    Icons.file_copy,
                    color: AppTheme.blueButtonGP,
                  ),
                  label: 'All Jobs',
                ),
                BottomNavigationBarItem(
                  icon: Icon(
                    Icons.favorite,
                    color: AppTheme.blueButtonGP,
                  ),
                  label: 'Fav Jobs',
                ),

              ],
            ),
          );
        },
      ),
    );
  }
} // class