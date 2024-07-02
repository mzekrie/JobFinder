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
      var response =
      await DioHelper.postData(
          url: endpoint_login,
          data: {"email": email,
            "password": password});

      // await CacheHelper.putString(key: SharedKeys.name,value: userModel.name.toString(),);
      // nameUserConst =  await CacheHelper.getString(key: SharedKeys.name);
      // await CacheHelper.putString(key: SharedKeys.userID,value:userModel.id.toString(),);
      // idUserConst  =  await CacheHelper.getString(key: SharedKeys.userID);

      if (response.statusCode == 200) {
        userModel.token = response.data['token'];
        // userModel.id = response.data['id'];// Set NULL
        // userModel.name = response.data['name']; // set NULL
        await CacheHelper.putString(
          key: SharedKeys.token, value: userModel.token.toString(),);
        token_mary = CacheHelper.getString(key: SharedKeys.token);

        await CacheHelper.putString(
          key: SharedKeys.name, value: userModel.name.toString(),);

        String nameUserConst = CacheHelper.getString(key: SharedKeys.name);

        print("login successfully, response of login data ");
        print(" string TOKEN is  $token_mary post data success");
        print (" string NAME  is  $nameUserConst post data success");
        // print (" string USER ID is  ${idUserConst} post data success");
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
          data: {//"name": name,
            "password": password});

      // userModel.name = name;
      // userModel.password = password;

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
          data: {"name": "name",});


      if (response.statusCode == 200) {
        print("Updated name or password with message ${response.statusMessage}");
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

  /// to get the id , name,  and email  only
  getUser() async {
    emit(LoadingNameEmailState());

    await DioHelper.getData(url: endpoint_get_profile, token: token_mary).then((
        value) {
      // converting data from json and map it to the model and then add it to a list
      userModel = UserModel.fromJson(value.data);
      print(value);
      String name  = userModel.name!;
      print ('name of user is $name');
      emit(GetNameEmailSuccessState());
      return name;
    }).catchError((error) {
      // catching any error coming from API
      print(error);
      emit(GetNameEmailerrorState());
    });
  }

}
