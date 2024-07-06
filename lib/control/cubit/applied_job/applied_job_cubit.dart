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
  late List<Data> appliedJobsList = [];

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


  applyToJob({required String? name,
    required String? email,
    required String? mobile,
    required String? workType,
    required File? cvFile,
    required String? cvFileName,
    required File? otherFile,
    required String? otherFileName}) async {
    emit(LoadingApplyFormState());

    try {
      String appliedJobID = CacheHelper.getString(
          key: SharedKeys.appliedJobID);

      if (cvFile != null) {
        FormData formDataCV = FormData.fromMap({
          'cvFile': await MultipartFile.fromFile(
              cvFile.path, filename: cvFileName),
        });}


        if (otherFile != null) {
          FormData formDataFile = FormData.fromMap({
            'otherFile': await MultipartFile.fromFile(
                otherFile.path, filename: otherFileName),
          });}

      var response = await DioHelper.postData(
          url: endpoint_applyToJob,
          token: token_mary,
          query: {},
          data: {
            "jobs_id": appliedJobID,
            "user_id": userID_const, // sharedKeys return null setting is null
            "name": name,
            "email": email,
            "mobile": mobile,
            "work_type": workType,
            "cv_file": "formDataCV",
            "other_file": "formDataFile" /// need to assign it
          });
      if (response.statusCode == 200) {
        print(response.statusMessage);
        print("Applied to job successfully and message ${response
            .statusMessage}");
        emit(SuccessApplyToJobState());
        return ('Sucess');
      } else {
        print(response.statusMessage);
        print("Applied to job FAILED and message ${response.statusMessage}");
        emit(ErrorApplyToJobState());
        return ('Error');
      }
    }

    catch(error) {
      print(error.toString());
      emit(ErrorApplyToJobState());
      return ('Error');
    }
  }
}







