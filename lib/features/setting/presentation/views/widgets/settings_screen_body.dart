import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:social_app/features/layout/views/LayoutScreen.dart';
import '../../../../../../core/widgets/navigation.dart';
import '../../../../layout/manger/layout_cubit.dart';
import 'setting_sec_2.dart';
import 'setting_sec_3.dart';

class SettingsScreenBody extends StatelessWidget {
  const SettingsScreenBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        leading: IconButton(onPressed: () {
          navigateAndFinish(context, const LayoutScreen());
        },
          icon: const Icon(Icons.keyboard_arrow_left_outlined, size: 35,),
        ),
        titleSpacing: 0,
        title: const Text('Setting', style: TextStyle(color: Colors.black),),
      ),
      body: SingleChildScrollView(
        child: BlocBuilder<LayoutCubit, LayoutState>(
          builder: (context, state) {
            var cubit = LayoutCubit.get(context);
            return Column(children: [
              SizedBox(
                height: 250,
                child: Stack(
                  alignment: AlignmentDirectional.bottomCenter,
                  children: [
                    Align(
                      alignment: AlignmentDirectional.topCenter,
                      child: Container(
                        height: 200,
                        decoration: BoxDecoration(
                          borderRadius: const BorderRadius.only(
                            topLeft: Radius.circular(.5),
                            topRight: Radius.circular(.5),
                          ),
                          image: DecorationImage(
                              fit: BoxFit.cover,
                              image: NetworkImage(
                                  cubit.userModel!.photoCover!)
                          ),
                        ),
                      ),
                    ),
                    CircleAvatar(
                      radius: 60,
                      backgroundImage: NetworkImage(cubit.userModel!.photo!),
                    ),

                  ],
                ),
              ),
              const SizedBox(height: 25),
              SettingSec2(
                  name:cubit.userModel!.name!,
                  bio:cubit.userModel!.bio!
              ),
              const SizedBox(height: 25),
              const SettingSec3(),
            ]);
          },
        ),
      ),
    );
  }
}



