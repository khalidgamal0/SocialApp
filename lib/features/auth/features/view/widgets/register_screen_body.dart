import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:social_app/core/widgets/navigation.dart';
import 'package:social_app/features/layout/views/LayoutScreen.dart';
import '../../../../../core/utils/constant.dart';
import '../../../../../core/utils/shared_preferences.dart';
import '../../../../../core/widgets/component.dart';
import '../../../../../core/widgets/toast.dart';
import '../../../../layout/manger/layout_cubit.dart';
import '../../manger/auth_cubit.dart';
import 'register_sec_1.dart';
import 'register_sec_2.dart';

class RegisterScreenBody extends StatelessWidget {
  const RegisterScreenBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var formKey = GlobalKey<FormState>();
    var nameController = TextEditingController();
    var passController = TextEditingController();
    var emailController = TextEditingController();
    var phoneController = TextEditingController();
    return BlocProvider(
      create: (context) => AuthCubit(),
      child: BlocConsumer<AuthCubit, AuthState>(
        listener: (context, state) {
          if (state is RegisterSuccess) {
            SharedPreference.setData(key: 'uid', value: state.uid).then((value) {
              uid=state.uid;
              LayoutCubit.get(context)..getUserData()..getPosts();
              navigateTo(context, const LayoutScreen());
            });
            showToast(state:ToastStates.success ,message:'success register operation' );
          }
          if (state is RegisterError){
            showToast(state:ToastStates.error ,message:state.error );
          }
        },
        builder: (context, state) {
          var cubit = AuthCubit.get(context);
          return Scaffold(
            appBar: AppBar(
                backgroundColor: Colors.white,
                elevation: 0,
                iconTheme: const IconThemeData(color: Colors.black)),
            body: Center(
              child: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Form(
                    key: formKey,
                    child: Column(
                      children: [
                        RegisterSec1(
                            nameController: nameController,
                            emailController: emailController),
                        RegisterSec2(
                            passController: passController,
                            cubit: cubit,
                            phoneController: phoneController),
                        ConditionalBuilder(
                          condition: state is! RegisterLoading,
                          builder: (context) => defaultMaterialButton(
                              width: double.infinity,
                              text: 'register',
                              function: () {
                                if (formKey.currentState!.validate()) {
                                  cubit.userRegister(
                                    name: nameController.text,
                                    phone: phoneController.text,
                                    password: passController.text,
                                    email: emailController.text,
                                  );
                                }
                              }),
                          fallback: (context) =>
                              const Center(child: CircularProgressIndicator()),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
