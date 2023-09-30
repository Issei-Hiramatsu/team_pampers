import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:team_pampers/pages/home_page/components/home_button.dart';
import 'package:team_pampers/utils/utils.dart';
import 'package:team_pampers/widgets/drawer.dart';

class HomePage extends HookConsumerWidget {
   const HomePage({super.key});

  static Route<dynamic> route() {
    return MaterialPageRoute<dynamic>(
      builder: (_) => const HomePage(),
    );
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var _scaffoldKey = GlobalKey<ScaffoldState>();
    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(
        leading:
          IconButton(icon: Icon(Icons.settings),
            onPressed: (){
              _scaffoldKey.currentState!.openDrawer();

            },),
      ),
      body: Center(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 24),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('XXXXテスト',style: Theme.of(context).textTheme.headlineLarge,),
              SizedBox(height: 100,),
              SizedBox(
                height: 80,
                  child: HomePageButton(onPressed: (){}, text: 'START')),
              SizedBox(height: 8,),
              Row(
                children: [
                  SizedBox(
                    height: 50,
                    width: context.deviceWidth*0.5-24-4,
                    child: HomePageButton(onPressed: (){}, icon: Icons.person_outline,text: 'Profile',),
                  ),
                  SizedBox(width: 8,),
                  SizedBox(
                    height: 50,
                    width: context.deviceWidth*0.5-24-4,
                    child: HomePageButton(onPressed: (){}, icon: Icons.emoji_events_outlined,text: 'Ranking',),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
      drawer: CustomDrawer(),
    );
  }
}
