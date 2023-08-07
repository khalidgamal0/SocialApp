import 'package:flutter/material.dart';


Widget defaultMaterialButton({
  double width = 80,
  double height = 50,
  double radius = 15,
  Color background = Colors.blue,
  bool isUppercase = false,
  String text = 'login',
  @required Function()? function,
}) =>
    Container(
      width: width,
      decoration: BoxDecoration(
        color: background,
        borderRadius: BorderRadius.circular(radius),
      ),
      child: MaterialButton(
        height: height,
        onPressed: function,
        child: Text(
          isUppercase ? text.toUpperCase() : text,
          style: const TextStyle(
            fontSize: 16,
            color: Colors.white,
          ),
          maxLines: 1,
        ),
      ),
    );

Widget defaultTextButton({
  @required VoidCallback? function,
  @required String? text,
}) =>
    TextButton(onPressed: function, child: Text(text!.toUpperCase()));

defaultTextFormField({
  @required TextEditingController? controller,
  String? labelText,
  String? hintText,
  TextStyle? textStyle,
  IconData? suffixIcon,
  IconData? prefixIcon,
  @required TextInputType? type,
  bool obscureText = false,
  VoidCallback? onTap,
  Function()? suffixPressed,
  Function(String)? onChanged,
  Function(String)? onSubmitted,
  FormFieldValidator? validate,
}) =>
    TextFormField(
      controller: controller,
      cursorColor: Colors.blue,
      style: textStyle,
      decoration: InputDecoration(
        focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8),
            borderSide:const BorderSide(color: Colors.blue)
        ),
        enabledBorder:OutlineInputBorder(
            borderRadius: BorderRadius.circular(8),
            borderSide: BorderSide(color: Colors.grey.withOpacity(.3))

        ) ,
        prefixIcon: Icon(prefixIcon),
        labelText: labelText,
        hintText:hintText,
        suffixIcon: suffixIcon != null
            ? IconButton(onPressed: suffixPressed, icon: Icon(suffixIcon))
            : null,
        border: const OutlineInputBorder(),
        // prefixIcon: Icon(prefixIcon)
      ),
      obscureText: obscureText,
      keyboardType: type,
      onTap: onTap,
      onFieldSubmitted: onSubmitted,
      onChanged: onChanged,
      validator: validate,
    );