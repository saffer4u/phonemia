import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'screens/delete_screen.dart';
import 'screens/home_screen.dart';
import 'screens/login_screen.dart';
import 'screens/uploader.dart';
import 'screens/wrapper.dart';
import 'services/auth_service.dart';

// These are some changes
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        Provider<AuthService>(
          create: (_) => AuthService(),
        ),
      ],
      child: MaterialApp(
        title: "Phonemia",
        theme: ThemeData(
          primarySwatch: Colors.pink,
        ),
        debugShowCheckedModeBanner: false,
        initialRoute: HomeScreen.routeName,
        routes: {
          Wrapper.routeName: (ctx) => const Wrapper(),
          HomeScreen.routeName: (ctx) => const HomeScreen(),
          LogInScreen.routeName: (ctx) => const LogInScreen(),
          UploaderScreen.routeName: (ctx) => const UploaderScreen(),
          DeleteScreen.routeName: (ctx) => const DeleteScreen(),
        },
      ),
    );
  }
}
