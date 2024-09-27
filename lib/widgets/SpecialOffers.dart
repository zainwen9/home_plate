import 'package:flutter/material.dart';


class SpecialOffer extends StatelessWidget {
  const SpecialOffer({super.key});

  @override
  Widget build(BuildContext context) {
    return const Image(
      image: AssetImage('assets/discount.png'),
      fit: BoxFit.cover,
    );
  }
}