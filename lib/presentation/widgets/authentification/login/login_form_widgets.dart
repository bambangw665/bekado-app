import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../core/constants/app_colors.dart';
import '../forgot_password/forgot_password_page.dart';

class LoginForm extends StatefulWidget {
  final TextEditingController emailController;
  final TextEditingController passwordController;
  final Function onPressLogin;

  const LoginForm(
      {Key? key,
      required this.emailController,
      required this.passwordController,
      required this.onPressLogin})
      : super(key: key);

  @override
  State<LoginForm> createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  // const LoginForm({super.key});

  bool _isPassowrdVisibility = false;

  // final TextEditingController _emailController = TextEditingController();

  // final TextEditingController _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 25.0, vertical: 10.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Email",
            style: TextStyle(
                fontSize: 16.sp,
                color: Colors.black,
                fontWeight: FontWeight.w500),
          ),
          SizedBox(
            height: 6.sp,
          ),
          TextFormField(
            controller: widget.emailController,
            decoration: InputDecoration(
              floatingLabelBehavior: FloatingLabelBehavior.never,
              prefixIcon: Icon(
                Icons.person,
                color: PrimaryColorBlue,
              ),
              isDense: true,
              focusColor: Colors.blue,
              border: OutlineInputBorder(),
              labelText: "masukan email",
              labelStyle: TextStyle(
                fontSize: 12.sp,
              ),
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Text(
            "Password",
            style: TextStyle(
                fontSize: 16.sp,
                color: Colors.black,
                fontWeight: FontWeight.w500),
          ),
          SizedBox(
            height: 6.sp,
          ),
          TextFormField(
            controller: widget.passwordController,
            obscureText: !_isPassowrdVisibility,
            decoration: InputDecoration(
              floatingLabelBehavior: FloatingLabelBehavior.never,
              prefixIcon: Icon(
                Icons.lock,
                color: PrimaryColorBlue,
              ),
              isDense: true,
              focusColor: Colors.blue,
              border: OutlineInputBorder(),
              labelText: "Password",
              labelStyle: TextStyle(
                fontSize: 12.sp,
              ),
              // function show password
              suffixIcon: IconButton(
                icon: Icon(_isPassowrdVisibility
                    ? Icons.visibility
                    : Icons.visibility_off),
                onPressed: () {
                  setState(() {
                    _isPassowrdVisibility = !_isPassowrdVisibility;
                  });
                },
              ),
            ),
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Tolong masukan password';
              }
            },
          ),
          Align(
            alignment: Alignment.topRight,
            child: TextButton(
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (_) => ForgotPasswordPage()));
                },
                child: Text(
                  "Lupa Password",
                  textAlign: TextAlign.end,
                  style: TextStyle(color: Colors.grey[500], fontSize: 12.sp),
                )),
          ),
          SizedBox(
            width: double.infinity,
            height: 50,
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                  backgroundColor: PrimaryColorBlue,
                  foregroundColor: Colors.blue[900],
                  shadowColor: Colors.transparent,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30.0))),
              onPressed: () {
                widget.onPressLogin();
              },
              child: Text(
                "Masuk",
                style: TextStyle(color: Colors.white),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
