import 'package:easy_localization/easy_localization.dart';
import 'package:f_my_app/widets/app_drawer.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../widets/my_app_bar.dart';
import '../widets/theme_provider.dart';

class SettingsPage extends StatefulWidget {
  const SettingsPage({super.key});

  @override
  State<SettingsPage> createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
   final int _selectedIndex = 3;

  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);

    final Map<String, String> languageMap = {
      'pl': 'Polski',
      'en': 'English',
    };

    return Scaffold(
      appBar: MyAppBar(title: "drawer.settings".tr()),
      drawer:AppDrawer(
        selectedIndex: _selectedIndex,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Icon(
                Icons.lightbulb,
                size: 40,
                color: Colors.blue,
              ),
              const SizedBox(width: 10),
              Text('settings.dark_mode'.tr()),
              const SizedBox(width: 10),
              Switch(
                activeColor: Colors.blue,
                value: themeProvider.isDarkMode,
                onChanged: (bool value) {
                  themeProvider.toggleTheme();
                },
              ),
            ],
          ),
          const SizedBox(height: 10),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Icon(
                Icons.flag_circle,
                size: 40,
                color: Colors.blue,
              ),
              const SizedBox(width: 10),
              Text("settings.language".tr()),
              const SizedBox(width: 10),
              DropdownButton<String>(
                value: context.locale.languageCode,
                onChanged: (value) {
                  context.setLocale(Locale(value!));
                },
                items: languageMap.entries
                    .map(
                      (entry) => DropdownMenuItem(
                        value: entry.key,
                        child: Text(entry.value),
                      ),
                    )
                    .toList(),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
