import 'package:flutter/material.dart';
import 'package:social_app/core/widgets/navigation.dart';

import '../../../../../../core/utils/assets_data.dart';
import '../comment_screen.dart';

class PostItemSec3 extends StatelessWidget {
  const PostItemSec3({
    super.key, required this.profileImage,
  });
  final String profileImage;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: InkWell(
            onTap: () {
              navigateTo(context,const CommentScreen());
            },
            child: Row(
              children: [
                 CircleAvatar(
                  radius: 20,
                  backgroundImage: NetworkImage(profileImage),
                ),
                const SizedBox(width: 15),
                Text(
                  'Write a comment ...',
                  style: Theme.of(context)
                      .textTheme
                      .bodySmall!
                      .copyWith(height: 1.4),
                )
              ],
            ),

          ),
        ),
        InkWell(
          onTap: () {},
          child: Padding(
            padding: const EdgeInsets.all(8.0),
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
                  'like',
                  style: Theme.of(context).textTheme.bodySmall,
                )
              ],
            ),
          ),

        ),
      ],
    );
  }
}
