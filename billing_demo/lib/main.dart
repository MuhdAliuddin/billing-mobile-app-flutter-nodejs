import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

import 'dependencies_injection.dart' as di;
import 'routes_generator.dart';
import 'routes_path.dart';

Future<void> main() async {
  di.init();
  await dotenv.load();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Overlay Loader',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        fontFamily: 'Poppins',
        primarySwatch: Colors.blue,
        appBarTheme: AppBarTheme(
          backgroundColor: Colors.blue.shade900,
        ),
        bottomNavigationBarTheme: const BottomNavigationBarThemeData(
          unselectedIconTheme: IconThemeData(color: Color(0xFF66768D) //Color.fromARGB(255, 0, 46, 82),
              ),
        ),
        colorScheme: ColorScheme.fromSwatch(
          primarySwatch: Colors.blue,
        ),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.blue.shade900,
          ),
        ),
      ),
      initialRoute: NavRoute.Root,
      onGenerateRoute: RouteGenerator().generateRoute,
    );
  }
}
