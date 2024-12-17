import 'package:easy_localization/easy_localization.dart';
import 'package:f_my_app/screen/login/login_page.dart';
import 'package:f_my_app/screen/my_home_page.dart';
import 'package:f_my_app/screen/settings_page.dart';
import 'package:f_my_app/screen/trip_page.dart';
import 'package:f_my_app/widets/theme_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../screen/map_page.dart';

class AppDrawer extends StatelessWidget {
  final int selectedIndex;

  const AppDrawer({super.key, required this.selectedIndex});

  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);

    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          DrawerHeader(
            decoration: const BoxDecoration(color: Colors.blue),
            child: Text(
              ("drawer.robert".tr()),
              style: const TextStyle(color: Colors.white, fontSize: 24),
            ),
          ),
          _buildDrawerItem(
            context,
            icon: Icons.person,
            title: "drawer.about_me".tr(),
            index: 0,
            selectedIndex: selectedIndex,
            onTap: () {
              Navigator.pop(context);
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (context) => const MyHomePage()),
              );
            },
          ),
          _buildDrawerItem(
            context,
            icon: Icons.map,
            title: "drawer.map".tr(),
            index: 1,
            selectedIndex: selectedIndex,
            onTap: () {
              Navigator.pop(context);
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (context) => const MapPage()),
              );
            },
          ),
          _buildDrawerItem(
            context,
            icon: Icons.travel_explore,
            title: "drawer.trip".tr(),
            index: 2,
            selectedIndex: selectedIndex,
            onTap: () {
              Navigator.pop(context);
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (context) => const TripPage()),
              );
            },
          ),
          _buildDrawerItem(
            context,
            icon: Icons.settings,
            title: "drawer.settings".tr(),
            index: 3,
            selectedIndex: selectedIndex,
            onTap: () {
              Navigator.pop(context);
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (context) => const SettingsPage()),
              );
            },
          ),
          _buildDrawerItem(
            context,
            icon: Icons.logout,
            title: "drawer.logout".tr(),
            index: 4,
            selectedIndex: selectedIndex,
            onTap: () {
              Navigator.pop(context);
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (context) => const LoginPage()),
              );
            },
          ),
        ],
      ),
    );
  }

  Widget _buildDrawerItem(
    BuildContext context, {
    required IconData icon,
    required String title,
    required int index,
    required int selectedIndex,
    required VoidCallback onTap,
  }) {
    return ListTile(
      leading: Icon(icon),
      title: Text(title),
      tileColor: selectedIndex == index ? Colors.blue: null,
      onTap: onTap,
    );
  }
}
