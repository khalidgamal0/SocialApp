import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';

import '../../../chats/data/presentation/views/chat_screen.dart';
import '../../../home/data/presentation/views/home_screen.dart';
import '../../../posts/presentation/views/post_screen.dart';
import '../../../setting/presentation/views/settings_screen.dart';

part 'app_state.dart';

class AppCubit extends Cubit<AppState> {
  AppCubit() : super(AppInitial());
  static AppCubit get(context) => BlocProvider.of(context);

  List<Widget> bottomNavBar = const [
    HomeScreen(),
    ChatsScreen(),
    PostScreen(),
    SettingsScreen(),
  ];

  int currentIndex = 0;

  void changeBottomNav(index) {
    currentIndex = index;
    emit(ChangeBottomNavStates());
  }
}
