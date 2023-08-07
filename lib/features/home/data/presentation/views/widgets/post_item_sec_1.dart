import 'package:flutter/material.dart';

import '../../../../../../core/utils/assets_data.dart';
import '../../../../../../core/utils/constant.dart';

class PostItemSec1 extends StatelessWidget {
  const PostItemSec1({
    super.key, required this.profileImage, required this.name,
  });
  final String profileImage;
  final String name;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Row(
        children: [
           CircleAvatar(
            radius: 30,
            backgroundImage: NetworkImage(profileImage),
          ),
          const SizedBox(width: 15),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                      Text(
                      name,
                      style: const  TextStyle(height: 1.4),
                    ),
                    const SizedBox(
                      width: 5,
                    ),
                    Icon(
                      Icons.check_circle,
                      size: 16,
                      color: kPrimaryColor,
                    ),
                  ],
                ),
                Text(
                  '02:55 am',
                  style: Theme.of(context)
                      .textTheme
                      .bodySmall!
                      .copyWith(height: 1.4),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
