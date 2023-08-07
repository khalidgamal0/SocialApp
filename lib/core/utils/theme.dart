import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'constant.dart';

ThemeData lightThem= ThemeData(
  bottomNavigationBarTheme: BottomNavigationBarThemeData(
      type: BottomNavigationBarType.fixed,
      selectedItemColor: kPrimaryColor,
      unselectedItemColor: Colors.grey.withOpacity(.8),
      elevation: 20
  ),
  appBarTheme:const AppBarTheme(
      titleSpacing: 20,
      backgroundColor: Colors.white,
      titleTextStyle: TextStyle(
          color: Colors.black,
          fontSize: 20,
          fontWeight:FontWeight.bold
      ),
      iconTheme: IconThemeData(
          color: Colors.black
      ),
      elevation: 0,
// backwardsCompatibility: false,
      systemOverlayStyle:(SystemUiOverlayStyle(
        statusBarColor: Colors.white,
        statusBarIconBrightness:Brightness.dark,
      ))
  ),
) ;
