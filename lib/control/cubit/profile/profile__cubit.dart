import 'dart:io';
import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gp_amit60_mary_zekrie/model/shared/constant_attribute.dart';
import 'package:image_picker/image_picker.dart';
import '../../../model/shared/dio_helper.dart';
import '../../../model/user_profile_model.dart';
part 'profile__state.dart';

class ProfileCubit extends Cubit<ProfileState> {
  ProfileCubit() : super(ProfileInitial());
  /// 1) create blocprovider
  static ProfileCubit get(context) => BlocProvider.of(context);

  /// 2) create object from model to call its data
  UserProfileModel userProfileModel = UserProfileModel();
  UserProfileModel userPortfolioModel = UserProfileModel();

/// image picker attributes
 final ImagePicker picker = ImagePicker();
 late XFile? image;
 late XFile? userImage; // will hold the image
  /// 3) create empty list of the same class model datatype to save the data on it

  List<Profile>? profileList;
  List<Portofolio> portofolioList = [];
  /// 4) call get data fn from dio
  ///! get the data from API

 getProfileDataAll() async {
    emit(LoadingProfileDataState());
    var response = await DioHelper.getData(url: endpoint_get_portofolio,token: token_mary).then((value) {
      // converting data from json and map it to the model and then add it to a list
      userProfileModel = UserProfileModel.fromJson(value.data["profile"]);
      print(userProfileModel);
      profileList!.add(userProfileModel.data as Profile);
      print ("----profile list");
      print (profileList);
      //print(value);
      emit(SuccessLoadingProfileDataState());
    }).catchError((error) {
      // catching any error coming from API
      print(error);
      emit(ErrorLoadingProfileDataState());
    });
  }
  getPortfolioDataAll() async{

    try {
      emit(LoadingPortfolioDataState());
      var response = await DioHelper.getData(
          url: endpoint_get_portofolio, token: token_mary);
      // converting data from json and map it to the model and then add it to a list
      userPortfolioModel = UserProfileModel.fromJson(response.data["portofolio"]);
      portofolioList!.add(userPortfolioModel.data as Portofolio);
      print(response.data!["portofolio"]);
      emit(SuccessLoadingPortfolioDataState());
    }
    catch(error){
        print("error getting portfolio:  $error ");
        emit(ErrorLoadingPortfolioDataState());
      }
  }
  uploadImage(String camera)async{

    if(camera == "cam"){
      userImage = (await picker.pickImage(source: ImageSource.camera))! as XFile?;
      image = XFile(userImage!.path);

      // call API to set image
      await DioHelper.postData(url: endpoint_add_portofolio,token: token_mary, data: {
        "image": image,
      });
      emit(CapturePhotoState());
      return image;
      //return userImage?.readAsBytes();
    }
    else
    {
      userImage = (await picker.pickImage(source: ImageSource.gallery))! as XFile?;
      image = XFile(userImage!.path);

      // call API to set image
      await DioHelper.postData(url: endpoint_add_portofolio,token: token_mary, data: {
        "image": image,
      });
      emit(UploadPhotoState());
      return image;
      //return userImage?.readAsBytes();
    }
  }

/// add portfolio CV and image
  /// i have to path to it the uploaded file and name of the file


  addPortfolio ({required XFile? userCV, required XFile? userCVImage}) async{

   try{
     emit(AddingPortfolioDataState());

     var response = await DioHelper.postData(url: endpoint_add_portofolio,token: token_mary,
         data: {
           // "cv_file" : File(userCV!.path),
           // "image": File(userCVImage!.path),
           "cv_file" : XFile(userCV!.path),
           "image": XFile(userCVImage!.path),
         });

     if (response.statusCode == 200) {
       print(" Add Portfolio successfully, Status code is  ${response.statusMessage} ");
       emit(SuccessAddingPortfolioDataState());
       return ('Success');
     }
     else{
       print(" Error Add Portfolio, Status code is  ${response.statusMessage} ");
       return ('Error');
     }
           }
   catch(error){
     print(error.toString());
     emit(ErrorAddingPortfolioDataState());
     return ('Error');
   }

  }

  ///old add portfolio using pdf but didnot work
  uploadImageAndCVFile({File? pickedFile, String? fileName}) async {

    try{emit(AddingPortfolioDataState());
    if (pickedFile != null) {
      FormData formData = FormData.fromMap({
        'userFile': await MultipartFile.fromFile(
            pickedFile.path, filename: fileName),
      });
      Response response = await DioHelper.postData(
          url: endpoint_add_portofolio,
          token: token_mary,
          data: {
            "cvFile": formData,
            "image": formData,
          });


      if (response.statusCode == 200) {

        print(" portfolio added successfully with code ${response.statusCode} and message : ${response.statusMessage}");
        print("response data is ${response.data} ");
        emit(AddingPortfolioDataState());
      } else if (response.statusCode == 500) {
        print("General error: with code ${response.statusCode} and message : ${response.statusMessage}");
        emit(ErrorAddingPortfolioDataState());
      } else {
        print("error uploading profile CV with code ${response.statusCode} and message : ${response.statusMessage}");
        emit(ErrorAddingPortfolioDataState());
      }
    }}
    catch(error){
      print("error uploading profile CV with error $error ");
      emit(ErrorAddingPortfolioDataState());
    }

  }

  /// Edit Profile fn
  Future editProfile(
      {
      String? email,
      String? mobile,
      String? address,
      String? language,
      String? interestedWork,
      String? offlinePlace,
      String? remotePlace,
      String? bio,
      String? education,
      String? experience,
      String? personalDetailed,
      }) async {
    emit(EditingProfileDataState());
    try {
      Response response = await DioHelper.putData(
          url: endpoint_edit_profile,
          token: token_mary,
          query: { // parameters
            "email": email,
            "mobile":mobile,
            "address": address,
            "language": language,
            "interested_work": interestedWork,
            "offline_place": offlinePlace,
            "remote_place": remotePlace,
            "bio": bio,
            "education": education,
            "experience": experience,
            "personal_detailed": personalDetailed,
          },
          // data: {
          //   "email": email,
          //   "mobile":mobile,
          //   "address": address,
          //   "language": language,
          //   "interestedWork": interestedWork,
          //   "offlinePlace": offlinePlace,
          //   "remotePlace": remotePlace,
          //   "bio": bio,
          //   "education": education,
          //   "experience": experience,
          //   "personalDetailed": personalDetailed,
          // }
          );
// response of API

      if (response.statusCode == 200) {
        print(response.statusMessage);
        print("Edit profile successfully");
        emit(EditingProfileDataState());
      } else {
        print(response.statusMessage);
        print("Edit profile failed");
        emit(ErrorEditingProfileDataState());
      }
    } catch (error) {
      print(error.toString());
      emit(ErrorEditingProfileDataState());
    }
  }
}
 ///TODO delete PORTFOLIO

