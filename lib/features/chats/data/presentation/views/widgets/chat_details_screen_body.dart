import 'package:flutter/material.dart';
import 'package:social_app/core/utils/assets_data.dart';
import 'package:social_app/core/utils/constant.dart';
import 'package:social_app/core/widgets/the_end.dart';

import 'message.dart';

class ChatDetailsScreenBody extends StatelessWidget {
  const ChatDetailsScreenBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(children: [
          Padding(
            padding: const EdgeInsets.all(15.0),
            child: Row(
              children: [
                InkWell(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: const Icon(Icons.arrow_back),
                ),
                const SizedBox(width: 15,),
                const CircleAvatar(
                  radius: 20,
                  backgroundImage: NetworkImage(AssetsData.profileImage),
                ),
                const SizedBox(width: 15),
                const Text(
                  'Khalid gamal',
                  style: TextStyle(fontWeight: FontWeight.w700, height: 1.4),
                ),
              ],
            ),
          ),
          const TheEnd(),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: ListView.separated(
                  itemBuilder: (context, index) =>const Message(isMe: false),
                  separatorBuilder: (context, index) => const SizedBox(height: 15,),
                  itemCount: 30),
            ),
          ),
          Row(
            children: [
              const SizedBox(width: 10,),
              Expanded(
                child: SizedBox(
                  height: 40,
                  child: TextFormField(
                    decoration: InputDecoration(
                      contentPadding:const EdgeInsets.only(top: 5,left: 10),
                      hintText: 'write your message',
                      enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(30),
                          borderSide: const BorderSide(color: Colors.grey)

                      ),
                      focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(30),
                          borderSide: const BorderSide(color: Colors.grey)

                      ),
                    ),
                  ),
                ),
              ),
              IconButton(onPressed:(){}, icon: Icon(Icons.send,color:kPrimaryColor,))
            ],
          ),
          const SizedBox(height: 10,)
        ]),
      ),
    );
  }
}
