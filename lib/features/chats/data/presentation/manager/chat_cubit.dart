import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';

import '../../../../auth/data/model/auth_model.dart';

part 'chat_state.dart';

class ChatCubit extends Cubit<ChatState> {
  ChatCubit() : super(ChatInitial());
  static ChatCubit get(context) => BlocProvider.of(context);

  List<UserModel> allUsers = [];

  void getAllUsers(userUid) {
    if (allUsers.isEmpty) {
      FirebaseFirestore.instance.collection('users').get().then((value) {
        for (var element in value.docs) {
          if (element.id != userUid) {
            allUsers.add(UserModel.fromJson(element.data()));
          }
        }
        emit(GetAllUserSuccess());
      }).catchError((error) {
        emit(GetAllUserError(error.toString()));
      });
    }
  }
}
