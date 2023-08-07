import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import '../model/auth_model.dart';
import 'home_repo.dart';

class ImplRepo extends HomeRepo {
  @override
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
    FirebaseFirestore.instance.collection('users').doc(uid).set(model.toMap());
  }

  @override
  void userLogin({
    String? email,
    String? password,
  }) {
    FirebaseAuth.instance
        .signInWithEmailAndPassword(email: email!, password: password!);
  }

  @override
  void userRegister({
    String? email,
    String? password,
    String? phone,
    String? name,
  }) {
    FirebaseAuth.instance
        .createUserWithEmailAndPassword(email: email!, password: password!).then((value){
      createUser(
          email: email,
          password: password,
          phone: phone,
          name: name,
          uid: value.user?.uid);
    });
  }
}
