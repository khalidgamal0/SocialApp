import 'package:flutter/material.dart';
import '../../../../../../core/widgets/navigation.dart';
import '../like_screen.dart';

class PostItemSec2 extends StatelessWidget {
  const PostItemSec2({
    super.key, required this.postText, required this.postImage,
  });

  final String postText;
  final String postImage;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
         Padding(
          padding: const EdgeInsets.all(10.0),
          child:  Text(
            postText,
            maxLines: 3,
            overflow: TextOverflow.ellipsis,
            style: const TextStyle(
                fontSize: 14, fontWeight: FontWeight.w400 ),
          ),
        ),
        if(postImage!='')
        Container(
          height: 400,
          width: double.infinity,
          alignment: Alignment.topLeft,
          decoration: BoxDecoration(
            image: DecorationImage(
                fit: BoxFit.cover,
                image: NetworkImage(postImage)),
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 10.0),
          child: Row(
            children: [
              Expanded(
                child: InkWell(
                  onTap: () {
                    navigateTo(context,const LikeScreen());
                  },
                  child: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 5),
                    child: Row(
                      children: [
                        const Icon(
                          Icons.favorite_border,
                          color: Colors.red,
                        ),
                        const SizedBox(
                          width: 7,
                        ),
                        Text(
                          '115',
                          style: Theme.of(context).textTheme.bodySmall,
                        )
                      ],
                    ),
                  ),
                ),
              ),
              Expanded(
                child: InkWell(
                  onTap: () {},
                  child: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 5),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        const Icon(
                          Icons.chat_bubble_outline,
                          color: Colors.amber,
                        ),
                        const  SizedBox(
                          width: 7,
                        ),
                        Text(
                          '190',
                          style: Theme.of(context).textTheme.bodySmall,
                        )
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
