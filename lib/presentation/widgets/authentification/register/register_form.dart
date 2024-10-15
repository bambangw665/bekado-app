import 'package:bekado/core/constants/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../core/constants/app_images.dart';

class RegisterForm extends StatelessWidget {
  final TextEditingController nameController;
  final TextEditingController phoneController;
  final TextEditingController emailController;
  final TextEditingController passwordController;
  final TextEditingController passwordConfirmationController;
  final Function onPressRegister;

  const RegisterForm(
      {Key? key,
      required this.nameController,
      required this.phoneController,
      required this.emailController,
      required this.passwordController,
      required this.passwordConfirmationController,
      required this.onPressRegister})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 20.0),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10.r),
          color: Colors.white,
        ),
        padding: EdgeInsets.symmetric(vertical: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
                child: SvgPicture.asset(
              image_register,
              height: 180.sp,
            )),
            SizedBox(
              height: 20.sp,
            ),
            Text(
              "Nama",
              style: TextStyle(
                  fontSize: 12.sp,
                  color: Colors.black,
                  fontWeight: FontWeight.w500),
            ),
            SizedBox(
              height: 4.sp,
            ),
            TextField(
              controller: nameController,
              maxLength: 30,
              decoration: InputDecoration(
                floatingLabelBehavior: FloatingLabelBehavior.never,
                isDense: true,
                focusColor: Colors.blue,
                border: OutlineInputBorder(),
                labelText: 'Nama anda',
                labelStyle: TextStyle(
                  fontSize: 13.sp,
                ),
              ),
            ),
            Text(
              "No Telepon",
              style: TextStyle(
                  fontSize: 13,
                  color: Colors.black,
                  fontWeight: FontWeight.w500),
            ),
            SizedBox(
              height: 4.sp,
            ),
            TextField(
              controller: phoneController,
              keyboardType: TextInputType.phone,
              decoration: InputDecoration(
                  floatingLabelBehavior: FloatingLabelBehavior.never,
                  isDense: true,
                  focusColor: Colors.blue,
                  border: OutlineInputBorder(),
                  labelText: 'Nomor telepon',
                  labelStyle: TextStyle(
                    fontSize: 12.sp,
                  )),
            ),
            SizedBox(
              height: 15.sp,
            ),
            Text(
              "Email",
              style: TextStyle(
                  fontSize: 12.sp,
                  color: Colors.black,
                  fontWeight: FontWeight.w500),
            ),
            SizedBox(
              height: 4.sp,
            ),
            TextField(
              controller: emailController,
              keyboardType: TextInputType.emailAddress,
              decoration: InputDecoration(
                  floatingLabelBehavior: FloatingLabelBehavior.never,
                  isDense: true,
                  focusColor: Colors.blue,
                  border: OutlineInputBorder(),
                  labelText: 'Email',
                  labelStyle: TextStyle(
                    fontSize: 12.sp,
                  )),
            ),
            SizedBox(
              height: 15.sp,
            ),
            Text(
              "Password",
              style: TextStyle(
                  fontSize: 12.sp,
                  color: Colors.black,
                  fontWeight: FontWeight.w500),
            ),
            SizedBox(
              height: 4.sp,
            ),
            TextField(
              controller: passwordController,
              obscureText: true,
              decoration: InputDecoration(
                  floatingLabelBehavior: FloatingLabelBehavior.never,
                  isDense: true,
                  focusColor: Colors.blue,
                  border: OutlineInputBorder(),
                  labelText: 'Password',
                  labelStyle: TextStyle(
                    fontSize: 12.sp,
                  )),
            ),
            SizedBox(
              height: 15,
            ),
            Text(
              "Konfirmasi Password",
              style: TextStyle(
                  fontSize: 12.sp,
                  color: Colors.black,
                  fontWeight: FontWeight.w500),
            ),
            SizedBox(
              height: 4.sp,
            ),
            TextField(
              controller: passwordConfirmationController,
              obscureText: true,
              decoration: InputDecoration(
                  floatingLabelBehavior: FloatingLabelBehavior.never,
                  isDense: true,
                  focusColor: Colors.blue,
                  border: OutlineInputBorder(),
                  labelText: 'Konfirmasi Password',
                  labelStyle: TextStyle(
                    fontSize: 12.sp,
                  )),
            ),
            SizedBox(
              height: 20.sp,
            ),
            SizedBox(
              height: 50.sp,
              width: double.infinity,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                    backgroundColor: PrimaryColorBlue,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30.0),
                    )),
                onPressed: () {
                  onPressRegister();
                },
                child: Text("Register",
                    style: TextStyle(fontSize: 14, color: Colors.white)),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
