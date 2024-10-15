import 'package:bekado/presentation/widgets/home/home_detail_overlay/product_details_overlay_widgets.dart';
import 'package:bekado/presentation/widgets/home/widgets/product_card_homepage_widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'home_detail_overlay/models_overlay_product_widgets.dart';

class ContainerProductFavoritWidgeets extends StatelessWidget {
  const ContainerProductFavoritWidgeets({super.key});

  @override
  Widget build(BuildContext context) {
    final product = Product.getAllProducts();
    return Container(
      height: 200.sp,
      width: double.infinity,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: product.length,
        itemBuilder: (context, index) {
          return Padding(
            padding: EdgeInsets.only(
              top: 10,
              bottom: 10,
              left: 10,
              right: 0,
            ),
            child: SizedBox(
              width: 150.sp,
              height: 170.sp,
              child: ProductCardHomepageWidgets(
                product: product[index],
                onTap: () => showProductDetail(context, product[index]),
              ),
            ),
          );
        },
      ),
    );
  }
}
