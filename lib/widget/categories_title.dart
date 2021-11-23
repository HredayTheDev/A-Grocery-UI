import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CategoriesTitle extends StatelessWidget {
  final Color color;
  final String title;
  final String assetPath;

  const CategoriesTitle({Key key, this.color, this.title, this.assetPath})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          height: 80,
          width: 80,
          padding: EdgeInsets.all(25),
          decoration: BoxDecoration(
            // color: Color(0xffE0E6EE),
            color: this.color,

            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(10),
                topRight: Radius.circular(10),
                bottomRight: Radius.circular(10)),
          ),
          child: Image.asset(assetPath),
        ),
        SizedBox(
          height: 5,
        ),
        Text(
          this.title,
          style: GoogleFonts.varelaRound(fontWeight: FontWeight.w500),
        )
      ],
    );
  }
}
