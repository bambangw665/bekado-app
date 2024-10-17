import 'package:bekado/core/constants/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class OrderContainerCountWidgets extends StatelessWidget {
  const OrderContainerCountWidgets({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          container_cout_widgets(
            count: "1",
            name: "Antrian",
          ),
          SizedBox(
            width: 10,
          ),
          container_cout_widgets(count: "0", name: "Proses"),
          SizedBox(
            width: 10,
          ),
          container_cout_widgets(count: "0", name: "Selesai")
        ],
      ),
    );
  }
}

class container_cout_widgets extends StatelessWidget {
  const container_cout_widgets({
    super.key,
    required this.count,
    required this.name,
  });

  final String count;
  final String name;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 120,
      width: 100,
      decoration: BoxDecoration(
        color: PrimaryColorBlue.withOpacity(0.4),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            count,
            style: GoogleFonts.poppins(
                color: Colors.black, fontWeight: FontWeight.bold),
          ),
          SizedBox(
            height: 3,
          ),
          Text(
            name,
            style: GoogleFonts.poppins(
                color: Colors.black87, fontWeight: FontWeight.w500),
          )
        ],
      ),
    );
  }
}
