import 'package:flutter/material.dart';

import '../../../../common/widget/sign_in_user_btn.dart';

class ForgotAuth extends StatelessWidget {
  const ForgotAuth({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: WillPopScope(
        onWillPop: (() async {
          return false;
        }),
        child: const Column(
          children: <Widget>[
            SizedBox(height: 60),
            _ForgotForm(),
            // BlocConsumer<LoginAuthBloc, LoginAuthState>(
            //   listener: (context, state) {
            //     if (state is UseLoginCredentialError) {
            //       showErrorSnackbar(
            //         context,
            //         state.failure.message,
            //       );
            //       return;
            //     }
            //     if (state is UseLoginError) {
            //       showErrorSnackbar(
            //         context,
            //         state.failure.message,
            //       );
            //       return;
            //     }
            //     if (state is UseLoginSuccess) {
            //       showSuccessSnackbar(
            //         context,
            //         "Log masuk berjaya!",
            //       );
            //       Navigator.of(context).pushReplacementNamed(NavRoute.Root);
            //     }
            //   },
            //   builder: (context, state) {
            //     if (state is UseLoginLoading) {
            //       return Stack(
            //         alignment: Alignment.center,
            //         children: [
            //           const _LoginForm(),
            //           Container(
            //             alignment: Alignment.center,
            //             height: MediaQuery.of(context).size.height / 2.3,
            //             width: MediaQuery.of(context).size.width,
            //             color: const Color.fromARGB(150, 245, 245, 245),
            //             child: const Center(
            //               child: CircularProgressIndicator(),
            //             ),
            //           ),
            //         ],
            //       );
            //     }
            //     return const _LoginForm();
            //   },
            // ),
          ],
        ),
      ),
    );
  }
}

class _ForgotForm extends StatefulWidget {
  const _ForgotForm({Key? key}) : super(key: key);

  @override
  _ForgotFormState createState() => _ForgotFormState();
}

class _ForgotFormState extends State<_ForgotForm> {
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
    return SingleChildScrollView(
      child: Form(
        key: _loginFormKey,
        autovalidateMode: AutovalidateMode.onUserInteraction,
        child: SizedBox(
          width: MediaQuery.of(context).size.width * 0.4,
          child: Column(
            children: [
              Text(
                "Lupa kata Laluan",
                style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.w500,
                  color: Colors.blue.shade900,
                ),
              ),
              const Text(
                "Log masuk untuk meneruskan",
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w400,
                  color: Colors.grey,
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
                    return 'Sila masukkan email anda';
                  }
                  return null;
                },
                controller: _passwordController,
                decoration: const InputDecoration(
                  prefixIcon: Icon(Icons.lock),
                  border: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: Color.fromARGB(255, 213, 213, 213),
                    ),
                  ),
                  hintText: 'Email',
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              const Align(
                alignment: Alignment.centerRight,
                child: Text(
                  "Kembali",
                  textAlign: TextAlign.start,
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                    color: Colors.grey,
                  ),
                ),
              ),
              const SizedBox(
                height: 100,
              ),
              SignInUserBtn(
                onPressed: () {
                  if (_loginFormKey.currentState!.validate()) {
                    // BlocProvider.of<LoginAuthBloc>(context).add(
                    //   AuthenticateAuthorize(
                    //     username: _usernameController.text,
                    //     password: _passwordController.text,
                    //   ),
                    // );
                  }
                },
              ),
              // const IconBtnGrey(title: 'Kembali'),
            ],
          ),
        ),
      ),
    );
  }
}
