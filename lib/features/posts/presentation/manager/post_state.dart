part of 'post_cubit.dart';


abstract class PostState {}

class PostInitial extends PostState {}
class CreatePostLoading extends PostState {}
class CreatePostSuccess extends PostState {}
class CreatePostError extends PostState {
  final String error;
  CreatePostError(this.error);
}

class UploadPostImageLoading extends PostState {}
class UploadPostImageSuccess extends PostState {}
class UploadPostImageError extends PostState {}

class GetPostImageSuccess extends PostState {}
class GetPostImageError extends PostState {}

class RemovePostImage extends PostState {}



