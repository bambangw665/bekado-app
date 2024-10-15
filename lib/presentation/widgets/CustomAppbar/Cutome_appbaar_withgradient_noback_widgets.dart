import 'package:bekado/core/constants/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomAppbarWithGradientNoBackWidgets extends StatelessWidget
    implements PreferredSizeWidget {
  CustomAppbarWithGradientNoBackWidgets({
    super.key,
    required this.textAppbar,
    required this.heightsizePlus,
  });

  final String? textAppbar;
  final int? heightsizePlus;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: PrimaryColorBlue,
      ),
      child: SafeArea(
          child: Stack(
        children: [
          Container(
            // height: 50.sp,
            width: 250.h,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                    topRight: Radius.circular(50),
                    bottomRight: Radius.circular(50)),
                color: Colors.white,
                gradient: LinearGradient(
                  begin: Alignment.centerRight,
                  end: Alignment.bottomCenter,
                  colors: [
                    Colors.white10.withOpacity(0.1),
                    PrimaryColorBlue.withOpacity(0.0),
                  ],
                )),
          ),
          AppBar(
            backgroundColor: Colors.transparent,
            shadowColor: Colors.transparent,
            automaticallyImplyLeading: false,
            elevation: 0,
            title: Text(
              textAppbar!,
              style: TextStyle(
                color: Colors.white,
                fontSize: 20.sp,
                fontWeight: FontWeight.bold,
              ),
            ),
            centerTitle: false,
          ),
        ],
      )),
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight + heightsizePlus!);
}
