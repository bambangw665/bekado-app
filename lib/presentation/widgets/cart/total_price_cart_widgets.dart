import 'package:bekado/core/constants/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:simple_shadow/simple_shadow.dart';

import '../../pages/order/order_page.dart';

class TotalPriceWidgets extends StatelessWidget {
  const TotalPriceWidgets({super.key});

  @override
  Widget build(BuildContext context) {
    return SimpleShadow(
      opacity: 0.7,
      color: Colors.grey,
      // color: Colors.white,
      offset: Offset(1, 1),
      sigma: 2,
      child: Container(
        padding: EdgeInsets.all(16),
        color: Colors.white,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Text(
                    "Total Harga",
                    style: GoogleFonts.poppins(
                      color: Colors.black,
                      fontWeight: FontWeight.w500,
                      fontSize: 14.sp,
                    ),
                  ),
                  Text(
                    "Rp 100.0000",
                    style: GoogleFonts.poppins(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        fontSize: 20.sp),
                  ),
                ],
              ),
            ),
            Container(
              width: 127.sp,
              height: 35.sp,
              decoration: BoxDecoration(
                color: PrimaryColorBlue,
                borderRadius: BorderRadius.circular(10),
              ),
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: PrimaryColorBlue,
                ),
                onPressed: () {
                  Navigator.push(
                      context, MaterialPageRoute(builder: (_) => OrderPage()));
                },
                child: Text(
                  "Pesan",
                  style: GoogleFonts.poppins(
                      color: Colors.white,
                      fontWeight: FontWeight.w500,
                      fontSize: 18),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
