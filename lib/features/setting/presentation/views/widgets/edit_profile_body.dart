import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:social_app/features/layout/manger/layout_cubit.dart';
import '../../../../../core/widgets/component.dart';
import 'edit_sec_1.dart';

class EditProfileScreenBody extends StatelessWidget {
  const EditProfileScreenBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var nameController = TextEditingController();
    var bioController = TextEditingController();
    var phoneController = TextEditingController();
    return BlocBuilder<LayoutCubit, LayoutState>(
      builder: (context, state) {
        var cubit = LayoutCubit.get(context);
        nameController.text = cubit.userModel!.name!;
        bioController.text = cubit.userModel!.bio!;
        phoneController.text = cubit.userModel!.phone!;
        return Scaffold(
          appBar: AppBar(
            leading: IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: const Icon(Icons.keyboard_arrow_left_outlined),
            ),
            titleSpacing: 0,
            title: const Text('Edit Profile'),
            actions: [
              defaultTextButton(function: () {
                cubit.updateUserData(
                    name: nameController.text,
                    phone: phoneController.text,
                    bio: bioController.text);
              }, text: 'update'),
              const SizedBox(
                width: 10,
              ),
            ],
          ),
          body: SingleChildScrollView(
            child: Column(children: [
              if(state is UserUpdateLoading)
                const LinearProgressIndicator(),
              const SizedBox(height: 5,),
              EditSec1(cubit: cubit),
              const SizedBox(height: 25),
              if(cubit.profileImage!=null||cubit.coverImage!=null)
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8.0),
                  child: Row(children: [
                    if(cubit.profileImage!=null)
                      Expanded(child: Column(
                        children: [
                          defaultMaterialButton(
                              function: () {
                                cubit.uploadProfileImage();
                              },
                              text: 'upload image',
                              width: double.infinity,
                              radius: 0),
                          if (state is ProfileImageUpdateLoading )
                            const Padding(
                              padding: EdgeInsets.symmetric(vertical: 5.0),
                              child: LinearProgressIndicator(),
                            ),
                        ],
                      )),
                    const SizedBox(width: 5,),
                    if(cubit.coverImage!=null)
                      Expanded(child: Column(
                        children: [
                          defaultMaterialButton(function: () {
                            cubit.uploadCoverImage();
                          },
                              text: 'upload cover',
                              width: double.infinity,
                              radius: 0),
                          if (state is CoverImageUpdateLoading )
                            const Padding(
                              padding: EdgeInsets.symmetric(vertical: 5.0),
                              child: LinearProgressIndicator(),
                            ),
                        ],
                      )),
                  ],),
                ),
              const SizedBox(height: 25),
              defaultTextFormField(
                  controller: nameController,
                  labelText: 'Name',
                  prefixIcon: Icons.person,
                  type: TextInputType.name,
                  validate: (value) {
                    if (value.isEmpty) {
                      return 'name must not empty';
                    }
                  }),
              const SizedBox(height: 15,),
              defaultTextFormField(
                  controller: bioController,
                  labelText: 'Bio',
                  prefixIcon: Icons.info_outline,
                  type: TextInputType.name,
                  validate: (value) {
                    if (value.isEmpty) {
                      return 'bio must not empty';
                    }
                  }),
              const SizedBox(height: 15,),
              defaultTextFormField(
                  controller: phoneController,
                  labelText: 'phone',
                  prefixIcon: Icons.phone,
                  type: TextInputType.phone,
                  validate: (value) {
                    if (value.isEmpty) {
                      return 'phone must not empty';
                    }
                  }),
            ]),
          ),
        );
      },
    );
  }
}

