// lib/models/transaction.dart
class Transaction {
  final String name;
  final String date;
  final double amount;
  final String imagePath;

  Transaction({
    required this.name,
    required this.date,
    required this.amount,
    required this.imagePath,
  });
}