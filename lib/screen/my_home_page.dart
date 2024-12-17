import 'package:easy_localization/easy_localization.dart';
import 'package:f_my_app/widets/app_drawer.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../widets/my_app_bar.dart';
import '../widets/theme_provider.dart';

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key});

  final int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    Provider.of<ThemeProvider>(context);

    return Scaffold(
      appBar: MyAppBar(title: "drawer.about_me".tr()),
      drawer: AppDrawer(
        selectedIndex: _selectedIndex,
      ),
      body: Column(
        children: [
          SizedBox(
            height: 15,
          ),
          Expanded(
            flex: 1,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset('lib/assets/images/my/ja.jpg'),
                SizedBox(
                  height: 15,
                ),
              ],
            ),
          ),
          Expanded(
            flex: 2,
            child: Padding(
              padding: EdgeInsets.all(10),
              child: ListView(
                children: [
                  Text(
                    'main.hi'.tr(),
                    style: TextStyle(fontSize: 20),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    'main.about_me'.tr(),
                    style: TextStyle(fontSize: 15),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
