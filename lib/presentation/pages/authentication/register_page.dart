import 'package:bekado/presentation/bloc/authentication/auth_bloc.dart';
import 'package:bekado/presentation/bloc/navigation_bloc.dart';
import 'package:bekado/presentation/widgets/authentification/register/register_form.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class RegisterPage extends StatefulWidget {
  RegisterPage({Key? key}) : super(key: key);

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _passwordConfirmationController =
      TextEditingController();

  void onSignUp() {
    if (_nameController.text.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("Nama tidak boleh kosong!")),
      );

      return;
    }
    if (_phoneController.text.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("Email tidak boleh kosong!")),
      );

      return;
    }
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
    if (_passwordConfirmationController.text.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("Konfirmasi Password tidak boleh kosong!")),
      );

      return;
    }

    context.read<AuthBloc>().add(SignUpEvent(
          name: _nameController.text,
          phone: _phoneController.text,
          email: _emailController.text,
          password: _passwordController.text,
          profilePic: '',
        ));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              BlocListener<AuthBloc, AuthState>(
                listener: (context, state) {
                  if (state is SignUpSuccess) {
                    Navigator.pop(context);
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text("Berhasil membuat akun")),
                    );
                    Navigator.pushReplacement(context,
                        MaterialPageRoute(builder: (_) => BottomMainNavbar()));
                  } else if (state is SignUpLoading) {
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
                  } else if (state is SignUpFailure) {
                    Navigator.pop(context);
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text(state.error)),
                    );
                  }
                },
                child: RegisterForm(
                  nameController: _nameController,
                  phoneController: _phoneController,
                  emailController: _emailController,
                  passwordController: _passwordController,
                  passwordConfirmationController:
                      _passwordConfirmationController,
                  onPressRegister: () {
                    onSignUp();
                  },
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
