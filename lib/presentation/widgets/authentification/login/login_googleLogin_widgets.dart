import 'package:bekado/core/constants/app_images.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../pages/authentication/register_page.dart';

class BtnGooleSignIn extends StatelessWidget {
  const BtnGooleSignIn({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 40.0, vertical: 15.0),
      child: Container(
        child: Column(
          children: [
            Text(
              "Atau Masuk Dengan",
              style: TextStyle(fontSize: 12, fontWeight: FontWeight.w500),
            ),
            SizedBox(
              height: 10.sp,
            ),
            SizedBox(
              height: 50.sp,
              width: double.infinity,
              child: Center(
                child: Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(300.0),
                      border: Border.all(color: Colors.grey)),
                  child: TextButton(
                      style: ButtonStyle(),
                      onPressed: () {
                        //onpress google sign in
                      },
                      child: Image.asset(image_google_logo)),
                ),
              ),
            ),
            SizedBox(
              height: 10.sp,
            ),
            SizedBox(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    "Belum Punya Akun",
                    style: TextStyle(fontSize: 12.sp),
                  ),
                  TextButton(
                      onPressed: () {
                        Navigator.push(context,
                            MaterialPageRoute(builder: (_) => RegisterPage()));
                      },
                      child: Text(
                        "Daftar Sekaang",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                        ),
                      ))
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
