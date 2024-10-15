import 'package:bekado/core/constants/app_colors.dart';
import 'package:bekado/presentation/widgets/home/widgets/custom_appbar_home_widgets.dart';
import 'package:flutter/material.dart';

import '../../widgets/home/container_product_card_widgets.dart';
import '../../widgets/home/container_recomendation_product_widgets.dart';
import '../../widgets/home/section_title_widgets.dart';

class HomePage extends StatelessWidget {
  HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: BackgourdColorGrey,
      body: SafeArea(
        child: CustomScrollView(
          slivers: [
            CusotmeHomeAppbar(),
            SliverToBoxAdapter(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  HomeTitleSectionWidgets(
                      title: "Produk Favorit", showMore: true),
                  ContainerProductFavoritWidgeets(),
                  SizedBox(height: 10),

                  // rekomendasi resep makanan
                  // HomeTitleSectionWidgets(
                  //     title: "Rekomendasi Resep Makanan", showMore: false),
                  // SizedBox(
                  //   height: 10,
                  // ),
                  // RecomendationRecipe(),
                  SizedBox(height: 10),
                  HomeTitleSectionWidgets(
                      title: "Rekomendasi Produk", showMore: false),
                  SizedBox(
                    height: 10,
                  ),
                  ContainerProductRekomendationWidgets(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
