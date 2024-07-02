part of 'applied_job_cubit.dart';

@immutable
sealed class AppliedJobState {}

final class AppliedJobInitial extends AppliedJobState {}

// apply to Job --> POST
class LoadingApplyFormState extends AppliedJobState{}
class SuccessApplyToJobState extends AppliedJobState{}
class ErrorApplyToJobState extends AppliedJobState{}


// load applied Jobs
class LoadingAppliedJobState extends AppliedJobState{}
class SuccessGetAppliedJobState extends AppliedJobState{}
class ErrorGetAppliedJobState extends AppliedJobState{}