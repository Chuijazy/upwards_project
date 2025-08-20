import 'package:flutter/material.dart';
import 'package:upwards_project/screens/screen_details/app_drawer.dart';
import 'package:upwards_project/screens/screen_details/user_header.dart';

class MainScreen extends StatefulWidget {
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
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final isTablet = screenWidth > 600;

    return Scaffold(
      drawer: const AppDrawer(), // ✅ Подключаем Drawer
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(isTablet ? 80 : 56),
        child: UserHeader(
          isTablet: isTablet,
          fullName: widget.fullName,
          group: widget.group,
        ),
      ),
      // body: Center(
      //   child: Text('Добро пожаловать, ${widget.fullName}!'),
      // ),
    );
  }
}
