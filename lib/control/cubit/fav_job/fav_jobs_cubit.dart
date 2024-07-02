import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../model/fav_job_model.dart';
import '../../../model/shared/constant_attribute.dart';
import '../../../model/shared/dio_helper.dart';

part 'fav_jobs_state.dart';

class FavJobsCubit extends Cubit<FavJobsState> {
  FavJobsCubit() : super(FavJobsInitial());

  /// 1) create blocprovider
  static FavJobsCubit get(context) => BlocProvider.of(context);
  /// 2) create object from model to call its data
  FavouritJobModel favJobModel = FavouritJobModel();

  /// 3) create empty list of the same class model datatype to save the data on it
  List<Data>? favJobList;


  /// 4) call get data fn from dio
  ///! get the data from API and put it on  all job list
  Future getFavJobs()async{
    emit(LoadingFavJobsState());
    await DioHelper.getData(url: endpoint_show_fav_jobs,token: token_mary).then((value) {
      // converting data from json and map it to the model and then add it to a list
      favJobModel = FavouritJobModel.fromJson(value.data);
      favJobList = favJobModel.data!;
      print(value);
      emit(SuccessGetFavJobsState());
    }).catchError((error) {
      // catching any error coming from API
      print(error);
      emit(ErrorGetFavJobsState());
    });
  }


}
