part of 'notification__cubit.dart';

@immutable
sealed class NotificationState {}

final class NotificationInitial extends NotificationState {}

// all jobs
class LoadingNotificationState extends NotificationState{}
class SuccessGetNotificationState extends NotificationState{}
class ErrorGetNotificationState extends NotificationState{}
