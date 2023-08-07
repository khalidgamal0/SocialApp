import 'package:flutter/material.dart';
import 'package:social_app/core/utils/shared_preferences.dart';
import 'package:social_app/core/widgets/navigation.dart';
import '../../../../../../core/widgets/component.dart';
import '../../../../../core/utils/constant.dart';
import '../../../../auth/features/view/login_screen.dart';
import '../../../../posts/presentation/views/post_screen.dart';
import '../edit_profile.dart';


class SettingSec3 extends StatelessWidget {
  const SettingSec3({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0),
      child: Column(
        children: [
          Row(
            children: [
              Expanded(child: OutlinedButton(onPressed:(){
                navigateTo(context,const PostScreen());

              },
                  child:const Text('Add Photo'))),
              const  SizedBox(width: 15,),
              OutlinedButton(onPressed:(){
                navigateTo(context,const EditProfileScreen());
              },
                  child:const Icon(Icons.edit,size: 16,)),
            ],
          ),
          const SizedBox(height:25),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              OutlinedButton(onPressed:(){}, child:const Text('subscribe') ),
              const SizedBox(width:25),
              OutlinedButton(onPressed:(){}, child:const Text('unsubscribe') ),
            ],),
          const SizedBox(height:20),
          defaultMaterialButton(width: double.infinity, text: 'LOGOUT',radius: 0,
              function: (){
            SharedPreference.removeData(key: uid!);
            navigateAndFinish(context,const LoginScreen());
              }
          ),
        ],
      ),
    );
  }
}
