part of 'register_cubit.dart';

@immutable
sealed class RegisterState {}

final class RegisterInitial extends RegisterState {}

class InitRegisterAppState extends RegisterState {}

// register
class RegisterByEmailAndPasswordState extends RegisterState {}
class RegisterSuccessState extends RegisterState {}
class RegisterErrorState extends RegisterState {}
class RegisterLoadingState extends RegisterState {}

