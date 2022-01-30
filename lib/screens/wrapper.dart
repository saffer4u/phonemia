import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../constants/colors.dart';
import '../services/auth_service.dart';
import 'login_screen.dart';
import 'uploader.dart';

class Wrapper extends StatelessWidget {
  static const routeName = "wrapper";
  const Wrapper({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final authState = Provider.of<AuthService>(context);

    return StreamBuilder<User?>(
      stream: authState.user,
      builder: (_, AsyncSnapshot<User?> snapshot) {
        if (snapshot.connectionState == ConnectionState.active) {
          final User? user = snapshot.data;
          return user == null ? const LogInScreen() : const UploaderScreen();
        } else {
          return Scaffold(
              backgroundColor: bg1,
              body: const Center(
                child: CircularProgressIndicator(),
              ));
        }
      },
    );
  }
}
