import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../constants/appConstants.dart';


class OrderAgainCard extends StatefulWidget {
  final String imagePath;
  final String title;
  final String distance;
  final double rating;
  final int ratingCount;
  final double price;
  final double deliveryFee;

  const OrderAgainCard({
    Key? key,
    required this.imagePath,
    required this.title,
    required this.distance,
    required this.rating,
    required this.ratingCount,
    required this.price,
    required this.deliveryFee,
  }) : super(key: key);

  @override
  State<OrderAgainCard> createState() => _OrderAgainCardState();
}

class _OrderAgainCardState extends State<OrderAgainCard> {
  bool isLiked = false;

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;

    return Container(
      height: AppConstants.cardHeight,
      width: AppConstants.cardWidth,
      decoration: BoxDecoration(
        color: AppConstants.cardColor,
        borderRadius: BorderRadius.circular(AppConstants.borderRadius),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 2, left: 5),
            child: Image.asset(widget.imagePath),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 5, top: 5),
            child: Text(
              widget.title,
              style: GoogleFonts.aoboshiOne(
                fontWeight: FontWeight.w400,
                fontSize: AppConstants.itemTitleFontSize,
              ),
              textAlign: TextAlign.left,
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 5, top: 2),
            child: Row(
              children: [
                Text(
                  '${widget.distance} | ',
                  style: GoogleFonts.roboto(
                    fontSize: AppConstants.itemSubtitleFontSize,
                    fontWeight: FontWeight.w400,
                    color: AppConstants.secondaryTextColor,
                  ),
                ),
                const Icon(
                  Icons.star,
                  color: Color.fromRGBO(250, 159, 24, 1),
                ),
                Text(
                  ' ${widget.rating} (${widget.ratingCount}k)',
                  style: GoogleFonts.roboto(
                    fontSize: AppConstants.itemSubtitleFontSize,
                    fontWeight: FontWeight.w400,
                    color: AppConstants.primaryTextColor,
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 2),
          Padding(
            padding: const EdgeInsets.only(left: 5),
            child: Row(
              children: [
                Text(
                  '\$',
                  style: GoogleFonts.aoboshiOne(
                    fontSize: AppConstants.currencyFontSize,
                    fontWeight: FontWeight.w400,
                    color: Colors.green,
                  ),
                ),
                Text(
                  '${widget.price}',
                  style: GoogleFonts.aoboshiOne(
                    fontSize: AppConstants.priceFontSize,
                    fontWeight: FontWeight.w400,
                    color: AppConstants.highlightColor,
                  ),
                ),
                const SizedBox(width: 15),
                const Icon(
                  Icons.delivery_dining,
                  color: Colors.green,
                  size: AppConstants.smallIconSize,
                ),
                Text(
                  '\$${widget.deliveryFee}',
                  style: GoogleFonts.aoboshiOne(
                    fontSize: AppConstants.priceFontSize,
                    fontWeight: FontWeight.w400,
                    color: AppConstants.highlightColor,
                  ),
                ),
                const SizedBox(width: 10),
                GestureDetector(
                  onTap: () {
                    setState(() {
                      isLiked = !isLiked;
                    });
                  },
                  child: Icon(
                    isLiked ? Icons.favorite : Icons.favorite_border,
                    color: isLiked ? Colors.red : Colors.grey,
                    size: AppConstants.favoriteIconSize,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}