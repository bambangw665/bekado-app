import 'package:bekado/core/constants/app_colors.dart';
import 'package:bekado/presentation/widgets/home/home_detail_overlay/models_overlay_product_widgets.dart';
import 'package:bekado/presentation/widgets/home/home_detail_overlay/product_details_overlay_widgets.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ContainerProductRekomendationWidgets extends StatelessWidget {
  const ContainerProductRekomendationWidgets({super.key});

  @override
  Widget build(BuildContext context) {
    final product = Product.getAllProducts();
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10.0),
      child: GridView.builder(
        shrinkWrap: true,
        physics: NeverScrollableScrollPhysics(),
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2, childAspectRatio: 0.80,
          // childAspectRatio: 1.0,
          // crossAxisSpacing: 5,
          // mainAxisSpacing: 5,
        ),
        itemCount: product.length, // Jumlah produk yang ditampilkan
        itemBuilder: (context, index) {
          return ProductRecommendationCard(
            // Ganti dengan path gambar yang sesuai
            product: product[index],
            onTap: () => showProductDetail(context, product[index]),
          );
        },
      ),
    );
  }
}

class ProductRecommendationCard extends StatelessWidget {
  // final String name;
  // final String price;
  // final String imageUrl;
  final Product product;
  final VoidCallback onTap;

  const ProductRecommendationCard({
    Key? key,
    // required this.name,
    // required this.price,
    // required this.imageUrl,
    required this.onTap,
    required this.product,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Card(
        // elevation: 2,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
        child: Padding(
          // padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
          padding: EdgeInsets.all(10.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: ClipRRect(
                  borderRadius: BorderRadius.vertical(top: Radius.circular(8)),
                  child: Image.network(
                    product.imageUrl,
                    fit: BoxFit.contain,
                    width: double.infinity,
                  ),
                ),
              ),
              SizedBox(
                height: 8,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 8.0),
                child: Text(
                  product.name,
                  style: TextStyle(fontWeight: FontWeight.bold),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      product.price,
                      style: TextStyle(
                          fontWeight: FontWeight.w500, color: Colors.black),
                    ),
                    Container(
                      width: 40,
                      height: 20,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(4),
                        color: PrimaryColorBlue,
                      ),
                      child: Center(
                        child: Text(
                          "Beli",
                          style: GoogleFonts.poppins(
                            fontSize: 12,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
