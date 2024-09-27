import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:home_plate/classes/cardItem.dart';


class ShoePage extends StatelessWidget {
  final CardItem item;
  const ShoePage({super.key,required this.item});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(item.title),
      ),
      body: Column(children: [
        AspectRatio(aspectRatio: 4/3,
        child: Image.asset(item.urlImage,fit: BoxFit.cover,),
        ),
        const SizedBox(height: 8,),
        Text(item.title,style: GoogleFonts.inter(fontSize: 32,fontWeight: FontWeight.w500),)
      ],
      ),
    );
  }
}
