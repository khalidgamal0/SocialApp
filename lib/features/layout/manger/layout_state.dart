part of 'layout_cubit.dart';

@immutable
abstract class LayoutState {}

class LayoutInitial extends LayoutState {}

class GetUserDataLoading extends LayoutState {}
class GetUserDataSuccess extends LayoutState {}
class GetUserDataError extends LayoutState {
  final String error;
  GetUserDataError(this.error);
}

class GetPostLoading extends LayoutState {}
class GetPostSuccess extends LayoutState {}
class GetPostError extends LayoutState {}


class UserUpdateLoading extends LayoutState {}
class UserUpdateSuccess extends LayoutState {}
class UserUpdateError extends LayoutState {
  final String error;
  UserUpdateError(this.error);
}


class ProfilePickedSuccess extends LayoutState {}
class ProfilePickedError extends LayoutState {}

class CoverPickedSuccess extends LayoutState {}
class CoverPickedError extends LayoutState {}

class ProfileImageUpdateLoading extends LayoutState {}
class ProfileImageUpdateError extends LayoutState {}

class CoverImageUpdateLoading extends LayoutState {}
class CoverImageUpdateError extends LayoutState {}