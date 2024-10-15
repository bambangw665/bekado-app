import 'package:bekado/core/constants/app_colors.dart';
import 'package:bekado/presentation/pages/cart/cart_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';

class CusotmeHomeAppbar extends StatelessWidget {
  CusotmeHomeAppbar({
    Key? key,
  }) : super(key: key);

//  -------------------------------------- Category ------------
  final List<Category> categories = [
    Category(icon: Icons.shopping_basket, name: 'Kebutuhan Pokok'),
    Category(icon: Icons.local_cafe, name: 'Minuman'),
    Category(icon: Icons.cleaning_services, name: 'Deterjen & Pembersih'),
  ];

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      // Arow back fasle
      automaticallyImplyLeading: false,
      // end arrow back false
      expandedHeight: 200.0.sp,
      floating: false,
      pinned: true,
      collapsedHeight: 130.sp,
      backgroundColor: PrimaryColorBlue,
      flexibleSpace: LayoutBuilder(
        builder: (BuildContext context, BoxConstraints constraints) {
          double percent = (constraints.maxHeight - kToolbarHeight) /
              (300.0 - kToolbarHeight);
          percent = percent.clamp(0.0, 1.0);
          return Stack(
            children: [
              // Lottie animation at the right
              Positioned(
                right: 0,
                top: 0,
                bottom: 0,
                width: MediaQuery.of(context).size.width - 180.sp,
                child: AnimatedOpacity(
                  duration: Duration(milliseconds: 100),
                  opacity: percent,
                  child: Lottie.asset(
                    "assets/animation/animation_simple_ovalline.json",
                    reverse: true,
                    fit: BoxFit.cover,
                    frameRate: FrameRate(25),
                  ),
                ),
              ),
              Positioned(
                left: 16,
                right: 16,
                bottom: 10,
                child: Column(
                  children: [
                    Row(
                      children: [
                        Expanded(
                          flex: 5,
                          child: Container(
                            height: 50.sp,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(6),
                              color: Colors.white,
                            ),
                            child: TextFormField(
                              // textAlign: TextAlign.justify,
                              decoration: InputDecoration(
                                contentPadding: EdgeInsets.symmetric(
                                    horizontal: 20, vertical: 10),
                                floatingLabelBehavior:
                                    FloatingLabelBehavior.never,
                                // prefix: Icon(Icons.search),
                                labelText: "Cari Produk ......",
                                suffix: Icon(
                                  Icons.search,
                                  color: Colors.black87,
                                ),
                                border: InputBorder.none,
                              ),
                              // scrollPadding: EdgeInsets.all(20),
                              scrollPhysics: AlwaysScrollableScrollPhysics(),
                            ),
                          ),
                        ),
                        // ---------------------------------- Icon shopping -------------
                        // Expanded(
                        //   flex: 1,
                        //   child: IconButton(
                        //     onPressed: () {
                        //       Navigator.push(
                        //           context,
                        //           MaterialPageRoute(
                        //               builder: (_) => CartPage()));
                        //     },
                        //     icon: Icon(
                        //       Icons.shopping_cart,
                        //       size: 35,
                        //       color: Colors.white,
                        //     ),
                        //   ),
                        // ),
                      ],
                    ),
                    SizedBox(
                      height: 18.sp,
                    ),
                    Container(
                      height: 40.sp,
                      child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: categories.length,
                        itemBuilder: (context, index) {
                          return Padding(
                            padding: EdgeInsets.only(
                              left: index == 0 ? 16 : 8,
                              right: index == categories.length - 1 ? 0 : 0,
                            ),
                            child: CategoryChip(category: categories[index]),
                          );
                        },
                      ),
                    ),
// --------------------------------------  Row Menu Bawah Search -------------
                  ],
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}

class CategoryChip extends StatelessWidget {
  CategoryChip({
    super.key,
    required this.category,
  });

  final Category category;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 5, horizontal: 10),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(
            category.icon,
            size: 14,
            color: PrimaryColorBlue,
          ),
          SizedBox(
            width: 5,
          ),
          Text(
            category.name,
            style: GoogleFonts.poppins(
                color: Colors.black,
                fontWeight: FontWeight.bold,
                fontSize: 10.sp),
          )
        ],
      ),
    );
  }
}

class Category {
  final IconData icon;
  final String name;

  Category({required this.icon, required this.name});
}
