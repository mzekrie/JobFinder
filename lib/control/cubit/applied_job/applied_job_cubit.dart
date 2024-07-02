import 'dart:io';
import 'package:flutter/material.dart';
import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../model/jobs_applied_model.dart';
import '../../../model/shared/cache_helper.dart';
import '../../../model/shared/constant_attribute.dart';
import '../../../model/shared/dio_helper.dart';
import '../../../model/shared/enum.dart';

part 'applied_job_state.dart';

class AppliedJobCubit extends Cubit<AppliedJobState> {
  AppliedJobCubit() : super(AppliedJobInitial());
  /// 1) create blocprovider
  static AppliedJobCubit get(context) => BlocProvider.of(context);
  /// 2) create object from model to call its data
  AppliedJobModel appliedJobModel = AppliedJobModel();

  /// 3) create empty list of the same class model datatype to save the data on it
  List<Data>? appliedJobsList;

  /// 4) call get data fn from dio
  ///! get the data from API and put it on  all job list

  getAppliedJobs()async{

      emit(LoadingAppliedJobState());
      await DioHelper.getData(url: endpoint_appliedJobs,token: token_mary).then((value) {
        // converting data from json and map it to the model and then add it to a list
        appliedJobModel = AppliedJobModel.fromJson(value.data);
        appliedJobsList = appliedJobModel.data!;
        print(value);
        emit(SuccessGetAppliedJobState());
    }).catchError((error)
    {
      print(error);
      emit(ErrorGetAppliedJobState());
    });

  }


  Future applyToJob(String? name,
      String? email,
      String? mobile,
      String? workType,
      File? cvFile,
      String? cvFileName,
      File? otherFile,
      String? otherFileName,) async {
    emit(LoadingApplyFormState());

    try {
      String appliedJobID = CacheHelper.getString(
          key: SharedKeys.appliedJobID);
      //String _userID = await CacheHelper.getString(key: SharedKeys.userID)

      if (cvFile != null) {
        FormData formDataCV = FormData.fromMap({
          'cvFile': await MultipartFile.fromFile(
              cvFile.path, filename: cvFileName),
        });}


        if (otherFile != null) {
          FormData formDataFile = FormData.fromMap({
            'userFile': await MultipartFile.fromFile(
                otherFile.path, filename: otherFileName),
          });}

      Response response = await DioHelper.postData(
          url: endpoint_applyToJob,
          token: token_mary,
          query: {},
          data: {
            "jobs_id": appliedJobID,
            "user_id": userID_const, // const until we get it from sharedKeys
            "name": "name",
            "email": "email",
            "mobile": "mobile",
            "work_type": "work_type",
            "cv_file": "formDataCV",
            "other_file": "formDataFile"
          });
      if (response.statusCode == 200) {
        print(response.statusMessage);
        print("Applied to job successfully and message ${response
            .statusMessage}");
        emit(SuccessApplyToJobState());
      } else {
        print(response.statusMessage);
        print("Applied to job FAILED and message ${response.statusMessage}");
        emit(ErrorApplyToJobState());
      }
    }

    catch(error) {
      print(error.toString());
      emit(ErrorApplyToJobState());
    }
  }
}







