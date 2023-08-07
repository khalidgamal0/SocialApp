import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:social_app/core/utils/constant.dart';
import 'package:social_app/core/widgets/toast.dart';
import 'package:social_app/features/layout/manger/layout_cubit.dart';
import 'package:social_app/features/posts/presentation/manager/post_cubit.dart';
import '../../../../../../core/widgets/navigation.dart';
import '../../../../layout/views/LayoutScreen.dart';

class PostScreenBody extends StatelessWidget {
  const PostScreenBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var textController = TextEditingController();
    return BlocProvider(
      create: (context) => PostCubit(LayoutCubit.get(context)),
      child: BlocConsumer<PostCubit,PostState>(
  listener: (context, state) {
    if(state is CreatePostSuccess){
      showToast(message: 'Success Operation', state: ToastStates.success);
    }
    else if(state is CreatePostError){
      showToast(message: 'some error happen please try again ', state: ToastStates.error);
    }
  },
  builder: (context, state) {
    var cubit = PostCubit.get(context);
    var userData = LayoutCubit.get(context);
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            navigateAndFinish(context, const LayoutScreen());
          }, icon: const Icon(
          Icons.arrow_back,
          color: Colors.black,
        ),
        ),
        title: const Text(
          'Create Post',
        ),
        actions: [
          TextButton(
              onPressed: () {
                var timeNow = DateTime.now();
                if (cubit.postImage == null) {
                  if( textController.text.isNotEmpty) {
                    cubit.createNewPost(
                      uid: userData.userModel!.uid!,
                      profileImage: userData.userModel!.photo!,
                      name: userData.userModel!.name!,
                      dataTime: timeNow.toString(),
                      text: textController.text,
                    );
                  }
                  else{
                    showToast(message: 'write a text or select an image', state: ToastStates.warning);
                  }
                }
                else {
                  cubit.uploadPostImage(
                    uid: userData.userModel!.uid!,
                    profileImage: userData.userModel!.photo!,
                    name: userData.userModel!.name!,
                    dataTime: timeNow.toString(),
                    text: textController.text,
                  );
                }
              },
              child: Text(
                'POST',
                style: TextStyle(color: kPrimaryColor),
              ))
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Column(children: [
          if(state is CreatePostLoading||state is UploadPostImageLoading)
            const  LinearProgressIndicator(),
          Row(
            children: [
              CircleAvatar(
                radius: 30,
                backgroundImage: NetworkImage(userData.userModel!.photo!),
              ),
              const SizedBox(width: 15),
              Text(
                userData.userModel!.name!,
                style: const TextStyle(height: 1.4),
              ),
            ],
          ),
          const SizedBox(height: 15),
          Expanded(
            child: ListView(
              physics: const BouncingScrollPhysics(),
              children: [
                TextFormField(
                  controller: textController,
                  decoration: const InputDecoration(
                    hintText: 'whats is in your mind...',
                    border: InputBorder.none,
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                if (cubit.postImage != null)
                  Stack(
                    alignment: AlignmentDirectional.topEnd,
                    children: [
                      Container(
                        height: 400,
                        width: double.infinity,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5),
                          image: DecorationImage(
                            fit: BoxFit.cover,
                            image: FileImage(cubit.postImage!),
                          ),
                        ),
                      ),
                      IconButton(
                          onPressed: () {
                            cubit.removePostImage();
                          },
                          icon: const CircleAvatar(
                              radius: 15,
                              child: Icon(
                                Icons.close,
                                size: 16,
                              ))),
                    ],
                  ),
              ],
            ),
          ),
          TextButton(
              onPressed: () {
                cubit.getPostImage();
              },
              child: const Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.image),
                  SizedBox(
                    width: 5,
                  ),
                  Text('add photo'),
                ],
              ))
        ]),
      ),
    );
  },
),
    );
  }
}
