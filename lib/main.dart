import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:home_plate/screens/CartScreen.dart';
import 'package:home_plate/screens/Home.dart';
import 'package:home_plate/screens/Wallet.dart';

import 'constants/appConstants.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Home Plate',
      theme: ThemeData(
        textTheme: GoogleFonts.poppinsTextTheme(),
        primaryColor: WalletConstants.highlightColor,
        appBarTheme: const AppBarTheme(
          backgroundColor: WalletConstants.backgroundColor,
          iconTheme: IconThemeData(color: Colors.black),
          titleTextStyle: TextStyle(
            color: Colors.black,
            fontSize: 20,
            fontWeight: FontWeight.w400,
          ),
        ),
      ),
      home:const BottomNavBarExample(),
    );
  }
}

class BottomNavBarExample extends StatefulWidget {
  const BottomNavBarExample({super.key});

  @override
  _BottomNavBarExampleState createState() => _BottomNavBarExampleState();
}

class _BottomNavBarExampleState extends State<BottomNavBarExample> {
  int _selectedIndex = 0;

  // Define the screens here
  final List<Widget> _screens = [
    const Home(),  // Home screen
    const CartPage(),  // Screen 2
    const EWalletPage(), // Screen 3
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: _screens[_selectedIndex], // Display selected screen content only
        ),
        BottomNavigationBar(
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: Icon(Icons.home_filled),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.shopping_cart),
              label: 'My Cart',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.wallet),
              label: 'E-Wallet',
            ),
          ],
          currentIndex: _selectedIndex,
          selectedItemColor:const Color(0xFFE29A4F),
          onTap: _onItemTapped,
        ),
      ],
    );
  }
}


