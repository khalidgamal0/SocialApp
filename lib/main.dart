import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:social_app/core/utils/shared_preferences.dart';
import 'package:social_app/features/auth/features/view/login_screen.dart';
import 'package:social_app/features/layout/views/LayoutScreen.dart';
import 'core/utils/block_observer.dart';
import 'core/utils/constant.dart';
import 'core/utils/theme.dart';
import 'features/layout/manger/layout_cubit.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  Bloc.observer = MyBlocObserver();
  await SharedPreference.init();
  uid = SharedPreference.getData(key: 'uid');
  runApp(const SocialApp());
}

class SocialApp extends StatelessWidget {
  const SocialApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => LayoutCubit()..getUserData()..getPosts(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: lightThem,
        home: Directionality(
            textDirection: TextDirection.ltr,
            child: uid == null ? const LoginScreen() : const LayoutScreen()),
      ),
    );
  }
}
