// lib/constants/app_constants.dart
import 'package:flutter/material.dart';

class WalletConstants {
  // Colors
  static const Color backgroundColor = Color.fromRGBO(246, 246, 246, 1);
  static const Color cardColor = Color(0xFFFFFFFF);
  static const Color transactionTextColor = Color(0xFF000000);
  static const Color highlightColor = Color(0xFFE29A4F);

  // Padding
  static const EdgeInsets screenPadding = EdgeInsets.symmetric(horizontal: 16);
  static const EdgeInsets transactionPadding = EdgeInsets.all(8);

  // Sizes
  static const double avatarRadius = 35;
  static const double iconSize = 20;
  static const double cardHeightFactor = 0.12; // 12% of screen height

  // Font Size Factors
  static const double transactionNameFontSizeFactor = 0.045;
  static const double transactionDateFontSizeFactor = 0.03;

}

  class AppConstants {
  // Colors
  static const Color backgroundColor = Color.fromRGBO(246, 246, 246, 1);
  static const Color primaryTextColor = Color.fromRGBO(0, 0, 0, 1.0);
  static const Color secondaryTextColor = Color.fromRGBO(0, 0, 0, 0.3);
  static const Color hintTextColor = Color.fromRGBO(0, 0, 0, 0.15);
  static const Color highlightColor = Color.fromRGBO(226, 154, 79, 1.0);
  static const Color cardColor = Colors.white;
  static const Color iconColor = Colors.grey;

  // Padding
  static const EdgeInsets screenPadding = EdgeInsets.symmetric(horizontal: 18);
  static const EdgeInsets appBarPadding = EdgeInsets.symmetric(horizontal: 16);
  static const EdgeInsets cardPadding = EdgeInsets.all(8.0);

  // Sizes
  static const double avatarRadius = 28;
  static const double iconSize = 30;
  static const double smallIconSize = 15;
  static const double cardHeight = 230;
  static const double cardWidth = 170;
  static const double borderRadius = 10;

  // Font Sizes
  static const double appBarTitleFontSize = 16;
  static const double sectionTitleFontSize = 18;
  static const double searchHintFontSize = 14;
  static const double mainTitleFontSize = 30;
  static const double itemTitleFontSize = 16;
  static const double itemSubtitleFontSize = 12;
  static const double priceFontSize = 14;
  static const double currencyFontSize = 15;
  static const double favoriteIconSize = 24;
  }
