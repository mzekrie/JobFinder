import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gp_amit60_mary_zekrie/control/cubit/applied_job/applied_job_cubit.dart';
import 'package:gp_amit60_mary_zekrie/control/cubit/job/all_jobs_cubit.dart';
import 'package:gp_amit60_mary_zekrie/control/cubit/profile/profile__cubit.dart';
import 'package:gp_amit60_mary_zekrie/control/cubit/register/register_cubit.dart';
import 'package:gp_amit60_mary_zekrie/model/shared/cache_helper.dart';
import 'package:gp_amit60_mary_zekrie/model/shared/colors_theme.dart';
import 'package:gp_amit60_mary_zekrie/router/route.dart';
import 'package:gp_amit60_mary_zekrie/router/router.dart';
import 'control/cubit/auth/login_cubit.dart';
import 'control/cubit/fav_job/app_cubit.dart';
import 'control/cubit/fav_job/fav_jobs_cubit.dart';
import 'control/cubit/observer.dart';
import 'model/shared/dio_helper.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  Bloc.observer = MyBlocObserver();
  CacheHelper.init();
  DioHelper.inti();
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  // This widget is the root of your application.

  @override
  void initState()
  {
    super.initState();
  }

    @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => LoginCubit()),
        BlocProvider(create: (context) => AppliedJobCubit()..getAppliedJobs(),),
        BlocProvider(create: (context) => AllJobsCubit()..getDataAll(),),
        BlocProvider(create: (context) => FavJobsCubit()..getFavJobs(),),
        BlocProvider(create: (context) => RegisterCubit()),
        BlocProvider(create: (context) => ProfileCubit()..getProfileDataAll() ..getPortfolioDataAll(),),
        BlocProvider(create: (context) => AppCubit()..createDatabase()),

      ],

        child: MaterialApp(
        title: 'Job Finder App',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: AppTheme.whiteGP),
          useMaterial3: true,
        ),
        onGenerateRoute: onGenerateRouter,
        //initialRoute: AppRoute.jobsFavLayout,
          initialRoute: AppRoute.splashScreen,


      ),
    );
  }
}
