import 'package:bekado/core/constants/app_colors.dart';
import 'package:bekado/presentation/widgets/CustomAppbar/Custome_Appbar_WithGradient_widgets.dart';
import 'package:flutter/material.dart';

import '../../widgets/CustomAppbar/Cutome_appbaar_withgradient_noback_widgets.dart';
import '../../widgets/order_progres/order_container_count_widgets.dart';
import '../../widgets/order_progres/order_tabbar_widgets.dart';

class OrderProgresPage extends StatelessWidget {
  const OrderProgresPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: BackgourdColorGrey,
      // appBar: CustomeAppbarWithgradientWidgets(
      //   onPress: () {
      //     Navigator.pop(context);
      //   },
      //   textAppbar: "Pesanan",
      //   heightsizePlus: 10,
      // ),
      appBar: CustomAppbarWithGradientNoBackWidgets(
        heightsizePlus: 10,
        textAppbar: "Pesanan",
      ),
      // body: OrderTabbarWidgets(),
      body: Column(
        children: [
          SizedBox(
            height: 5,
          ),
          Expanded(
            flex: 2,
            child: OrderContainerCountWidgets(),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Divider(),
          ),
          Expanded(
            flex: 13,
            child: OrderTabbarWidgets(),
          ),
        ],
      ),
    );
  }
}
