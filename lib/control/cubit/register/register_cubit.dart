import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gp_amit60_mary_zekrie/model/shared/constant_attribute.dart';
import 'package:meta/meta.dart';

import '../../../model/shared/dio_helper.dart';
import '../../../model/user_model.dart';

part 'register_state.dart';

class RegisterCubit extends Cubit<RegisterState> {
  RegisterCubit() : super(RegisterInitial());


  /// 1) create blocprovider
  static RegisterCubit get(context) => BlocProvider.of(context);
  UserModel registerModel = UserModel();

  ///! post email and password to the API login
  Future RegisterByEmailAndPassword({required String user_name,required String user_email,required String user_password })async{
    emit(RegisterByEmailAndPasswordState());
    try{
      var response  = await DioHelper.postData(
          url: endpoint_register,
          data: {
            "name": user_name,
            "email": user_email,
            "password": user_password});

      // userModel.name = user_name;
      // userModel.email = user_email;
      // userModel.password = user_password;
      // userModel.id = response.data!.id;
      // userModel.token = response.data!.token;

      if(response.statusCode == 200)
      {
        print (response.statusMessage);
        print ( "Register successfully");
        emit(RegisterSuccessState());
        return ('SucessRegister');
      }
      else if (response.statusCode ==401){
        print ( "Account exists before with message ${response.statusMessage}");
        emit(RegisterErrorState());
        return ('errorRegister');
      }
      else{
        print ("Register failed with message ${response.statusMessage}");
        emit(RegisterErrorState());
        return ('errorRegister');
      }
    }
    catch(error){
      print(error.toString());
      emit(RegisterErrorState());
      return ('errorRegister');
    }
  }



}
