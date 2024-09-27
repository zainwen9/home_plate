import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../constants/appConstants.dart';


class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  const CustomAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;

    return AppBar(
      backgroundColor: AppConstants.backgroundColor,
      elevation: 0,
      title: Row(
        children: [
          const CircleAvatar(
            radius: AppConstants.avatarRadius,
            backgroundImage: AssetImage('assets/profile.png'),
          ),
          const SizedBox(width: 5),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Deliver to',
                style: GoogleFonts.roboto(
                  fontWeight: FontWeight.w400,
                  fontSize: 12,
                  color: AppConstants.secondaryTextColor,
                ),
              ),
              Text(
                'Farhan Jack',
                style: GoogleFonts.aoboshiOne(
                  fontSize: AppConstants.appBarTitleFontSize,
                  fontWeight: FontWeight.w400,
                ),
              ),
            ],
          ),
          SizedBox(width: screenWidth * 0.27),
          const Icon(Icons.shopping_cart, color: Colors.black),
          const SizedBox(width: 8),
          const Icon(Icons.notifications, color: Colors.black),
        ],
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}