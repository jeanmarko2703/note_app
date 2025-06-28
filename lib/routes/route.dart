import 'package:flutter/material.dart';

import '../screens/screens.dart';

class AppRoute {
  static String initialRoute = 'homeScreen';

  static Map<String, Widget Function(BuildContext)> getRoutes = {
    'homeScreen': (BuildContext context) => HomeScreen(),
    'CreateNoteScreen': (BuildContext context) => CreateNoteScreen(),
  };
}
