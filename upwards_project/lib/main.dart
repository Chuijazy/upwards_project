import 'package:flutter/material.dart';
import 'package:upwards_project/auth/bloc/auth_storage.dart';
import 'auth/auth_screen.dart';
import 'screens/main_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  final accessToken = await AuthStorage.getAccessToken();
  final fullName = await AuthStorage.getFullName();
  final group = await AuthStorage.getGroup();
  final refreshToken = await AuthStorage.getRefreshToken();

  runApp(
    MyApp(
      isLoggedIn:
          accessToken != null &&
          refreshToken != null &&
          fullName != null &&
          group != null,
      accessToken: accessToken,
      refreshToken: refreshToken,
      fullName: fullName,
      group: group,
    ),
  );
}

class MyApp extends StatelessWidget {
  final bool isLoggedIn;
  final String? accessToken;
  final String? refreshToken;
  final String? fullName;
  final String? group;

  const MyApp({
    super.key,
    required this.isLoggedIn,
    this.accessToken,
    this.refreshToken,
    this.fullName,
    this.group,
  });

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Локальная авторизация',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: isLoggedIn
          ? MainScreen(
              accessToken: accessToken!,
              refreshToken: refreshToken!,
              fullName: fullName!,
              group: group!,
            )
          : const AuthScreen(),
    );
  }
}
