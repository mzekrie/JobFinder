part of 'login_cubit.dart';

sealed class LoginState {}

final class LoginInitial extends LoginState {}
//class InitLoginAppState extends LoginState {}

class LoginByEmailAndPasswordState extends LoginState {}
class LoginSuccessState extends LoginState{}
class LoginErrorState extends LoginState{}

class UpdateNamePasswordDataState extends LoginState{}
class UpdateNamePasswordSuccessState extends LoginState{}
class UpdateNamePasswordErrorState extends LoginState{}

class LoadingNameEmailState extends LoginState{}
class GetNameEmailSuccessState extends LoginState{}
class GetNameEmailerrorState extends LoginState{}