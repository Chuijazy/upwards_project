import 'package:flutter/material.dart';

class MainScreen extends StatelessWidget {
  final String accessToken;
  final String refreshToken;
  final String group;
  final String fullName;

  const MainScreen({
    super.key,
    required this.accessToken,
    required this.refreshToken,
    required this.group,
    required this.fullName,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Главная')),
      body: Center(child: Text('Добро пожаловать, $fullName!')),
    );
  }
}
