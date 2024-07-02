part of 'all_jobs_cubit.dart';

sealed class AllJobsState {}

final class AllJobsInitial extends AllJobsState {}

class InitAppState extends AllJobsState {}


// all jobs
class LoadingAllJobsDataState extends AllJobsState{}
class SuccessAllJobsDataState extends AllJobsState{}
class ErrorAllJobsDataState extends AllJobsState{}

// all suggested jobs
class LoadingSuggestedJobsDataState extends AllJobsState{}
class SuccessSuggestedJobsDataState extends AllJobsState{}
class ErrorSuggestedJobsDataState extends AllJobsState{}

// all filtered jobs
class LoadingFilteredJobsDataState extends AllJobsState{}
class SuccessFilteredJobsDataState extends AllJobsState{}
class ErrorFilteredJobsDataState extends AllJobsState{}
// when changing the navigation bar
class ChangeNavBarState extends AllJobsState{}



