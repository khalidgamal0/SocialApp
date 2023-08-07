import 'package:flutter/material.dart';

import '../../../../../../core/utils/assets_data.dart';

class ItemComment extends StatelessWidget {
  const ItemComment({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(15.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const CircleAvatar(
            radius: 30,
            backgroundImage:NetworkImage(AssetsData.profileImage),
          ),
          const SizedBox(width:8),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.only(top: 5.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      color: Colors.grey[300],
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text('Khalid',style:TextStyle(height: 1.4,fontWeight: FontWeight.bold) ,),
                          const SizedBox(height:5,),
                          Text('how are you',style: Theme.of(context).textTheme.bodySmall!.copyWith(height: 1.4,color: Colors.black
                          ),maxLines:6,overflow: TextOverflow.ellipsis,)
                        ],),
                    ),
                  ),
                  const SizedBox(height: 10,),
                  Row(children: [
                    InkWell(child: const Text('20 m'),onTap: (){},),
                    const SizedBox(width: 10,),
                    InkWell(child: const Text('like'),onTap: (){},),
                    const SizedBox(width: 10,),
                    InkWell(child: const Text('reply'),onTap: (){},),

                  ],)
                ],
              ),
            ),
          ),
        ],),
    );
  }
}
