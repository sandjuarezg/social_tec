import 'package:day_night_switcher/day_night_switcher.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:social_tec/provider/theme_provider.dart';
import 'package:social_tec/settings/styles_settings.dart';

class DashboardScreen extends StatefulWidget {
  DashboardScreen({super.key});

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  bool isDarkModeEnabled = false;

  @override
  Widget build(BuildContext context) {
    ThemeProvider theme = Provider.of<ThemeProvider>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text('Social TEC'),
      ),
      drawer: Drawer(
        child: ListView(
          children: [
            const UserAccountsDrawerHeader(
                currentAccountPicture: CircleAvatar(
                  backgroundImage: NetworkImage(
                      'https://fsa.zobj.net/crop.php?r=YGEn11MSJKNgU0S183C18sXt4eMmVYgGZ2A-vdKshT7R4sVl5qOYSyTwpSm2MViKcmEOB2yodeWQ5_Y2Jjs2LOghzNA5UQXOBSvXVE2x4YfIp8WgtcLMb4gyG25lA7FhJ10FvqvV67QXBCzQbmRKpiApGQ8BCM6m4fEUHf8-Bl-j82Ior7Xwcdpk0WDlKmyFd3cwW5UjooeKWIW_'),
                ),
                accountName: Text('Sand Juarez'),
                accountEmail: Text('19030624@itcelaya.edu.mx')),
            ListTile(
              onTap: () {},
              title: Text('Práctica 1'),
              subtitle: Text('Descripción de la práctica'),
              leading: Icon(Icons.settings),
              trailing: Icon(Icons.chevron_right),
            ),
            DayNightSwitcher(
                isDarkModeEnabled: isDarkModeEnabled,
                onStateChanged: (isDarkModeEnabled) {
                  isDarkModeEnabled
                      ? theme.setthemeData(StylesSettings.darkTheme(context))
                      : theme.setthemeData(StylesSettings.lightTheme(context));
                  this.isDarkModeEnabled = isDarkModeEnabled;
                  setState(() {});
                }),
          ],
        ),
      ),
    );
  }
}
