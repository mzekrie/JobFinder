part of 'app_cubit.dart';

@immutable
sealed class AppState {}

final class AppInitial extends AppState {}
class AppChangeBottomNavBarState extends AppState {}
class AppCreateDatabaseState extends AppState {}
class AppGetDatabaseState extends AppState {}
class AppCreateDatabaseLoadingState extends AppState {}
class AppInsertDatabaseState extends AppState {}
class AppChangeBottomSheetState extends AppState {}
class AppUpdateDatabaseState extends AppState {}
class AppDeleteDatabaseState extends AppState {}
