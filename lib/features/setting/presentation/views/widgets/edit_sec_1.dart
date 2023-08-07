import 'package:flutter/material.dart';

import '../../../../layout/manger/layout_cubit.dart';

class EditSec1 extends StatelessWidget {
  const EditSec1({
    super.key,
    required this.cubit,
  });

  final LayoutCubit cubit;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 250,
      child: Stack(
        alignment: AlignmentDirectional.bottomCenter,
        children: [
          Align(
            alignment: AlignmentDirectional.topCenter,
            child: Stack(
              alignment: Alignment.topRight,
              children: [
                Container(
                  height: 200,
                  decoration: BoxDecoration(
                    borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(.5),
                      topRight: Radius.circular(.5),
                    ),
                    image: DecorationImage(
                        fit: BoxFit.cover,
                        image:
                        cubit.coverImage==null?NetworkImage(cubit.userModel!.photoCover!):
                        FileImage(cubit.coverImage!) as ImageProvider,),
                  ),
                ),
                IconButton(
                    onPressed: () {
                      cubit.getCoverImage();
                    },
                    icon: const CircleAvatar(
                        radius: 15,
                        child: Icon(
                          Icons.camera_alt_outlined,
                          size: 16,
                        ))),
              ],
            ),
          ),
          Stack(
            alignment: AlignmentDirectional.bottomEnd,
            children: [
              CircleAvatar(
                radius: 60,
                backgroundImage:cubit.profileImage==null?NetworkImage(cubit.userModel!.photo!):
                FileImage(cubit.profileImage!) as ImageProvider,
              ),
              IconButton(
                  onPressed: () {
                    cubit.getProfileImage();
                  },
                  icon: const CircleAvatar(
                      radius: 15,
                      child: Icon(
                        Icons.camera_alt_outlined,
                        size: 16,
                      ))),
            ],
          ),
        ],
      ),
    );
  }
}
