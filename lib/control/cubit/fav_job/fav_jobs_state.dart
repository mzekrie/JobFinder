part of 'fav_jobs_cubit.dart';
sealed class FavJobsState {}

final class FavJobsInitial extends FavJobsState {}

// all jobs
class LoadingFavJobsState extends FavJobsState{}
class SuccessGetFavJobsState extends FavJobsState{}
class ErrorGetFavJobsState extends FavJobsState{}
