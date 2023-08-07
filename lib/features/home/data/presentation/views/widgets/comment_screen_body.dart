import 'package:flutter/material.dart';
import 'package:social_app/core/widgets/the_end.dart';

import 'item_comment.dart';

class CommentScreenBody extends StatelessWidget {
  const CommentScreenBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var commentController=TextEditingController();
    return  Scaffold(
      appBar: AppBar(),
      body: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: ListView.separated(
                  itemBuilder: (context, index) => const ItemComment(),
                  separatorBuilder: (context, index) =>const SizedBox(height: 10,),
                  itemCount: 15),
            ),
             Column(
          children: [
            const TheEnd(),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: Row(
                children: [
                  Expanded(
                    child: TextFormField(
                      controller:commentController ,
                      decoration: const InputDecoration(
                        border: InputBorder.none,
                        hintText: 'write your comment...',
                      ),
                      onFieldSubmitted: (value){
                        commentController.text=value;
                        commentController.clear();
                      },
                    ),
                  ),
                  IconButton(onPressed:(){}, icon:const Icon(Icons.send))
                ],
              ),
            ),
          ],
        )

      ]),
    );
  }
}

