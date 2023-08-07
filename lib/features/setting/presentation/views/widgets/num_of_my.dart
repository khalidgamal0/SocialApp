import 'package:flutter/material.dart';

class NumOfMy extends StatelessWidget {
  const NumOfMy({
    super.key, required this.text1, required this.text2,
  });
  final String text1;
  final String text2;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (){},
      child:  Column(children: [
        Text(text1),
        const SizedBox(height:10),
        Text(text2,style:const TextStyle(color: Colors.grey),),
      ],),
    );
  }
}
