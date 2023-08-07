import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:social_app/core/widgets/navigation.dart';
import 'package:social_app/features/chats/data/presentation/manager/chat_cubit.dart';
import 'package:social_app/features/layout/manger/layout_cubit.dart';

import '../../../../../auth/data/model/auth_model.dart';
import '../../../../../layout/views/LayoutScreen.dart';
import '../chat_details_screen.dart';

class ChatsScreenBody extends StatelessWidget {
  const ChatsScreenBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var userData=LayoutCubit.get(context);
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(onPressed: (){navigateAndFinish(context,const LayoutScreen());},
          icon:const Icon(Icons.keyboard_arrow_left_outlined,size: 35,color: Colors.black,),
        ),
        title:const Text('Chats'),
      ),
        body: BlocProvider(
  create: (context) => ChatCubit()..getAllUsers(userData.userModel!.uid!),
  child: BlocBuilder<ChatCubit, ChatState>(
  builder: (context, state) {
    var cubit=ChatCubit.get(context);
    return ConditionalBuilder(
      condition:cubit.allUsers.isNotEmpty ,
      builder: (BuildContext context) {
        return ListView.builder(
            itemBuilder: (context, index) =>buildItem(context,cubit.allUsers[index]),
            itemCount: cubit.allUsers.length);
      },
      fallback: (context) =>const Center(child: CircularProgressIndicator()),
    );
  },
),
));
  }
  Widget buildItem(context,UserModel userData)=>InkWell(
    onTap: () {
      navigateTo(context, const ChatDetailsScreen());
    },
    child:  Padding(
      padding: const EdgeInsets.all(20),
      child: Row(
        children: [
          CircleAvatar(
            radius: 30,
            backgroundImage: NetworkImage(userData.photo!),
          ),
          const SizedBox(width: 15),
          Text(
            userData.name!,
            style: const TextStyle(height: 1.4),
          ),
        ],
      ),
    ),
  );
}
