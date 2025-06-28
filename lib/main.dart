import 'package:class_4/firebase_options.dart';
import 'package:class_4/providers/navigation_provider.dart';
import 'package:class_4/providers/note_provider.dart';
import 'package:class_4/routes/route.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<NoteProvider>(create: (_) => NoteProvider()),
        ChangeNotifierProvider<NavigationProvider>(
          create: (_) => NavigationProvider(),
        ),
      ],
      child: MaterialApp(
        title: 'Note app',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.amber[100]!),
        ),
        routes: AppRoute.getRoutes,
        initialRoute: AppRoute.initialRoute,
      ),
    );
  }
}
