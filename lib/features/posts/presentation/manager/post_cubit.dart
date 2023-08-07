import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:social_app/features/layout/manger/layout_cubit.dart';
import '../../data/model/post_model.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path/path.dart';
part 'post_state.dart';

class PostCubit extends Cubit<PostState> {
  PostCubit(this.cubit) : super(PostInitial());

   final LayoutCubit cubit;
  static PostCubit get(context) => BlocProvider.of(context);
  var picker = ImagePicker();
  String? nameImage;
  File? postImage;

  Future<void> getPostImage() async {
    final pickedFile = await picker.pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      postImage = File(pickedFile.path);
      nameImage = basename(pickedFile.path);
      emit(GetPostImageSuccess());
    } else {
      print('no image selected');
      emit(GetPostImageError());
    }
  }

  void uploadPostImage({
    required String uid,
    required String profileImage,
    required String name,
    required String dataTime,
    String? text,
  }) {
    emit(UploadPostImageLoading());
    var ref = FirebaseStorage.instance.ref('posts/$nameImage');
    ref.putFile(postImage!).then((value) {
      value.ref.getDownloadURL().then((value) {
        createNewPost(
          uid: uid,
          dataTime:dataTime,
          name:name,
          profileImage:profileImage,
          text:text,
          postPhoto:value,);
      }).catchError((error) {
        emit(UploadPostImageError());
      });
    }).catchError((error) {
      emit(UploadPostImageError());
    });
  }

  void removePostImage() {
    postImage = null;
    emit(RemovePostImage());
  }

  void createNewPost({
    required String uid,
    required String profileImage,
    required String name,
    required String dataTime,
    String? text,
    String? postPhoto,
  }) {
    emit(CreatePostLoading());
    PostModel modelPost = PostModel(
      uid: uid,
      profileImage: profileImage,
      name: name,
      dataTime: dataTime,
      text: text ?? '',
      postPhoto: postPhoto ?? '',
    );
    FirebaseFirestore.instance
        .collection('posts')
        .add(modelPost.toMap())
        .then((value) {
          cubit.posts=[];
          cubit.getPosts();
      emit(CreatePostSuccess());
    }).catchError((error) {
      emit(CreatePostError(error.toString()));
    });
  }

}
