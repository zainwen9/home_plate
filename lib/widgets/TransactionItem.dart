// lib/widgets/transaction_item.dart
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../Models/transactions.dart';
import '../constants/appConstants.dart';


class TransactionItem extends StatelessWidget {
  final Transaction transaction;
  final VoidCallback onRemove;
  final double screenWidth;

  const TransactionItem({
    Key? key,
    required this.transaction,
    required this.onRemove,
    required this.screenWidth,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: WalletConstants.transactionPadding,
      child: Container(
        decoration: BoxDecoration(
          color: WalletConstants.cardColor,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Padding(
          padding: WalletConstants.transactionPadding,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              _buildTransactionInfo(),
              _buildTransactionActions(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildTransactionInfo() {
    return Row(
      children: [
        CircleAvatar(
          radius: WalletConstants.avatarRadius,
          backgroundImage: AssetImage(transaction.imagePath),
        ),
        SizedBox(width: screenWidth * 0.02),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              transaction.name,
              style: GoogleFonts.poppins(
                fontSize: screenWidth * WalletConstants.transactionNameFontSizeFactor,
                fontWeight: FontWeight.w500,
              ),
            ),
            Text(
              transaction.date,
              style: GoogleFonts.poppins(
                fontSize: screenWidth * WalletConstants.transactionDateFontSizeFactor,
                fontWeight: FontWeight.w400,
                color: WalletConstants.transactionTextColor.withOpacity(0.4),
              ),
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildTransactionActions() {
    return Column(
      children: [
        IconButton(
          icon: const Icon(Icons.close, color: Colors.red, size: WalletConstants.iconSize),
          onPressed: onRemove,
        ),
        Row(
          children: [
            Text(
              '\$ ',
              style: GoogleFonts.aoboshiOne(
                fontSize: screenWidth * WalletConstants.transactionNameFontSizeFactor,
                color: WalletConstants.highlightColor,
              ),
            ),
            Text(
              '${transaction.amount}',
              style: GoogleFonts.aoboshiOne(
                fontSize: screenWidth * WalletConstants.transactionNameFontSizeFactor,
              ),
            ),
          ],
        ),
      ],
    );
  }
}