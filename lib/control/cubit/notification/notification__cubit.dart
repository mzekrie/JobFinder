import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';

import '../../../model/notification_model.dart';
import '../../../model/shared/constant_attribute.dart';
import '../../../model/shared/dio_helper.dart';

part 'notification__state.dart';

class NotificationCubit extends Cubit<NotificationState> {
  NotificationCubit() : super(NotificationInitial());

  /// 1) create blocprovider
  static NotificationCubit get(context) => BlocProvider.of(context);
  /// 2) create object from model to call its data
  NotificationModel notificationModel = NotificationModel();

  /// 3) create empty list of the same class model datatype to save the data on it
  List<Data>? notificationList;


  /// 4) call get data fn from dio
  ///! get the data from API and put it on  all job list
  getChatNotificationDataAll(){
    emit(LoadingNotificationState());
    DioHelper.getData(url: endpoint_show_notification,token: token_mary).then((value) {
      // converting data from json and map it to the model and then add it to a list
      notificationModel = NotificationModel.fromJson(value.data);
      notificationList = notificationModel.data! as List<Data>?;
      print(value);
      emit(SuccessGetNotificationState());
    }).catchError((error) {
      // catching any error coming from API
      print(error);
      emit(ErrorGetNotificationState());
    });
  }
}
