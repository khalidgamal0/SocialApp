import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../data/model/auth_model.dart';

part 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  AuthCubit() : super(AuthInitial());

  static AuthCubit get(context) {
    return BlocProvider.of(context);
  }

  bool obscureText = true;
  IconData suffixIcon = Icons.visibility;

  void changePassVisibility() {
    obscureText = !obscureText;
    obscureText
        ? suffixIcon = Icons.visibility
        : suffixIcon = Icons.visibility_off;
    emit(ShowPassVisibility());
  }

// Start Register

  void userRegister({
    String? email,
    String? password,
    String? phone,
    String? name,
  }) {
    emit(RegisterLoading());
    FirebaseAuth.instance
        .createUserWithEmailAndPassword(email: email!, password: password!)
        .then((value) {
      createUser(
          email: email,
          password: password,
          phone: phone,
          name: name,
          uid: value.user?.uid);
    }).catchError((error) {
      emit(RegisterError(error.toString()));
    });
  }

  void createUser({
    String? email,
    String? password,
    String? uid,
    String? phone,
    String? name,
  }) {
    UserModel model = UserModel(
      name: name,
      email: email,
      password: password,
      phone: phone,
      uid: uid,
      bio: 'write your things',
      photo:
      'https://media.wired.com/photos/598e35fb99d76447c4eb1f28/16:9/w_2123,h_1194,c_limit/phonepicutres-TA.jpg',
      photoCover:
      'https://st2.depositphotos.com/2550635/9440/i/450/depositphotos_94407988-stock-photo-silhouette-of-person-in-sportswear.jpg',
    );
    FirebaseFirestore.instance
        .collection('users')
        .doc(uid)
        .set(model.toMap())
        .then((value) {
      emit(RegisterSuccess(uid!));
    }).catchError((error) {
      emit(RegisterError(error.toString()));
    });
  }

// END Register

// Start Login

  void userLogin({
    String? email,
    String? password,
  }) {
    emit(LoginLoading());
    FirebaseAuth.instance.signInWithEmailAndPassword(
        email: email!, password: password!).then((value){
          emit(LoginSuccess(value.user!.uid));
    }).catchError((error){
      emit(LoginError(error.toString()));
    });
  }

// END Login
}
