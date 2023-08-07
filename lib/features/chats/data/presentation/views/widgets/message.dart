import 'package:flutter/material.dart';

class Message extends StatelessWidget {
  const Message({super.key, required this.isMe});
final bool isMe;
  @override
  Widget build(BuildContext context) {
    return
      Align(
      alignment:isMe? AlignmentDirectional.centerStart:AlignmentDirectional.centerEnd,
      child: Container(
          padding:const EdgeInsets.symmetric(horizontal:10,vertical: 10),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.only(
                topLeft: const Radius.circular(10),
                topRight: const Radius.circular(10),
                bottomRight: Radius.circular(isMe?10:0),
                bottomLeft: Radius.circular(isMe?0:10),
              ),
              color: Colors.grey[300]
          ),
          child:const Text('ffffffff')),
    );
  }
}

