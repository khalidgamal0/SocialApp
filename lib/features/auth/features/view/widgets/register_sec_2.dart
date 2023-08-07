import 'package:flutter/material.dart';

import '../../../../../core/widgets/component.dart';
import '../../manger/auth_cubit.dart';

class RegisterSec2 extends StatelessWidget {
  const RegisterSec2({
    super.key,
    required this.passController,
    required this.cubit,
    required this.phoneController,
  });

  final TextEditingController passController;
  final AuthCubit cubit;
  final TextEditingController phoneController;

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      defaultTextFormField(
        controller: passController,
        labelText: 'Password',
        suffixIcon: cubit.suffixIcon,
        suffixPressed: cubit.changePassVisibility,
        obscureText: cubit.obscureText,
        prefixIcon: Icons.lock_outline_sharp,
        type: TextInputType.name,
        validate: (value) {
          if (value.isEmpty) {
            return ('Email must not empty');
          }
          return null;
        },
      ),
      const SizedBox(
        height: 20,
      ),
      defaultTextFormField(
        controller: phoneController,
        labelText: 'Phone',
        prefixIcon: Icons.phone,
        type: TextInputType.phone,
        validate: (value) {
          if (value.isEmpty) {
            return ('Email must not empty');
          }
          return null;
        },
      ),
      const SizedBox(
        height: 20,
      ),
    ],);
  }
}
