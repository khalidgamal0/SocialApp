import 'package:flutter/material.dart';
import 'package:social_app/core/utils/constant.dart';

import '../../../../../../core/utils/assets_data.dart';
import '../../../../../../core/widgets/the_end.dart';

class LikeScreenBody extends StatelessWidget {
  const LikeScreenBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        title: const Text('who interactive',style: TextStyle(fontWeight:FontWeight.w500,fontSize: 20 ),),
      ),
      body:  Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: Row(
            children: [
              Text('All :',style: TextStyle(color: kPrimaryColor),),
              Text('50k',style: TextStyle(color: kPrimaryColor),),
            ],
          ),
        ),
            const  TheEnd(),
            Expanded(
              child: ListView.builder
                (itemBuilder: (context, index) =>const LikeItem(),
                  itemCount: 20),
            ),

          ]),
    );
  }
}

class LikeItem extends StatelessWidget {
  const LikeItem({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Padding(
          padding: EdgeInsets.symmetric(horizontal: 15.0,vertical: 5), child: Row(
    children: [
      SizedBox(
        height: 60,
        child: Stack(
          alignment: Alignment.bottomLeft,
          children: [
            Align(
              alignment: Alignment.topCenter,
              child: CircleAvatar(
                    radius: 25,
                    backgroundImage:NetworkImage(AssetsData.profileImage),
                  ),
            ),
            Icon(Icons.favorite,color: Colors.red,)
          ],
        ),
           ),
      SizedBox(width: 15,),
       Text('Khalid',style:TextStyle(height: 1.4,fontWeight: FontWeight.bold) ,),

    ],
          ),
        );
  }
}
