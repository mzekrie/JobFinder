import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';
import 'package:sqflite/sqflite.dart';

part 'app_state.dart';

class AppCubit extends Cubit<AppState> {
  AppCubit() : super(AppInitial());
  static AppCubit get(context) => BlocProvider.of(context); // ده الحيخلي الفروع للكيوبت تعرفك الحالة الحالية
  int currentIndex  = 0 ; // starting point
  bool isBottomSheet = false ;
  IconData fabIcon = Icons.edit ;
  late Database database ;
  List<Map> tasks = [] ;
  List<Map> doneTasks = [] ;
  List<Map> archiveTasks = [] ;
  List<Widget> screens = [
    // NewTasksScreen(), // 0
    // DoneTasksScreen(), // 1
    // ArchivedScreen(),  // 2
  ];
  List<String> titles = [
    'New Tasks', // 0
    'Done Tasks', // 1
    'Archived Tasks', // 2
  ];

  void changeIndex(int index){
    currentIndex = index ;
    emit(AppChangeBottomNavBarState()); // أستدعاء الستيت
  }

  void createDatabase () {
    openDatabase(
      "todo.db" , // path
      version: 1 ,
      onCreate: (database , version){ // run one time only
        print('database Created');
        database.execute("CREATE TABLE tasks(id INTEGER PRIMARY KEY , title TEXT , date TEXT , time TEXT , status TEXT)").then( // for creating table
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

  Future insertToDatabase({
    required String title ,
    required String time ,
    required String date ,
  }) async {
    await database.transaction( // edit
            (txn){
          return txn.rawInsert("INSERT INTO tasks (title,date,time,status) VALUES('$title','$date','$time','new') ")// for adding data
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
    tasks = [] ; // to clear any data
    doneTasks = [] ;
    archiveTasks = [] ;
    emit(AppCreateDatabaseLoadingState());
    database.rawQuery('SELECT * FROM tasks').then((value) {
      value.forEach( (element){ // تروح علي كل عنصر
        if(element['status'] == 'new'){
          tasks.add(element); // saving task screen
        }
        else if (element['status'] == 'done'){
          doneTasks.add(element); // saving done screen
        }
        else{
          archiveTasks.add(element);
        }
      });
      emit(AppGetDatabaseState());
    }); // SQL => Get data from database
  }

  void ChangeBottomSheetState({
    required bool isShow ,
    required IconData icon ,
  }){
    isBottomSheet = isShow ;
    fabIcon =  icon ;
    emit(AppChangeBottomSheetState());
  }

  void UpdateData({
    required status , // new or archive , done
    required int id , // pk will never be duplicated
  }) async{
    database.rawUpdate(
      'UPDATE tasks SET status = ? WHERE id = ? ', ['$status',id],
    ).then((value){
      getDataFromDatabase(database); // عشان يجبلك البيانات بعد التحديث
      emit(AppUpdateDatabaseState());
    });
  } // update

  void DeleteData({
    required int id ,
  }) async{
    database.rawDelete(
        'DELETE FROM tasks WHERE id = ?', [id] // sql => ? بتحجز مكان
    ).then((value){
      getDataFromDatabase(database); // عشان يجبلك البيانات بعد التحديث
      emit(AppDeleteDatabaseState());
    });
  }
}
