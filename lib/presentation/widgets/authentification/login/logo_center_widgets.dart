import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../core/constants/app_images.dart';

class Logo_center extends StatelessWidget {
  const Logo_center({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 250.sp,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            // width: 100.sp,
            child: Center(
              child: Center(
                  child: SvgPicture.asset(
                image_login,
                fit: BoxFit.scaleDown,
              )),
            ),
          ),
        ],
      ),
    );
  }
}
