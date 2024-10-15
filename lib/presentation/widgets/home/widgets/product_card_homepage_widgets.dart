import 'package:bekado/core/constants/app_colors.dart';
import 'package:bekado/presentation/widgets/home/home_detail_overlay/models_overlay_product_widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:simple_shadow/simple_shadow.dart';

class ProductCardHomepageWidgets extends StatelessWidget {
  ProductCardHomepageWidgets({
    super.key,
    required this.product,
    required this.onTap,
  });

  final Product product;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: SimpleShadow(
        opacity: 0.7,
        color: Colors.grey,
        offset: Offset(1, 1),
        sigma: 2,
        child: Card(
          // elevation: 1,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(13)),
          child: Padding(
            padding: EdgeInsets.all(15),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Expanded(
                  flex: 1,
                  child: ClipRRect(
                    borderRadius:
                        BorderRadius.vertical(top: Radius.circular(8)),
                    child: Image.network(
                      product.imageUrl,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                SizedBox(
                  height: 10.sp,
                ),
                Text(
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  product.name,
                  style: GoogleFonts.poppins(
                      fontWeight: FontWeight.bold, fontSize: 12.sp),
                ),
                SizedBox(
                  height: 5,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Text(
                      product.price,
                      style: GoogleFonts.poppins(
                          fontWeight: FontWeight.w500, fontSize: 12.sp),
                    ),
                    Container(
                      width: 40.sp,
                      height: 20.sp,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(4),
                        color: PrimaryColorBlue,
                      ),
                      child: Center(
                        child: Text(
                          "Beli",
                          style: GoogleFonts.poppins(
                            fontSize: 12.sp,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    )
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
