import 'package:flutter/material.dart';

import '../../../../../core/widgets/component.dart';

class LoginSec1 extends StatelessWidget {
  const LoginSec1({
    super.key,
    required this.emailController,
  });

  final TextEditingController emailController;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          'Login',
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
          'login now to communicate with friends',
          style: Theme.of(context)
              .textTheme
              .bodyLarge!
              .copyWith(color: Colors.grey),
        ),
        const SizedBox(
          height: 35,
        ),
        defaultTextFormField(
          controller: emailController,
          labelText: 'Email Address',
          prefixIcon: Icons.email_outlined,
          type: TextInputType.emailAddress,
          validate: (value) {
            if (value.isEmpty) {
              return ('Email must not empty');
            }
            return null;
          },
        ),
        const SizedBox(
          height: 15,
        ),
      ],
    );
  }
}
