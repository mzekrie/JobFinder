import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../model/jobs_all_model.dart';
import '../../../model/shared/constant_attribute.dart';
import '../../../model/shared/dio_helper.dart';



part 'all_jobs_state.dart';

// // 1- loading
// // 2- return data success
// // 3- return data error

class AllJobsCubit extends Cubit<AllJobsState> {
  AllJobsCubit() : super(AllJobsInitial());
    /// 1) create blocprovider
  static AllJobsCubit get(context) => BlocProvider.of(context);
  /// 2) create object from model to call its data
  AllJobsModel allJobsModel = AllJobsModel();
  AllJobsModel filteredJobsModel = AllJobsModel();
  AllJobsModel suggestedJobsModel = AllJobsModel();

/// 3) create empty list of the same class model datatype to save the data on it
  late List<JobData> jobsList= [];
  List<JobData>? suggestedJobsList;
  List<JobData>? filteredJobsList;

  /// 4) call get data fn from dio
  ///! get the data from API and put it on  all job list
  getDataAll()async{
    emit(LoadingAllJobsDataState());
    await DioHelper.getData(url: endpoint_allJobs,token: token_mary).then((value) {
      // converting data from json and map it to the model and then add it to a list
      allJobsModel = AllJobsModel.fromJson(value.data);
      jobsList = allJobsModel.data!;
      print(value);
      emit(SuccessAllJobsDataState());
    }).catchError((error) {
      // catching any error coming from API
      print(error);
      emit(ErrorAllJobsDataState());
    });
  }
  ///! get the suggested job list
  getSuggestedJobs()async{
    emit(LoadingSuggestedJobsDataState());
    await DioHelper.getData(url: endpoint_suggestedJobs,token: token_mary, query: {
    }).then((value) {
      // converting data from json and map it to the model and then add it to a list
      suggestedJobsModel = AllJobsModel.fromJson(value.data);
      suggestedJobsList = suggestedJobsModel.data! ;
      print(value);
      emit(SuccessSuggestedJobsDataState());
    }).catchError((error) {
      // catching any error coming from API
      print(error);
      emit(ErrorSuggestedJobsDataState());
    });
  }
  ///! post data to filter api to return result
  filterJobs( {String? name, String? location, String? salary})async{
    emit(LoadingFilteredJobsDataState());
    await DioHelper.postData(
        url: endpoint_filterJobs,
        token: token_mary,
        query: {},
        data: {
          "name": name,
          "location": location,
          "salary": salary
        }).then((value) {
      // converting data from json and map it to the model and then add it to a list
      filteredJobsModel = AllJobsModel.fromJson(value.data);
      filteredJobsList = filteredJobsModel.data!;
      print(value);
      emit(SuccessFilteredJobsDataState());
    }).catchError((error) {
      // catching any error coming from API
      print(error);
      emit(ErrorFilteredJobsDataState());
    });
  }



int currentIndex = 0;
  void changeButtonNavbar (int index){
    currentIndex = index;
    emit(ChangeNavBarState());
  }

}



