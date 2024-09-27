// lib/widgets/app_bar_widget.dart
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../constants/appConstants.dart';


class CustomAppBarWallet extends StatelessWidget implements PreferredSizeWidget {
  final double screenWidth;

  const CustomAppBarWallet({Key? key, required this.screenWidth}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: WalletConstants.backgroundColor,
      elevation: 0,
      leading: const Icon(Icons.arrow_back, color: Colors.black),
      title: Text(
        'E-Wallet',
        style: GoogleFonts.aoboshiOne(
          fontWeight: FontWeight.w400,
          fontSize: screenWidth * 0.05,
        ),
      ),
      actions: const [
        Icon(Icons.search, color: Colors.black),
        SizedBox(width: 16),
        Icon(Icons.more_vert, color: Colors.black),
        SizedBox(width: 16),
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}