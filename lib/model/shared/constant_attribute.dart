import 'package:country_code_picker/country_code_picker.dart';
import 'package:flutter/material.dart';

// Chat List
List chat = ["Hi Rafif!, I'm Melan the selection team from Twitter. Thank you for applying for a job at our company. We have announced that you are eligible for the interview stage", "Hi Melan, thank you for considering me, this is good news for me." ];
TextEditingController text = TextEditingController();

var scaffoldKey = GlobalKey<ScaffoldState>(); // used at home
var phoneController = TextEditingController();
CountryCode myCountry = CountryCode(name: "EG", dialCode: "+20");
///job filter
TextEditingController jobTitleController = TextEditingController();
TextEditingController jobLocationController = TextEditingController();
TextEditingController confirmPasswordController = TextEditingController();
var formKey = GlobalKey<FormState>(); // login
var formKeyRegister = GlobalKey<FormState>(); // register
var formKeyJob = GlobalKey<FormState>(); //job
var formKeyOTP = GlobalKey<FormState>(); //two step verification 3rd page
var formKeyPassword = GlobalKey<FormState>(); // change password
var formKeyEmail = GlobalKey<FormState>(); // change email
var formKeyPhone = GlobalKey<FormState>(); // change Phone
var formKeyProfile = GlobalKey<FormState>();
var formKeyEducation = GlobalKey<FormState>();
var formKeyExperience = GlobalKey<FormState>();
var formKeyPortfolio = GlobalKey<FormState>();
var formKeyApplyJob1 = GlobalKey<FormState>();
var formKeyApplyJob2 = GlobalKey<FormState>();
/// list to store data from local database to it
List<Map> allJobs = [] ;
List<Map> favJobs = [] ;

bool showAppliedMessage = false;
bool showAcceptedMessage = false;

/// user Auth
//TextEditingController emailController = TextEditingController(text: CacheHelper.getString(key: SharedKeys.email));
//TextEditingController passwordController = TextEditingController(text: CacheHelper.getString(key: SharedKeys.password));
TextEditingController emailController = TextEditingController();
TextEditingController passwordController = TextEditingController();
TextEditingController nameController = TextEditingController();
//// change education /////////
TextEditingController universityController = TextEditingController();
TextEditingController titleController = TextEditingController();
TextEditingController startYearController = TextEditingController();
TextEditingController endYearController = TextEditingController();
//// change experience /////////
TextEditingController positionController = TextEditingController();
TextEditingController typeWorkController = TextEditingController();
TextEditingController companyNameController = TextEditingController();
TextEditingController locationController = TextEditingController();
TextEditingController startYearExperienceController = TextEditingController();
TextEditingController endYearExperienceController = TextEditingController();
//// change password //////////
TextEditingController currentPasswordController = TextEditingController();
TextEditingController newPasswordController = TextEditingController();
TextEditingController confirmedPasswordController = TextEditingController();
//// change phone //////////
TextEditingController newPhoneController = TextEditingController();
//// change email //////////
TextEditingController newEmailController = TextEditingController();

//// Edit Profile //////////
TextEditingController interstedWorkController = TextEditingController();
TextEditingController bioController = TextEditingController();
TextEditingController addressController = TextEditingController();
TextEditingController handPhoneController = TextEditingController();
/////////OTP //////////////////
TextEditingController otp1Controller = TextEditingController();
TextEditingController otp2Controller = TextEditingController();
TextEditingController otp3Controller = TextEditingController();
TextEditingController otp4Controller = TextEditingController();
TextEditingController otp5Controller = TextEditingController();
TextEditingController otp6Controller = TextEditingController();


////////////// token /////////////////
var token_mary = "11436|nrfeMpeoKQQzx5uLHC2cMSwm5e9MsazPpSiGnWpF"; // koko1
//var token_mary ="11401|pENJ0cHlzInPRJsUw0ZmR97a2LaqEWujgy3ZfwfE";
//var token_mary ="not updated";
//var token_ali = "2689|uERlFfnpNd7kwK9x2IvpN6Cf9HDU7QK6weBjeY8i";

///////////user profile ////////////
late String userID_const ='1857';
late String userName_const = "name of user";
late String userEmail_const ="someemail@hm.com";


///// Dio API URL//////////
const String baseUrl ="https://project2.amit-learning.com/api";


////////// Jobs API URL//////////
const String endpoint_allJobs= "/jobs";
const String endpoint_filterJobs= "/jobs/filter";
const String endpoint_suggestedJobs= "/jobs/sugest/2";
const String endpoint_applyToJob= "/apply";
const String endpoint_appliedJobs= "/apply/2";

////////// AUTH API URL//////////
const String endpoint_register= "/auth/register";
const String endpoint_login= "/auth/login";
const String endpoint_update_name_password= "/auth/user/update";
const String endpoint_get_profile= "/auth/profile";

////////// profile API URL//////////
const String  endpoint_get_portofolio ="/user/profile/portofolios";
const String  endpoint_add_portofolio ="/user/profile/portofolios";
const String  endpoint_delete_portofolio ="/user/profile/portofolios/2";
const String  endpoint_edit_profile ="/user/profile/edit";


////////// Favourite Job API URL//////////

const String  endpoint_show_fav_jobs ="/favorites";

///////// Notification API///////////////


const String endpoint_show_notification ="/notification/1";