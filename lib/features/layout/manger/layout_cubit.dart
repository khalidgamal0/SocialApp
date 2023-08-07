import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:social_app/features/auth/data/model/auth_model.dart';
import '../../../core/utils/constant.dart';
import '../../chats/data/presentation/views/chat_screen.dart';
import '../../home/data/presentation/views/home_screen.dart';
import '../../posts/data/model/post_model.dart';
import '../../posts/presentation/views/post_screen.dart';
import '../../setting/presentation/views/settings_screen.dart';
import 'package:path/path.dart';
part 'layout_state.dart';

class LayoutCubit extends Cubit<LayoutState> {
  LayoutCubit() : super(LayoutInitial());

  static LayoutCubit get(context) => BlocProvider.of(context);


  UserModel? userModel;

  void getUserData() {
    emit(GetUserDataLoading());
    FirebaseFirestore.instance.collection('users').doc(uid).get().then((value) {
      userModel = UserModel.fromJson(value.data()!);
      emit(GetUserDataSuccess());
    }).catchError((error) {
      emit(GetUserDataError(error.toString()));
    });
  }

  List<PostModel> posts = [];

  void getPosts() {
    emit(GetPostLoading());
    FirebaseFirestore.instance.collection('posts').get().then((value) {
      for (var element in value.docs) {
        posts.add(PostModel.fromJson(element.data()));
        emit(GetPostSuccess());
      }
      emit(GetPostSuccess());
    }).catchError((error) {
      emit(GetPostError());
    });
  }

  void updateUserData({
     String? name,
     String? phone,
     String? bio,
    String? cover,
    String? image,
  }) {
    emit(UserUpdateLoading());
    UserModel model = UserModel(
      name: name??userModel!.name,
      phone: phone??userModel!.phone,
      bio: bio??userModel!.bio,
      email: userModel!.email,
      password:userModel!.password ,
      uid:userModel!.uid ,
      photo: image ?? userModel!.photo,
      photoCover: cover ??userModel!.photoCover,
    );
    FirebaseFirestore.instance
        .collection('users')
        .doc(model.uid)
        .update(model.toMap())
        .then((value) {
     getUserData();
    }).catchError((error) {
      emit(UserUpdateError(error.toString()));
    });
  }

  var picker = ImagePicker();
  File? profileImage;
  File? coverImage;
  String? nameProfileImage;
  String? nameCoverImage;

  Future<void> getProfileImage() async {
    final pickedFile = await picker.pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      profileImage = (File(pickedFile.path));
      nameProfileImage = basename(pickedFile.path);
      emit(ProfilePickedSuccess());
    } else {
      emit(ProfilePickedError());
    }
  }
  Future<void> getCoverImage() async {
    final pickedFile = await picker.pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      coverImage = File(pickedFile.path);
      nameCoverImage = basename(pickedFile.path);
      emit(ProfilePickedSuccess());
    } else {
      emit(ProfilePickedError());
    }
  }

  void uploadProfileImage() {
    emit(ProfileImageUpdateLoading());
    FirebaseStorage.instance
        .ref()
        .child('users/$nameProfileImage')
        .putFile(profileImage!)
        .then((value) {
      value.ref.getDownloadURL().then((value) {
        updateUserData(image: value);
      }).catchError((error) {
        emit(ProfileImageUpdateError());
      });
    }).catchError((error) {
      emit(ProfileImageUpdateError());
    });
  }

  void uploadCoverImage() {
    emit(CoverImageUpdateLoading());
    FirebaseStorage.instance
        .ref('users/$nameCoverImage')
        .putFile(coverImage!)
        .then((value) {
      value.ref.getDownloadURL().then((value) {
        updateUserData(cover: value);
      }).catchError((error) {
        emit(CoverImageUpdateError());
      });
    }).catchError((error) {
      emit(CoverImageUpdateError());
    });
  }



}
