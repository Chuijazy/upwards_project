import 'package:flutter/material.dart';
import 'package:upwards_project/core/app_colors.dart';
import 'package:upwards_project/screens/china_screen.dart';

class AppDrawer extends StatefulWidget {
  const AppDrawer({super.key});

  @override
  State<AppDrawer> createState() => _AppDrawerState();
}

class _AppDrawerState extends State<AppDrawer> {
  String? _selectedSubItem;

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: Colors.white,
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          DrawerHeader(
            decoration: const BoxDecoration(color: Colors.white),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Image.asset('assets/logo/logo.png', height: 40),
                IconButton(
                  onPressed: Navigator.of(context).pop,
                  icon: Icon(
                    Icons.arrow_back_ios_new_rounded,
                    color: AppColors.green,
                  ),
                ),
              ],
            ),
          ),
          ExpansionTile(
            backgroundColor: AppColors.backgroundColor,
            leading: Image.asset('assets/icons/home.png'),
            title: const Text('Грузы'),
            children: [
              _buildSubItem(
                title: 'На складе в Китае',
                iconPath: 'assets/icons/home.png',
                onTap: () {
                  Navigator.pop(context);
                  Navigator.of(context).push(
                    MaterialPageRoute(builder: (_) => const ChinaScreen()),
                  );
                },
              ),
              _buildSubItem(
                title: 'Сортировка',
                iconPath: 'assets/icons/pencil.png',
                onTap: () {
                  Navigator.pop(context);
                },
              ),
              _buildSubItem(
                title: 'Отправки',
                iconPath: 'assets/icons/truck.png',
                onTap: () {
                  Navigator.pop(context);
                },
              ),
            ],
          ),
          ExpansionTile(
            backgroundColor: AppColors.backgroundColor,
            leading: Image.asset('assets/icons/parcels.png'),
            title: const Text('Посылки'),
          ),
          ListTile(
            leading: Image.asset('assets/icons/leave.png', height: 24),
            title: const Text('Выход'),
            onTap: () => Navigator.pop(context),
          ),
        ],
      ),
    );
  }

  Widget _buildSubItem({
    required String title,
    required String iconPath,
    required VoidCallback onTap,
  }) {
    final bool isSelected = _selectedSubItem == title;

    return ListTile(
      leading: Image.asset(iconPath, height: 24),
      title: Text(
        title,
        style: TextStyle(
          color: isSelected ? Colors.black : Colors.grey[600],
          fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
        ),
      ),
      trailing: isSelected
          ? Image.asset('assets/icons/check.png', height: 70)
          : null,
      onTap: () {
        setState(() {
          _selectedSubItem = title;
        });
        onTap();
      },
    );
  }
}
