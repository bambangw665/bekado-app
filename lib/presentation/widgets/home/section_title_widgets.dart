import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class HomeTitleSectionWidgets extends StatelessWidget {
  HomeTitleSectionWidgets(
      {super.key, required this.title, required this.showMore});

  final String title;
  final bool showMore;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: 10, bottom: 0, right: 10, left: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            title,
            style: GoogleFonts.poppins(
              color: Colors.black,
              fontWeight: FontWeight.bold,
              fontSize: 15.sp,
            ),
          ),
          if (showMore)
            TextButton(
              onPressed: () {
                // onpres lainnya
              },
              child: Text(
                "Lainnya",
                style: GoogleFonts.poppins(
                    fontSize: 15.sp,
                    fontWeight: FontWeight.w500,
                    color: Colors.black),
              ),
            ),
        ],
      ),
    );
  }
}
