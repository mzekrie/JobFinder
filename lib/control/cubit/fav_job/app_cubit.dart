import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sqflite/sqflite.dart';
import '../../../view/pages/jobs_all_2_screen.dart';
import '../../../view/pages/jobs_fav_2_screen.dart';

part 'app_state.dart';

class AppCubit extends Cubit<AppState> {
  AppCubit() : super(AppInitial());
  static AppCubit get(context) => BlocProvider.of(context); // ده الحيخلي الفروع للكيوبت تعرفك الحالة الحالية
  int currentIndex  = 0 ; // starting point
  bool isBottomSheet = false ;
  IconData fabIcon = Icons.add ;
  late Database database ;
   List<Map> allJobs = [] ;
   List<Map> favJobs = [] ;

  List<Widget> screens = [
    JobsAll2Screen(), // 0
    JobsFav2Screen(), // 1
      ];
  List<String> titles = [
    'All Jobs', // 0
    'Fav Jobs', // 1
      ];


  void changeIndex(int index){
    currentIndex = index ;
    emit(AppChangeBottomNavBarState());
  }


  // int? id;
  // String? name;
  // String? image;
  // String? jobTimeType;
  // String? jobType;
  // String? jobLevel;
  // String? jobDescription;
  // String? jobSkill;
  // String? compName;
  // String? compEmail;
  // String? compWebsite;
  // String? aboutComp;
  // String? location;
  // String? salary;
  // int? favorites;
  // int? expired;
//

  void createDatabase () {
    openDatabase(
      "jobs.db" , // path
      version: 1 ,
      onCreate: (database , version){ // run one time only
        print('database Created');
        database.execute("CREATE TABLE jobTable(id INTEGER PRIMARY KEY , title TEXT , companyName TEXT , jobTimeType TEXT ,jobType TEXT ,  salary TEXT, location Text ,favorites TEXT)").then( // for creating table
                (value){
              print('table created');
            }
        ).catchError(
                (error){
              print('Error when creating table ${error.toString()}');
            }
        );
      }, // on create
      onOpen: (database){ // if database found it open it
        getDataFromDatabase(database);
        print('database opened');
      },
    ).then((value){
      database = value ;
      emit(AppCreateDatabaseState()); // calling
    });
  } // close

  void insertToDatabase({
    required String title ,
    required String companyName ,
    required String jobTimeType ,
    required String jobType ,
    required String salary,
    required String location ,
    required String favorites,
  }) async {
    await database.transaction( // edit
            (txn){
          return txn.rawInsert("INSERT INTO jobTable(title, companyName, jobTimeType,jobType,  salary, location,favorites)VALUES('$title', '$companyName', '$jobTimeType','$jobType','$salary','$location','$favorites') ")// for adding data
              .then( (value){
            print("$value inserted Successfully");
            emit(AppInsertDatabaseState());
            getDataFromDatabase(database);
          }).catchError(
                  (onError){
                print("Error when Inserting New Record ${onError.toString()}");
              }
          );
        }
    ); // transaction
  } // insert

  void getDataFromDatabase(database) {


    allJobs = [] ;
    favJobs = [] ; // to clear the list upon exiting and loading

    emit(AppCreateDatabaseLoadingState());
    database.rawQuery('SELECT * FROM jobTable').then((value) {
      value.forEach( (element){ // تروح علي كل عنصر
        if(element['favorites'] == '1'){
          favJobs.add(element); // saving fav screen
        }
        else if  (element['favorites'] == '0'){
          allJobs.add(element); // saving all job screen
        }
      });
      emit(AppGetDatabaseState());
    }); // SQL => Get data from database
  }

  void UpdateData({
    required favorites , // new or archive , done
    required int id , // pk will never be duplicated
  }) async{
    database.rawUpdate(
      'UPDATE jobTable SET favorites = ? WHERE id = ? ', ['$favorites',id],
    ).then((value){
      getDataFromDatabase(database); // عشان يجبلك البيانات بعد التحديث
      emit(AppUpdateDatabaseState());
    });
  } // update

  void DeleteData({
    required int id ,
  }) async{
    database.rawDelete(
        'DELETE FROM favorites WHERE id = ?', [id] // sql => ? بتحجز مكان
    ).then((value){
      getDataFromDatabase(database); // عشان يجبلك البيانات بعد التحديث
      emit(AppDeleteDatabaseState());
    });
  }
}
