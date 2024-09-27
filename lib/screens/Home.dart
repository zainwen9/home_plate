import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../Models/cardItem.dart';
import '../constants/appConstants.dart';
import '../widgets/CuisineCard.dart';
import '../widgets/OrderAgain.dart';
import '../widgets/SpecialOffers.dart';
import '../widgets/app_bar_Home.dart';


class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final List<CardItem> items = const [
    CardItem(urlImage: 'assets/pakistan.png', title: 'Pakistan'),
    CardItem(urlImage: 'assets/indian.png', title: 'Indian'),
    CardItem(urlImage: 'assets/brazilian.png', title: 'Brazilian'),
    CardItem(urlImage: 'assets/arabic.png', title: 'Arabic'),
    CardItem(urlImage: 'assets/pakistan.png', title: 'Pakistan'),
    CardItem(urlImage: 'assets/indian.png', title: 'Indian'),
    CardItem(urlImage: 'assets/brazilian.png', title: 'Brazilian'),
    CardItem(urlImage: 'assets/arabic.png', title: 'Arabic'),
  ];

  bool isLikedPasta = false;
  bool isLikedTaco = false;

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: AppConstants.backgroundColor,
      appBar: const CustomAppBar(),
      body: ListView(
        children: [
          SizedBox(height: screenHeight * 0.03),
          Padding(
            padding: const EdgeInsets.only(left: 18),
            child: Text(
              'What would you like to order',
              style: GoogleFonts.aoboshiOne(
                fontWeight: FontWeight.w400,
                fontSize: AppConstants.mainTitleFontSize,
                color: AppConstants.primaryTextColor,
              ),
            ),
          ),
          const SizedBox(height: 10),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 18),
            child: TextField(
              decoration: InputDecoration(
                prefixIcon: const Icon(
                  Icons.search_sharp,
                  color: AppConstants.hintTextColor,
                  size: AppConstants.iconSize,
                ),
                hintText: 'What are you craving?',
                hintStyle: GoogleFonts.poppins(
                  fontSize: AppConstants.searchHintFontSize,
                  fontWeight: FontWeight.w400,
                  color: AppConstants.hintTextColor,
                ),
                border: OutlineInputBorder(
                  borderSide: const BorderSide(width: 1, color: Colors.red),
                  borderRadius: BorderRadius.circular(25),
                ),
              ),
            ),
          ),
          const SizedBox(height: 10),
          _buildSectionHeader('Country Cuisine', 'See all'),
          SizedBox(
            height: 150,
            child: ListView.separated(
              padding: const EdgeInsets.all(16),
              scrollDirection: Axis.horizontal,
              itemCount: items.length,
              separatorBuilder: (context, _) => const SizedBox(width: 12),
              itemBuilder: (context, index) => CuisineCard(item: items[index]),
            ),
          ),
          _buildSectionHeader('Order again', 'See all'),
          const Padding(
            padding:  EdgeInsets.symmetric(horizontal: 20),
            child: Row(
              children: [
                Expanded(
                  child: OrderAgainCard(
                    imagePath: 'assets/pasta.png',
                    title: 'Penne Pasta',
                    distance: '1.7km',
                    rating: 4.9,
                    ratingCount: 1300,
                    price: 8.00,
                    deliveryFee: 1.00,
                  ),
                ),
                 SizedBox(width: 10),
                Expanded(
                  child: OrderAgainCard(
                    imagePath: 'assets/taco.png',
                    title: 'Mexican Tacos',
                    distance: '2.1km',
                    rating: 4.3,
                    ratingCount: 1400,
                    price: 11.99,
                    deliveryFee: 2.00,
                  ),
                ),
              ],
            ),
          ),
          _buildSectionHeader('Special Offers', 'See all'),
          const SpecialOffer(),
        ],
      ),
    );
  }

  Widget _buildSectionHeader(String title, String action) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            title,
            style: GoogleFonts.aoboshiOne(
              fontWeight: FontWeight.w400,
              fontSize: AppConstants.sectionTitleFontSize,
              color: AppConstants.primaryTextColor,
            ),
          ),
          Text(
            action,
            style: GoogleFonts.aoboshiOne(
              fontWeight: FontWeight.w400,
              fontSize: AppConstants.sectionTitleFontSize,
              color: AppConstants.highlightColor,
            ),
          ),
        ],
      ),
    );
  }
}