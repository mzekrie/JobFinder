import 'package:flutter/material.dart';
import 'package:gp_amit60_mary_zekrie/router/router.dart';
import 'package:gp_amit60_mary_zekrie/view/pages/notification_screen.dart';

import '../view/pages/change_password_screen.dart';
import '../view/pages/help_center.dart';
import '../view/pages/job_details_screen.dart';
import '../view/pages/jobs_all_screen.dart';
import '../view/pages/jobs_applied_screen.dart';
import '../view/pages/jobs_apply_to_screen.dart';
import '../view/pages/jobs_fav_screen.dart';
import '../view/pages/jobs_filtered_result_screen.dart';
import '../view/pages/jobs_land_screen.dart';
import '../view/pages/message_chat_screen.dart';
import '../view/pages/message_no_data.dart';
import '../view/pages/message_screen.dart';
import '../view/pages/notification_no_data_screen.dart';
import '../view/pages/onboarding_Screen.dart';
import '../view/pages/forget_password_screen_1.dart';
import '../view/pages/forget_password_screen_2.dart';
import '../view/pages/forget_password_screen_3.dart';
import '../view/pages/forget_password_screen_4.dart';
import '../view/pages/home_screen.dart';
import '../view/pages/login.dart';
import '../view/pages/otp_first_screen.dart';
import '../view/pages/otp_second_screen.dart';
import '../view/pages/portfolio_screen.dart';
import '../view/pages/privacy_policy_screen.dart';
import '../view/pages/profile_change_email.dart';
import '../view/pages/profile_change_name.dart';
import '../view/pages/profile_change_phone.dart';
import '../view/pages/profile_complete_screen.dart';
import '../view/pages/profile_edit_Screen.dart';
import '../view/pages/profile_education.dart';
import '../view/pages/profile_experience_screen.dart';
import '../view/pages/profile_screen.dart';
import '../view/pages/register2_work_type_screen.dart';
import '../view/pages/register3_country_screen.dart';
import '../view/pages/register4_sucess_Screen.dart';
import '../view/pages/register_screen.dart';
import '../view/pages/setting_lang_screen.dart';
import '../view/pages/settings_notification_screen.dart';
import '../view/pages/settings_security_screen.dart';
import '../view/pages/splash_screen.dart';
import '../view/pages/term_condition_screen.dart';
import '../view/pages/otp_third_screen.dart';

