import 'package:flutter/material.dart';
import 'package:upwards_project/core/app_colors.dart';

class UserHeader extends StatelessWidget {
  final String fullName;
  final String group;

  const UserHeader({
    super.key,
    required this.fullName,
    required this.group,
    required bool isTablet,
  });

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final isTablet = screenWidth > 600;
    final iconSize = isTablet ? 32.0 : 24.0;
    final nameFontSize = isTablet ? 20.0 : 16.0;
    final roleFontSize = isTablet ? 16.0 : 14.0;
    final avatarRadius = isTablet ? 30.0 : 24.0;
    final horizontalPadding = isTablet ? 32.0 : 16.0;

    return Container(
      height: isTablet ? 80 : 56,
      width: double.infinity,
      color: Colors.white,
      child: SafeArea(
        bottom: false,
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: horizontalPadding),
          child: Row(
            children: [
              Builder(
                builder: (context) {
                  return IconButton(
                    icon: Icon(
                      Icons.menu,
                      size: iconSize,
                      color: Colors.black87,
                    ),
                    onPressed: () {
                      Scaffold.of(context).openDrawer();
                    },
                  );
                },
              ),
              SizedBox(width: 16),
              Expanded(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Text(
                          fullName,
                          style: TextStyle(
                            fontSize: nameFontSize,
                            color: AppColors.mainTextColor,
                            fontWeight: FontWeight.bold,
                          ),
                          overflow: TextOverflow.ellipsis,
                          maxLines: 1,
                        ),
                        Text(
                          group,
                          style: TextStyle(
                            fontSize: roleFontSize,
                            color: AppColors.secondaryTextColor,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(width: 16),
                    CircleAvatar(
                      radius: avatarRadius,
                      backgroundColor: AppColors.green,
                      child: Text(
                        _getInitials(fullName),
                        style: TextStyle(
                          fontSize: avatarRadius * 0.7,
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  String _getInitials(String name) {
    final parts = name.trim().split(' ');
    if (parts.length >= 2) {
      return parts[0][0].toUpperCase() + parts[1][0].toUpperCase();
    } else if (parts.isNotEmpty) {
      return parts[0][0].toUpperCase();
    }
    return 'U';
  }
}
