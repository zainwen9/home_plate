
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../Models/cardItem.dart';
import '../constants/appConstants.dart';

import '../screens/ShoePage.dart';

class CuisineCard extends StatelessWidget {
  final CardItem item;

  const CuisineCard({Key? key, required this.item}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 80,
      child: Column(
        children: [
          Expanded(
            child: AspectRatio(
              aspectRatio: 4 / 3,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(AppConstants.borderRadius),
                child: Material(
                  child: Ink.image(
                    image: AssetImage(item.urlImage),
                    fit: BoxFit.cover,
                    child: InkWell(
                      onTap: () {},
                    ),
                  ),
                ),
              ),
            ),
          ),
          const SizedBox(height: 4),
          Text(
            item.title,
            style: GoogleFonts.inter(
              fontWeight: FontWeight.w500,
              fontSize: 12,
            ),
          ),
        ],
      ),
    );
  }
}