Route? onGenerateRouter(RouteSettings settings){
  switch(settings.name){
    case AppRoute.splashScreen :
      return MaterialPageRoute(builder: (_)=> const SplashScreen() );
    case AppRoute.onBoardingScreen :
      return MaterialPageRoute(builder: (_)=>  const OnBoardingScreen() );
    case AppRoute.loginScreen :
      return MaterialPageRoute(builder: (_)=>  const LoginScreen() );
    case AppRoute.registerScreen :
      return MaterialPageRoute(builder: (_)=>  const RegisterScreen() );
    case AppRoute.homeScreen :
      return MaterialPageRoute(builder: (_)=> HomeScreen() );
    case AppRoute.forgetPasswordScreen_1 :
      return MaterialPageRoute(builder: (_)=> const ForgetPasswordScreen_1() );
    case AppRoute.forgetPasswordScreen_2 :
      return MaterialPageRoute(builder: (_)=> const ForgetPasswordScreen_2() );
    case AppRoute.forgetPasswordScreen_3 :
      return MaterialPageRoute(builder: (_)=> const ForgetPasswordScreen_3() );
    case AppRoute.forgetPasswordScreen_4 :
      return MaterialPageRoute(builder: (_)=> const ForgetPasswordScreen_4() );

    case AppRoute.registerWorkTypeScreen :
      return MaterialPageRoute(builder: (_)=> const RegisterWorkTypeScreen());
    case AppRoute.registerWorkLocationScreen :
      return MaterialPageRoute(builder: (_)=> const RegisterWorkLocationScreen());
    case AppRoute.registerSucessScreen :
      return MaterialPageRoute(builder: (_)=> const RegisterSucessScreen());

/// jobs
      case AppRoute.allJobsScreen :
      return MaterialPageRoute(builder: (_)=>  const AllJobsScreen());
    case AppRoute.jobsScreen :
      return MaterialPageRoute(builder: (_)=> const JobsScreen());
    case AppRoute.jobsDetailsScreen :
      return MaterialPageRoute(builder: (_)=> const JobsDetailsScreen());
    case AppRoute.savedJobsScreen :
      return MaterialPageRoute(builder: (_)=>  SavedJobsScreen());

    case AppRoute.filteredJobsScreen :
      return MaterialPageRoute(builder: (_)=> const FilteredJobsScreen());


    case AppRoute.appliedJobsScreen :
      return MaterialPageRoute(builder: (_)=> const AppliedJobsScreen());

    case AppRoute.applyToJobScreen :
      return MaterialPageRoute(builder: (_)=> const ApplyToJobScreen());


      /// chat messages
    case AppRoute.messageScreen :
      return MaterialPageRoute(builder: (_)=> const MessageScreen());
    case AppRoute.messageChatScreen :
      return MaterialPageRoute(builder: (_)=> const MessageChatScreen());
    case AppRoute.messageNoDataScreen :
      return MaterialPageRoute(builder: (_)=> const MessageNoDataScreen());


/// profile
    case AppRoute.profileScreen :
      return MaterialPageRoute(builder: (_)=> ProfileScreen());
    case AppRoute.completeProfileScreen :
      return MaterialPageRoute(builder: (_)=> const CompleteProfileScreen());

    case AppRoute.profileEducationScreen :
      return MaterialPageRoute(builder: (_)=> const ProfileEducationScreen());

    case AppRoute.profileExperienceScreen :
      return MaterialPageRoute(builder: (_)=> const ProfileExperienceScreen());

      case AppRoute.profileEditScreen :
      return MaterialPageRoute(builder: (_)=> const ProfileEditScreen());
    case AppRoute.portfolioScreen :
      return MaterialPageRoute(builder: (_)=>  PortfolioScreen());
    case AppRoute.settingsLanguageScreen :
      return MaterialPageRoute(builder: (_)=> const SettingsLanguageScreen());
    case AppRoute.settingsNotificationScreen :
      return MaterialPageRoute(builder: (_)=> const SettingsNotificationScreen());
    case AppRoute.settingsSecurityScreen :
      return MaterialPageRoute(builder: (_)=> const SettingsSecurityScreen());
    case AppRoute.privacyPolicyScreen :
      return MaterialPageRoute(builder: (_)=> const PrivacyPolicyScreen());
     case AppRoute.termsConditionsScreen :
       return MaterialPageRoute(builder: (_)=> const TermsConditionsScreen());
    case AppRoute.helpCenterScreen  :
      return MaterialPageRoute(builder: (_)=> const HelpCenterScreen());
    case AppRoute.thirdOTPScreen  :
      return MaterialPageRoute(builder: (_)=> const ThirdOTPScreen());
     case AppRoute.firstOTPScreen :
     return MaterialPageRoute(builder: (_)=> const FirstOTPScreen());
  case AppRoute.secondOTPScreen :
   return MaterialPageRoute(builder: (_)=> const SecondOTPScreen());
  case AppRoute.changePasswordScreen :
     return MaterialPageRoute(builder: (_)=> const ChangePasswordScreen());
  case AppRoute.changePhoneScreen :
  return MaterialPageRoute(builder: (_)=> const ChangePhoneScreen());
   case AppRoute.changeEmailScreen :
    return MaterialPageRoute(builder: (_)=> ChangeEmailScreen());
    case AppRoute.changeNameScreen :
      return MaterialPageRoute(builder: (_)=> ChangeNameScreen());


      /// Notification
    case AppRoute.notificationScreen :
      return MaterialPageRoute(builder: (_)=> NotificationScreen());

    case AppRoute.notificationNoDataScreen :
      return MaterialPageRoute(builder: (_)=> const NotificationNoDataScreen());






      default :
      return null ;
  }

}


