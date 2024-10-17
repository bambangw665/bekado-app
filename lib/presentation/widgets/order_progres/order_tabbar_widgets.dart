import 'package:bekado/core/constants/app_colors.dart';
import 'package:bekado/presentation/widgets/order_progres/order_complite_Tab_widgets.dart';
import 'package:bekado/presentation/widgets/order_progres/order_inprogres_widget.dart';
import 'package:flutter/material.dart';

class OrderTabbarWidgets extends StatefulWidget {
  const OrderTabbarWidgets({super.key});

  @override
  State<OrderTabbarWidgets> createState() => _OrderTabbarWidgetsState();
}

class _OrderTabbarWidgetsState extends State<OrderTabbarWidgets>
    with TickerProviderStateMixin {
  TabController? _controller;

  @override
  void initState() {
    super.initState();
    _controller = TabController(length: 2, vsync: this);
  }

  @override
  void dispose() {
    super.dispose();
    _controller!.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: BackgourdColorGrey,
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(60.0),
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(50), topRight: Radius.circular(50)),
          ),
          padding: EdgeInsets.only(
            top: 20,
            left: 20,
            right: 20,
          ),
          height: 100,
          child: TabBar(
            dividerColor: Colors.transparent,
            indicatorSize: TabBarIndicatorSize.tab,
            // indicator: ShapeDecoration(
            //   shape: RoundedRectangleBorder(
            //     borderRadius: BorderRadius.circular(10),
            //   ),
            //   color: PrimaryColorBlue,
            // ),
            indicator: CustomTabIndicator(),
            labelColor: Colors.white,
            unselectedLabelColor: Colors.black45,
            controller: _controller,
            tabs: [
              Tab(
                child: Text(
                  "Dalam Proses",
                  style: TextStyle(
                    // color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 15,
                  ),
                ),
              ),
              Tab(
                child: Text(
                  "Pesanan Selesai",
                  style: TextStyle(
                    // color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 15,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
      body: TabBarView(
        controller: _controller,
        children: [
          InProgressOrdersTab(),
          CompletedOrdersTab(),
        ],
      ),
    );
  }
}

class EmptyStateIllustration extends StatelessWidget {
  final String message;

  const EmptyStateIllustration({Key? key, required this.message})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(
            "assets/images/Empty_pesanna_ilustration.png", // Pastikan untuk menambahkan gambar ini ke assets
            width: 200,
            height: 200,
          ),
          SizedBox(height: 20),
          Text(
            message,
            style: TextStyle(fontSize: 18, color: Colors.grey[600]),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}

class CustomTabIndicator extends Decoration {
  @override
  BoxPainter createBoxPainter([VoidCallback? onChanged]) {
    return _CustomPainter();
  }
}

class _CustomPainter extends BoxPainter {
  @override
  void paint(Canvas canvas, Offset offset, ImageConfiguration configuration) {
    final Rect rect = offset & configuration.size!;
    final Paint paint = Paint();
    paint.color = PrimaryColorBlue;
    paint.style = PaintingStyle.fill;
    canvas.drawRRect(
      RRect.fromRectAndRadius(rect, Radius.circular(8.0)),
      paint,
    );
  }
}
