import 'package:flutter/material.dart';
import 'package:upwards_project/core/app_colors.dart';

class UserHeader extends StatelessWidget {
  const UserHeader({super.key, required bool isTablet});

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
              IconButton(
                icon: Icon(Icons.menu, size: iconSize, color: Colors.black87),
                onPressed: () {
                  Scaffold.of(context).openDrawer();
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
                          'Александр Прокофьев',
                          style: TextStyle(
                            fontSize: nameFontSize,
                            color: AppColors.mainTextColor,
                            fontWeight: FontWeight.bold,
                          ),
                          overflow: TextOverflow.ellipsis,
                          maxLines: 1,
                        ),
                        Text(
                          'Супер Админ',
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
                        'AU',
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
}
