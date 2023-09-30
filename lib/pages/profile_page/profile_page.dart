import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:team_pampers/utils/utils.dart';
import 'package:team_pampers/widgets/custom_button.dart';

class ProfilePage extends HookConsumerWidget {
  const ProfilePage({super.key});

  static Route<dynamic> route() {
    return MaterialPageRoute<dynamic>(
      builder: (_) => const ProfilePage(),
    );
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              height: 100,
              width: 100,
              child: CircleAvatar(
                backgroundImage: AssetImage('assets/images/profile_image.JPG',),
              ),
            ),
            SizedBox(height: 40,),
            Text('@UserName',style: Theme.of(context).textTheme.titleLarge,),
            SizedBox(height: 40,),
            SizedBox(
              width: context.deviceWidth*0.5,
              child: CustomButton(onPressed: (){

              }, text: 'ランキング',icon: Icons.emoji_events_outlined,),
            ),
            Text('獲得バッジ'),

          ],
        ),
      ),
    );
  }
}
