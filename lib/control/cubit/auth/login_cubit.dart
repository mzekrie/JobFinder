import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gp_amit60_mary_zekrie/model/shared/cache_helper.dart';
import '../../../model/shared/enum.dart';
import '../../../model/user_model.dart';
import '../../../model/shared/constant_attribute.dart';
import '../../../model/shared/dio_helper.dart';

part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit() : super(LoginInitial());

  /// 1) create blocprovider
  static LoginCubit get(context) => BlocProvider.of(context);
  UserModel userModel = UserModel();
  List? userList;
  ///! post email and password to the API login
  loginByEmailAndPassword({ String? email, String? password }) async {
    emit(LoginByEmailAndPasswordState());
    try {
      var response = await DioHelper.postData(
          url: endpoint_login,
          data: {"email": email,
            "password": password});

      if (response.statusCode == 200) {
        userModel.token = response.data['token'];
        await CacheHelper.putString(
          key: SharedKeys.token, value: userModel.token.toString(),);
        token_mary = CacheHelper.getString(key: SharedKeys.token);

        print("login successfully, response of login data ");
        print(" string TOKEN is  $token_mary post data success");
        print(" Status code is  ${response.statusMessage} ");
        emit(LoginSuccessState());
        return ('SucessLogin200');
      }
      else if (response.statusCode == 401) {
        print("Incorrect username or password");
        print(response.statusMessage);
        emit(LoginErrorState());
        return ('errorLogin');
      }
      else {
        print("login failed");
        print(response.statusMessage);
        emit(LoginErrorState());
        return ('errorLogin');
      }
    }
    catch (error) {
      print(error.toString());
      emit(LoginErrorState());
      return ('errorLogin');
    }
  }

  updatePassword({String? name, String? password }) async {
    emit(UpdateNamePasswordDataState());
    try {
      token_mary = CacheHelper.getString(key: SharedKeys.token);
      print ("this is token $token_mary");
      print (" this is the password $password");
      var response = await DioHelper.postData(token: token_mary,
          url: endpoint_update_name_password,
          data: {"password": password});

      if (response.statusCode == 200) {
        print("Updated name or password with message ${response.statusMessage}");
        emit(UpdateNamePasswordSuccessState());
        return ('SucessUpdate200');
      }
      else if (response.statusCode == 401) {
        print("Incorrect username or password with message ${response.statusMessage}");
        emit(UpdateNamePasswordErrorState());
        return ('error');
      }
      else {
        print("Incorrect username or password with message ${response.statusMessage}");
        emit(UpdateNamePasswordErrorState());
        return ('error');
      }
    }
    catch (error) {
      print(error.toString());
      emit(UpdateNamePasswordErrorState());
      return ('error');
    }
  }
  updateName({String? name}) async {
    emit(UpdateNamePasswordDataState());
    try {
      token_mary = CacheHelper.getString(key: SharedKeys.token);
      print ("this is token $token_mary");
      print (" this is the name $name");
      var response = await DioHelper.postData(token: token_mary,
          url: endpoint_update_name_password,
          data: {"name": name,});


      if (response.statusCode == 200) {
        print("Updated name with message ${response.statusMessage}");
        emit(UpdateNamePasswordSuccessState());
        return ('SucessUpdate200');
      }
      else if (response.statusCode == 401) {
        print("Incorrect name with message ${response.statusMessage}");
        emit(UpdateNamePasswordErrorState());
        return ('error');
      }
      else {
        print("Incorrect name with message ${response.statusMessage}");
        emit(UpdateNamePasswordErrorState());
        return ('error');
      }
    }
    catch (error) {
      print(error.toString());
      emit(UpdateNamePasswordErrorState());
      return ('error');
    }
  }
  /// to get the id , name,  and email  only and set it to the cache
  getUser() async {
    emit(LoadingGetUserInfoState());

    try{
      var response = await DioHelper.getData(url: endpoint_get_profile, token: token_mary);
      if (response.statusCode == 200) {
        //userModel = UserModel.fromJson(response.data);

        // userModel.name = response.data['name'];// Set NULL
        // userModel.id = response.data['id'];// Set NULL
        // userModel.email = response.data['email']; // set NULL
        await CacheHelper.putString(key: SharedKeys.name,value: userModel.name.toString(),);
        await CacheHelper.putString(key: SharedKeys.userID,value:userModel.id.toString(),);
        await CacheHelper.putString(key: SharedKeys.email,value:userModel.email.toString(),);
        //await CacheHelper.putInt(key: SharedKeys.userID,value:userModel.id!);
        //userID_const =CacheHelper.getInt(key: SharedKeys.userID);
        userID_const = CacheHelper.getString(key: SharedKeys.userID);
        userName_const =  CacheHelper.getString(key: SharedKeys.name);
        userEmail_const = CacheHelper.getString(key: SharedKeys.email);

        print ('Sucess Getting User profile 200');
        print ('userName_const of user is $userName_const');
        print ('userID_const of user is $userID_const');
        print ('userEmail_const of user is $userEmail_const');
        emit(SucessGetUserInfoState());
        return ('Sucess');
      }
      else{
        print("Failed Getting User profile ");
        print(response.statusMessage);
        emit(ErrorGetUserInfoState());
        return ('error');
      }
    }
    catch(error){
      print(error);
      emit(ErrorGetUserInfoState());
      return ('error');
    }
  }

}
