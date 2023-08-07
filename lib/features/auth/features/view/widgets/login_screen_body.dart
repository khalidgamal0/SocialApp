import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:social_app/features/layout/manger/layout_cubit.dart';
import '../../../../../core/utils/constant.dart';
import '../../../../../core/utils/shared_preferences.dart';
import '../../../../../core/widgets/navigation.dart';
import '../../../../../core/widgets/toast.dart';
import '../../../../layout/views/LayoutScreen.dart';
import '../../manger/auth_cubit.dart';
import 'login_sec_1.dart';
import 'login_sec_2.dart';

class LoginScreenBody extends StatelessWidget {
  const LoginScreenBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var formKey = GlobalKey<FormState>();
    var emailController = TextEditingController();
    var passController = TextEditingController();
    return BlocProvider(
      create: (context) => AuthCubit(),
      child: BlocConsumer<AuthCubit, AuthState>(
        listener: (context, state) {
          if (state is LoginSuccess) {
            SharedPreference.setData(key: 'uid', value: state.uid)
                .then((value) {
              uid = state.uid;
              LayoutCubit.get(context)..getUserData()..getPosts();
              navigateTo(context, const LayoutScreen());
            });
            showToast(
                state: ToastStates.success, message: 'success Login operation');
          }
          if (state is LoginError) {
            showToast(state: ToastStates.error, message: state.error);
          }
        },
        builder: (context, state) {
          var cubit = AuthCubit.get(context);
          return Scaffold(
            body: Center(
              child: SingleChildScrollView(
                child: Form(
                  key: formKey,
                  child: Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Column(children: [
                      LoginSec1(emailController: emailController),
                      LoginSec2(
                        emailController: emailController,
                        passController: passController,
                        cubit: cubit,
                        formKey: formKey,
                        condition: state is LoginLoading,
                      ),
                    ]),
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
