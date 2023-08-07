import 'package:flutter/material.dart';

import '../../../../../core/widgets/component.dart';

class RegisterSec1 extends StatelessWidget {
  const RegisterSec1({
    super.key,
    required this.nameController,
    required this.emailController,
  });

  final TextEditingController nameController;
  final TextEditingController emailController;

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      Text(
        'Register',
        style: Theme.of(context)
            .textTheme
            .headlineMedium!
            .copyWith(
          color: Colors.blue,
        ),
      ),
      const SizedBox(
        height: 15,
      ),
      Text(
        'register now to communicate with friends',
        textAlign: TextAlign.center,
        style: Theme.of(context)
            .textTheme
            .bodyLarge!
            .copyWith(color: Colors.grey),
      ),
      const SizedBox(
        height: 35,
      ),
      defaultTextFormField(
        controller: nameController,
        labelText: 'Name',
        prefixIcon: Icons.person,
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
        controller: emailController,
        labelText: 'Email Address',
        prefixIcon: Icons.email,
        type: TextInputType.emailAddress,
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
