import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:social_app/features/layout/manger/layout_cubit.dart';
import '../../../../../../core/widgets/the_end.dart';
import 'home_sec_1.dart';
import 'post_item_sec_1.dart';
import 'post_item_sec_2.dart';
import 'post_item_sec_3.dart';

class HomeScreenBody extends StatelessWidget {
  const HomeScreenBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home'),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.notifications),
          ),
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.search),
          )
        ],
      ),
      body: SingleChildScrollView(
        child: BlocBuilder<LayoutCubit, LayoutState>(
          builder: (context, state) {
            var cubit = LayoutCubit.get(context);
            return ConditionalBuilder(
              condition: state is! GetUserDataLoading && cubit.posts.isNotEmpty,
              builder: (BuildContext context) {
                return Column(children: [
                  HomeSec1(profileImage: cubit.userModel!.photo!),
                  ListView.separated(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      itemBuilder: (context, index) =>
                          Card(
                              clipBehavior: Clip.antiAliasWithSaveLayer,
                              margin: const EdgeInsets.symmetric(vertical: 8),
                              elevation: 5,
                              child: Column(
                                children: [
                                  PostItemSec1(
                                    profileImage: cubit.posts[index]
                                        .profileImage!,
                                    name: cubit.posts[index].name!,
                                  ),
                                  PostItemSec2(
                                    postImage: cubit.posts[index]
                                        .postPhoto!,
                                    postText: cubit.posts[index]
                                        .text!,),
                                  const TheEnd(),
                                  const SizedBox(height: 10),
                                  PostItemSec3(
                                      profileImage: cubit.userModel!.photo!),
                                  const SizedBox(height: 10),
                                ],
                              )),
                      separatorBuilder: (context, index) =>
                      const SizedBox(
                        height: 15,
                      ),
                      itemCount: cubit.posts.length)
                ]);
              },
              fallback: (BuildContext context) =>
              const Center(child: CircularProgressIndicator()),
            );
          },
        ),
      ),
    );
  }
}
