// lib/pages/e_wallet_page.dart
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../Models/transactions.dart';
import '../constants/appConstants.dart';
import '../widgets/TransactionItem.dart';
import '../widgets/app_bar_Wallet.dart';
class EWalletPage extends StatefulWidget {
  const EWalletPage({super.key});

  @override
  State<EWalletPage> createState() => _EWalletPageState();
}

class _EWalletPageState extends State<EWalletPage> {
  final List<Transaction> transactions = [
    Transaction(name: 'Bessie Cooper', date: 'Dec 30, 2019 07:52', amount: 20.00, imagePath: 'assets/1.png'),
    Transaction(name: 'Albert Flores', date: 'Mar 20, 2019 23:14', amount: 10.00, imagePath: 'assets/2.png'),
    Transaction(name: 'Darlene Robertson', date: 'Dec 7, 2019 23:26', amount: 90.28, imagePath: 'assets/3.png'),
    Transaction(name: 'Dianne Russell', date: 'Feb 2, 2019 19:28', amount: 62.00, imagePath: 'assets/4.png'),
    Transaction(name: 'Guy Hawkins', date: 'Dec 30, 2019 05:18', amount: 81.90, imagePath: 'assets/5.png'),
    Transaction(name: 'Arlene McCoy', date: 'Dec 4, 2019 21:42', amount: 62.00, imagePath: 'assets/6.png'),
  ];

  void _removeTransaction(int index) {
    setState(() {
      transactions.removeAt(index);
    });
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: WalletConstants.backgroundColor,
      appBar: CustomAppBarWallet(screenWidth: screenWidth),
      body: Padding(
        padding: WalletConstants.screenPadding,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: screenHeight * 0.02),
            _buildCard(screenWidth, screenHeight),
            SizedBox(height: screenHeight * 0.03),
            _buildTransactionHistoryHeader(screenWidth),
            Expanded(
              child: ListView.builder(
                itemCount: transactions.length,
                itemBuilder: (context, index) {
                  final transaction = transactions[index];
                  return TransactionItem(
                    transaction: transaction,
                    onRemove: () => _removeTransaction(index),
                    screenWidth: screenWidth,
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildCard(double screenWidth, double screenHeight) {
    return Image.asset(
      'assets/card.png',
      width: screenWidth * 0.9,
      height: screenHeight * 0.2,
      fit: BoxFit.cover,
    );
  }

  Row _buildTransactionHistoryHeader(double screenWidth) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          'Transaction History',
          style: GoogleFonts.poppins(
            fontWeight: FontWeight.w400,
            fontSize: screenWidth * WalletConstants.transactionNameFontSizeFactor,
          ),
        ),
        const Icon(Icons.arrow_forward_ios_sharp, color: WalletConstants.highlightColor),
      ],
    );
  }
}