import 'package:flutter/material.dart';

import 'num_of_my.dart';

class SettingSec2 extends StatelessWidget {
  const SettingSec2({
    super.key, required this.name, required this.bio,
  });

  final String name;
  final String bio;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
         Text(name,style:const TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.w600,
            color: Colors.black
        ),),
        const SizedBox(height:10),
        Text(bio,style: Theme.of(context).textTheme.bodySmall,),
        const SizedBox(height:25),
        const Row(children: [
          Expanded(child: NumOfMy(text1:'100',text2:'post',)),
          Expanded(child: NumOfMy(text1:'25',text2:'photo',)),
          Expanded(child: NumOfMy(text1:'126',text2:'followers',)),
          Expanded(child: NumOfMy(text1:'10k',text2:'following',)),
        ],),
      ],
    );
  }
}
