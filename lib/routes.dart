import 'package:flutter/material.dart';
import 'package:social_tec/screens/register_screen.dart';
import 'package:social_tec/screens/dashboard_screen.dart';

Map<String, WidgetBuilder> getApplicationRoutes() {
  return <String, WidgetBuilder>{
    '/register': (BuildContext context) => const RegisterScreen(),
    '/dash': (BuildContext context) => DashboardScreen(),
  };
}
