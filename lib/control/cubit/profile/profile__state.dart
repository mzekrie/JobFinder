part of 'profile__cubit.dart';

sealed class ProfileState {}

final class ProfileInitial extends ProfileState {}

/// profile data
class LoadingProfileDataState extends ProfileState{}
class ErrorLoadingProfileDataState extends ProfileState{}
class SuccessLoadingProfileDataState extends ProfileState{}

/// Edit profile data
class EditingProfileDataState extends ProfileState{}
class ErrorEditingProfileDataState extends ProfileState{}
class SuccessEditingProfileDataState extends ProfileState{}

/// load portfolio data
class LoadingPortfolioDataState extends ProfileState{}
class ErrorLoadingPortfolioDataState extends ProfileState{}
class SuccessLoadingPortfolioDataState extends ProfileState{}

/// Add portfolio data
class AddingPortfolioDataState extends ProfileState{}
class ErrorAddingPortfolioDataState extends ProfileState{}
class SuccessAddingPortfolioDataState extends ProfileState{}

class UploadPhotoState extends ProfileState{}
class CapturePhotoState extends ProfileState{}





