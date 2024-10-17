import 'package:flutter/material.dart';
import 'package:bekado/core/constants/app_colors.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../widgets/CustomAppbar/Cutome_appbaar_withgradient_noback_widgets.dart';
import '../../widgets/cart/card_widgets.dart';
import '../../widgets/cart/total_price_cart_widgets.dart';

class CartPage extends StatelessWidget {
  const CartPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: BackgourdColorGrey,
      // appBar: CustomeAppbarWithgradientWidgets(
      //   onPress: () {
      //     Navigator.push(
      //         context, MaterialPageRoute(builder: (_) => BottomMainNavbar()));
      //   },
      //   textAppbar: "Keranjang",
      //   heightsizePlus: 10,
      // ),
      appBar: CustomAppbarWithGradientNoBackWidgets(
        heightsizePlus: 10,
        textAppbar: "Keranjang",
      ),
      body: SafeArea(
        child: Stack(
          children: [
            LayoutBuilder(
              builder: (context, Constraints) {
                return SingleChildScrollView(
                  child: ConstrainedBox(
                    constraints:
                        BoxConstraints(minHeight: Constraints.maxHeight),
                    child: IntrinsicHeight(
                      child: Column(
                        children: [
                          SizedBox(
                            height: 20,
                          ),
                          CardWidgets(
                            imageURL:
                                "https://asset.kompas.com/crops/tR6tdRaBfpP-tU-jjIFZtRFMWu4=/120x0:1000x587/750x500/data/photo/2021/12/04/61ab1818deef2.jpg",
                            titleProduk: "Indomie Goreng",
                            hargaProduk: "Rp 12.000",
                          ),
                          CardWidgets(
                            imageURL:
                                "https://asset.kompas.com/crops/tR6tdRaBfpP-tU-jjIFZtRFMWu4=/120x0:1000x587/750x500/data/photo/2021/12/04/61ab1818deef2.jpg",
                            titleProduk: "Indomie Kuah",
                            hargaProduk: "Rp 12.000",
                          ),
                          CardWidgets(
                            imageURL:
                                "https://asset.kompas.com/crops/tR6tdRaBfpP-tU-jjIFZtRFMWu4=/120x0:1000x587/750x500/data/photo/2021/12/04/61ab1818deef2.jpg",
                            titleProduk: "Indomie Soto",
                            hargaProduk: "Rp 12.000",
                          ),
                          CardWidgets(
                            imageURL:
                                "https://asset.kompas.com/crops/tR6tdRaBfpP-tU-jjIFZtRFMWu4=/120x0:1000x587/750x500/data/photo/2021/12/04/61ab1818deef2.jpg",
                            titleProduk: "Indomie Soto",
                            hargaProduk: "Rp 12.000",
                          ),
                          CardWidgets(
                            imageURL:
                                "https://asset.kompas.com/crops/tR6tdRaBfpP-tU-jjIFZtRFMWu4=/120x0:1000x587/750x500/data/photo/2021/12/04/61ab1818deef2.jpg",
                            titleProduk: "Indomie Soto",
                            hargaProduk: "Rp 12.000",
                          ),
                          CardWidgets(
                            imageURL:
                                "https://asset.kompas.com/crops/tR6tdRaBfpP-tU-jjIFZtRFMWu4=/120x0:1000x587/750x500/data/photo/2021/12/04/61ab1818deef2.jpg",
                            titleProduk: "Indomie Soto",
                            hargaProduk: "Rp 12.000",
                          ),
                          CardWidgets(
                            imageURL:
                                "https://asset.kompas.com/crops/tR6tdRaBfpP-tU-jjIFZtRFMWu4=/120x0:1000x587/750x500/data/photo/2021/12/04/61ab1818deef2.jpg",
                            titleProduk: "Indomie Soto",
                            hargaProduk: "Rp 12.000",
                          ),
                          CardWidgets(
                            imageURL:
                                "https://asset.kompas.com/crops/tR6tdRaBfpP-tU-jjIFZtRFMWu4=/120x0:1000x587/750x500/data/photo/2021/12/04/61ab1818deef2.jpg",
                            titleProduk: "Indomie Soto",
                            hargaProduk: "Rp 12.000",
                          ),
                          Spacer(),
                          SizedBox(
                            height: 80.sp,
                          ),
                        ],
                      ),
                    ),
                  ),
                );
              },
            ),
            Positioned(
              left: 0,
              right: 0,
              bottom: 0,
              child: TotalPriceWidgets(),
            ),
          ],
        ),
      ),
    );
  }
}
