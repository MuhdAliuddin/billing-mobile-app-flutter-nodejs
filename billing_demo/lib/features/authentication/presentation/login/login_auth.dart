import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'dart:math' as math;
import 'dart:ui' as ui;

import '../../../../common/widget/show_snackbar.dart';
import '../../../../routes_path.dart';
import 'bloc/login_auth_bloc.dart';

class MyPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..shader = ui.Gradient.linear(
        const Offset(60, 60),
        const Offset(80, 800),
        [
          const Color.fromARGB(255, 87, 189, 90),
          const Color.fromARGB(255, 18, 117, 21),
        ],
      );
    // ..style = PaintingStyle.stroke;
    final arcRect = Rect.fromCircle(
      center: size.bottomCenter(Offset.zero),
      radius: 400,
    );
    canvas.drawArc(arcRect, 0, -math.pi * 2, false, paint);
  }

  @override
  bool shouldRepaint(MyPainter oldDelegate) => false;
}

class MyArc extends StatelessWidget {
  final double diameter;

  const MyArc({required this.diameter, super.key});

  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      painter: MyPainter(),
      size: Size(diameter, diameter),
    );
  }
}

class LoginAuth extends StatelessWidget {
  const LoginAuth({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SingleChildScrollView(
        child: BlocListener<LoginAuthBloc, LoginAuthState>(
          listener: (context, state) {
            if (state is UseLoginCredentialError) {
              showErrorSnackbar(
                context,
                state.failure.message,
              );
              return;
            }
            if (state is UseLoginError) {
              showErrorSnackbar(
                context,
                state.failure.message,
              );
              return;
            }
            if (state is UseLoginSuccess) {
              showSuccessSnackbar(
                context,
                "Log masuk berjaya!",
              );
              Navigator.of(context).pushReplacementNamed(NavRoute.Root);
            }
          },
          child: Stack(
            children: [
              Positioned(
                top: 0,
                left: 0,
                right: 0,
                bottom: 0,
                child: Padding(
                  padding: const EdgeInsets.all(0),
                  child: CustomPaint(
                    painter: MyPainter(),
                    child: const AspectRatio(
                      aspectRatio: 2,
                      child: SizedBox(),
                    ),
                  ),
                ),
              ),
              const Center(
                child: _LoginForm(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _LoginForm extends StatefulWidget {
  const _LoginForm({Key? key}) : super(key: key);

  @override
  _LoginFormState createState() => _LoginFormState();
}

class _LoginFormState extends State<_LoginForm> {
  final controller = TextEditingController();
  final _loginFormKey = GlobalKey<FormState>();

  late TextEditingController _usernameController;
  late TextEditingController _passwordController;

  @override
  void initState() {
    super.initState();
    _usernameController = TextEditingController();
    _passwordController = TextEditingController();
  }

  @override
  void dispose() {
    _usernameController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<LoginAuthBloc, LoginAuthState>(
      listener: (context, state) {
        if (state is UseLoginSuccess) {
          _usernameController.clear();
          _passwordController.clear();
        }
        if (state is UseLoginCredentialError) {
          showErrorSnackbar(context, state.failure.message);
        }
      },
      builder: (contex, state) {
        if (state is UseLoginSuccess) {
          return Container();
        }
        return Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Form(
              key: _loginFormKey,
              autovalidateMode: AutovalidateMode.onUserInteraction,
              child: SizedBox(
                width: MediaQuery.of(context).size.width * 0.8,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const SizedBox(
                      height: 150,
                    ),
                    const Text(
                      "Selamat Datang",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w500,
                        color: Colors.white,
                      ),
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    TextFormField(
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Sila masukkan katanama anda';
                        }
                        return null;
                      },
                      controller: _usernameController,
                      decoration: const InputDecoration(
                        filled: true,
                        fillColor: Colors.white,
                        prefixIcon: Icon(Icons.person),
                        border: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: Color.fromARGB(255, 213, 213, 213),
                          ),
                        ),
                        hintText: 'Username',
                      ),
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    TextFormField(
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Sila masukkan katalaluan anda';
                        }
                        return null;
                      },
                      controller: _passwordController,
                      decoration: const InputDecoration(
                        filled: true,
                        fillColor: Colors.white,
                        prefixIcon: Icon(Icons.lock),
                        border: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: Color.fromARGB(255, 213, 213, 213),
                          ),
                        ),
                        hintText: 'Password',
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        fixedSize: Size(
                          MediaQuery.of(context).size.width * 0.6,
                          40,
                        ),
                        backgroundColor: const Color.fromARGB(255, 6, 90, 158),
                      ),
                      onPressed: () {
                        if (_loginFormKey.currentState!.validate()) {
                          BlocProvider.of<LoginAuthBloc>(context).add(
                            AuthenticateAuthorize(
                              username: _usernameController.text,
                              password: _passwordController.text,
                            ),
                          );
                        }
                      },
                      child: const Text(
                        "Login",
                        style: TextStyle(fontSize: 16),
                      ),
                    ),
                    // const IconBtnGrey(title: 'Kembali'),
                  ],
                ),
              ),
            ),
          ],
        );
      },
    );
  }
}
