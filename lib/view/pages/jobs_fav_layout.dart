import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import '../../control/cubit/fav_job/app_cubit.dart';
import '../../model/shared/colors_theme.dart';
import '../widget/default_form_field.dart';

class JobsFavLayout extends StatelessWidget {
  var titleJobController = TextEditingController() ;
  var compNameController = TextEditingController();
  var jobTimeTypeController = TextEditingController() ;
  var jobTypeController = TextEditingController();
  var salaryController = TextEditingController();
  var locationController = TextEditingController();
  var favoritesController = TextEditingController();



  GlobalKey<ScaffoldState> scaffoldKey = GlobalKey(); // for making screen detects snack bar
  GlobalKey<FormState> formKey = GlobalKey();
  @override
  Widget build(BuildContext context) {

     var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
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
            key: scaffoldKey,
            appBar: AppBar(
              backgroundColor: Colors.indigoAccent,
              title: Text(
                cubit.titles[cubit.currentIndex],
                style: const TextStyle(
                  color: Colors.white,
                ),
              ),
            ),
            body: ConditionalBuilder(
              condition: state is! AppCreateDatabaseLoadingState , // طول ما هو مش بيحمل
              builder: (context) => cubit.screens[cubit.currentIndex], // في حالة تحقق  الشرط
              fallback: (context) => const Center(child: CircularProgressIndicator()) , // في حالة عدم تحقق الشرط
            ) ,
            floatingActionButton: FloatingActionButton(
              backgroundColor: Colors.indigoAccent,
              onPressed: () {
                if(cubit.isBottomSheet){ // true
                  if(formKey.currentState!.validate()){// nested if
                    AppCubit.get(context).insertToDatabase
                      (title: titleJobController.text,
                        companyName: compNameController.text,
                        jobTimeType: jobTimeTypeController.text,
                        jobType: jobTypeController.text,
                        salary: salaryController.text,
                        location: locationController.text,
                        favorites: favoritesController.text);
                  }
                }
                else{ // false
                  scaffoldKey.currentState!.showBottomSheet(
                        (context) => Container(
                      color: Colors.grey[100],
                      child: Padding(
                        padding: const EdgeInsets.all(20),
                        child: Form(
                          key: formKey,
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
                  ).closed.then((value){
                    cubit.isBottomSheet = false ;
                    cubit.fabIcon = Icons.edit;
                  });
                  cubit.isBottomSheet = true ;
                  cubit.fabIcon = Icons.add;
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