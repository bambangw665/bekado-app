import 'package:bekado/presentation/bloc/authentication/auth_bloc.dart';
import 'package:bekado/presentation/bloc/navigation_bloc.dart';
import 'package:bekado/presentation/widgets/authentification/login/login_form_widgets.dart';
import 'package:bekado/presentation/widgets/authentification/login/logo_center_widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../widgets/authentification/login/login_googleLogin_widgets.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  void onSignIn() {
    if (_emailController.text.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("Email tidak boleh kosong!")),
      );

      return;
    }
    if (_passwordController.text.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("Password tidak boleh kosong!")),
      );

      return;
    }

    context.read<AuthBloc>().add(SignInEvent(
        email: _emailController.text, password: _passwordController.text));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(
                height: 30.sp,
              ),
              Logo_center(),
              BlocListener<AuthBloc, AuthState>(
                listener: (context, state) {
                  if (state is AuthSuccess) {
                    Navigator.pop(context);
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text("Berhasil login")),
                    );
                    Navigator.pushReplacement(context,
                        MaterialPageRoute(builder: (_) => BottomMainNavbar()));
                  } else if (state is AuthLoading) {
                    showDialog(
                      context: context,
                      barrierDismissible: false,
                      builder: (context) => Dialog(
                        backgroundColor: Colors.grey.withOpacity(0.8),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                        insetPadding: const EdgeInsets.symmetric(
                          horizontal: 130,
                        ),
                        child: const AspectRatio(
                          aspectRatio: 1,
                          child: Center(
                            child:
                                CircularProgressIndicator(color: Colors.blue),
                          ),
                        ),
                      ),
                    );
                  } else if (state is AuthFailure) {
                    Navigator.pop(context);
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text(state.error)),
                    );
                  }
                },
                child: LoginForm(
                  emailController: _emailController,
                  passwordController: _passwordController,
                  onPressLogin: () {
                    onSignIn();
                  },
                ),
              ),
              BtnGooleSignIn(),
            ],
          ),
        ),
      ),
    );
  }
}
