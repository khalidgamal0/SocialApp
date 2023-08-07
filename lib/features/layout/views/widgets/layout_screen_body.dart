import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:social_app/features/layout/manger/app/app_cubit.dart';

class LayoutScreenBody extends StatelessWidget {
  const LayoutScreenBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AppCubit(),
      child: BlocBuilder<AppCubit, AppState>(
        builder: (context, state) {
          var cubit=AppCubit.get(context);
          return Scaffold(
            body: SafeArea(child: cubit.bottomNavBar[cubit.currentIndex]),
            bottomNavigationBar: BottomNavigationBar(
              currentIndex: cubit.currentIndex,
              onTap: (index) {
                cubit.changeBottomNav(index);
              },
              items: const [
                BottomNavigationBarItem(icon: Icon(Icons.home), label: 'home'),
                BottomNavigationBarItem(icon: Icon(Icons.chat), label: 'Chats'),
                BottomNavigationBarItem(
                    icon: Icon(Icons.add_circle_outline_outlined),
                    label: 'add post'),
                BottomNavigationBarItem(
                    icon: Icon(Icons.settings), label: 'settings'),
              ],
            ),);
        },
      ),
    );
  }
}
