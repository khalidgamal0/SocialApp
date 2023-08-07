import 'package:flutter/material.dart';
import '../../../../../../core/widgets/navigation.dart';
import '../../../../../posts/presentation/views/post_screen.dart';

class HomeSec1 extends StatelessWidget {
  const HomeSec1({
    super.key, required this.profileImage,
  });

  final String profileImage;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(5.0),
          child: Row(
            children: [
               CircleAvatar(
                radius: 25,
                backgroundImage: NetworkImage(profileImage),
              ),
              const SizedBox(
                width: 10,
              ),
              Expanded(
                  child: SizedBox(
                    height: 40,
                    child: TextFormField(
                      keyboardType: TextInputType.none,
                      showCursor: false,
                      onTap: () {
                        navigateTo(context, const PostScreen());
                      },
                      decoration: InputDecoration(
                          hoverColor: Colors.grey,
                          hintText: 'what do you think ?',
                          hintStyle: TextStyle(
                              color: Colors.black.withOpacity(.7), fontSize: 14),
                          enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(35),
                              borderSide:
                              BorderSide(color: Colors.grey.withOpacity(.5))),
                          focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(35),
                              borderSide:
                              BorderSide(color: Colors.grey.withOpacity(.5)))),
                    ),
                  )),
              const SizedBox(
                width: 10,
              ),
              InkWell(
                  onTap: () {
                    navigateTo(context, const PostScreen());
                  },
                  child: const Icon(
                    Icons.image,
                    color: Colors.green,
                    size: 30,
                  ))
            ],
          ),
        ),
        const SizedBox(
          height: 0,
        ),
        Container(
          height: 8,
          width: double.infinity,
          color: Colors.grey.withOpacity(.5),
        ),
      ],
    );
  }
}
