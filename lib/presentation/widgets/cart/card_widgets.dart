import 'package:bekado/core/constants/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:simple_shadow/simple_shadow.dart';

class CardWidgets extends StatefulWidget {
  const CardWidgets({
    super.key,
    required this.imageURL,
    required this.hargaProduk,
    required this.titleProduk,
  });

  final String? imageURL;
  final String? titleProduk;
  final String? hargaProduk;

  @override
  State<CardWidgets> createState() => _CardWidgetsState();
}

class _CardWidgetsState extends State<CardWidgets> {
  @override
  Widget build(BuildContext context) {
    // final Function(bool?) onSelectChanged;
    bool? isChecked = false;

    return SimpleShadow(
      opacity: 0.7,
      color: Colors.grey,
      // color: Colors.white,
      offset: Offset(1, 1),
      sigma: 2,
      child: Card(
        color: Colors.white,
        margin: EdgeInsets.all(10),
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 7, vertical: 15),
          child: Row(
            children: [
              StatefulBuilder(
                builder: (context, setState) => Checkbox(
                    value: isChecked,
                    onChanged: (value) {
                      setState(() {
                        isChecked = value;
                      });
                    }),
              ),
              // ClipRRect(
              //   borderRadius: BorderRadius.circular(8.0),
              //   child: Image.network(
              //     widget.imageURL!,
              //     height: 75,
              //     width: 75,
              //   ),
              // ),
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8.0.sp),
                  border: Border.all(width: 1.0.sp, color: Colors.black54),
                ),
                child: Image.network(
                  widget.imageURL!,
                  fit: BoxFit.cover,
                  height: 75,
                  width: 75,
                ),
              ),
              SizedBox(
                width: 10,
              ),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Text(
                      widget.titleProduk!,
                      // maxLines: 3,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    // SizedBox(
                    //   height: 10,
                    // ),
                    Text(
                      widget.hargaProduk!,
                      style: TextStyle(
                          color: PrimaryColorBlue,
                          fontWeight: FontWeight.bold,
                          fontSize: 18),
                    ),
                  ],
                ),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  IconButton(
                      onPressed: () {},
                      icon: Icon(
                        Icons.delete,
                        size: 25,
                      ),
                      alignment: Alignment.topLeft),
                  SizedBox(
                    height: 10,
                  ),
                  Row(
                    // mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Container(
                        width: 26,
                        height: 26,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            color: PrimaryColorBlue),
                        child: Center(
                          child: IconButton(
                            onPressed: () {},
                            icon: Icon(
                              Icons.remove,
                              color: Colors.white,
                              size: 13,
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        width: 5,
                      ),
                      Text("1"),
                      SizedBox(
                        width: 5,
                      ),
                      Container(
                        alignment: Alignment.center,
                        width: 26,
                        height: 26,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            color: PrimaryColorBlue),
                        child: Align(
                          alignment: Alignment.center,
                          child: IconButton(
                            onPressed: () {},
                            icon: Icon(
                              Icons.add,
                              color: Colors.white,
                              size: 13,
                            ),
                          ),
                        ),
                      ),
                    ],
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
