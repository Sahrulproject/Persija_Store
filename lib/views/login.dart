import 'package:flutter/material.dart';
import 'package:flutter_toko_sederhana/extension/navigation.dart';
import 'package:flutter_toko_sederhana/views/bottom.dart';
import 'package:flutter_toko_sederhana/views/regist.dart';

// import 'package:ppkd_batch_3/extension/navigation.dart';

class Login extends StatefulWidget {
  const Login({super.key});
  static const id = "/login";
  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final _formKey = GlobalKey<FormState>();

  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  bool _isObscure = true;

  login() async {
    final email = _emailController.text.trim();
    final password = _passwordController.text.trim();

    if (email.isEmpty || password.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("Email, Password, Phone cannot be empty")),
      );
      return;
    }
    // final userData = await DbHelper.loginUser(email, password, phone);
    // if (userData != null) {
    //   PreferenceHandler.setLogin(true);
    //   context.pushReplacementNamed(BotNav1.id);
    // } else {
    //   ScaffoldMessenger.of(context).showSnackBar(
    //     const SnackBar(content: Text("Incorrect email or password")),
    //   );
    // }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: double.infinity,
        width: double.infinity,

        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/images/foto/back.jpg"),

            fit: BoxFit.cover,
          ),
        ),
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 60),
        child: Form(
          key: _formKey,
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Image.asset(
                  "assets/images/foto/logo.jpg",
                  width: 400,
                  height: 250,
                  fit: BoxFit.cover,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(height: 10),
                    TextFormField(
                      controller: _emailController,
                      keyboardType: TextInputType.emailAddress,
                      decoration: InputDecoration(
                        hintStyle: const TextStyle(
                          fontSize: 14,
                          fontFamily: 'Poppins',
                        ),
                        hintText: "Enter your email",
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(30),
                          borderSide: BorderSide.none,
                        ),
                        filled: true,
                        fillColor: const Color(0xFFFFFFFF),
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Email wajib diisi';
                        }

                        if (!value.contains("@")) {
                          return "Email Tidak Valid";
                        }
                        return null;
                      },
                    ),
                  ],
                ),

                const SizedBox(height: 5),

                // PASSWORD
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(height: 5),
                    TextFormField(
                      controller: _passwordController,
                      obscureText: _isObscure,
                      decoration: InputDecoration(
                        hintStyle: const TextStyle(
                          fontFamily: 'Poppins',
                          fontSize: 14,
                        ),
                        hintText: "Enter your password",
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(30),
                          borderSide: BorderSide.none,
                        ),
                        filled: true,
                        fillColor: const Color(0xFFFFFFFF),
                        suffixIcon: IconButton(
                          icon: Icon(
                            _isObscure
                                ? Icons.visibility_off
                                : Icons.visibility,
                          ),
                          onPressed: () {
                            setState(() {
                              _isObscure = !_isObscure;
                            });
                          },
                        ),
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Password wajib diisi';
                        }
                        if (value.length < 6) {
                          return 'Password minimal 6 karakter';
                        }
                        return null;
                      },
                    ),
                  ],
                ),

                Align(
                  alignment: Alignment.centerRight,
                  child: TextButton(
                    onPressed: () {},
                    child: const Text(
                      "Forgot Password?",
                      style: TextStyle(
                        color: Color.fromARGB(255, 0, 74, 248),
                        fontFamily: 'Poppins',
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                ),

                const SizedBox(height: 3),

                // Tombol LOGIN
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () {
                      login();

                      if (_formKey.currentState!.validate()) {
                        // Semua validasi lolos
                        print('Email: ${_emailController.text}');
                        print('Password: ${_passwordController.text}');
                        showDialog(
                          context: context,
                          builder: (context) {
                            return AlertDialog(
                              // title: Column(
                              //   mainAxisSize: MainAxisSize.min,
                              //   children: [
                              //     Lottie.asset(
                              //       "assets/images/animations/Successful.json",
                              //     ),

                              //     Text("Login Berhasil!"),
                              //   ],
                              // ),
                              content: Text(
                                "Anda Berhasil Login!",
                                textAlign: TextAlign.center,
                              ),
                              actions: [
                                TextButton(
                                  child: Text("DONE"),
                                  onPressed: () {
                                    Navigator.pushReplacement(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) => Bottom(),
                                      ),
                                    );
                                  },
                                ),
                              ],
                            );
                          },
                        );
                      }
                    },
                    style: ElevatedButton.styleFrom(
                      padding: const EdgeInsets.symmetric(vertical: 16),
                      backgroundColor: const Color.fromARGB(255, 0, 76, 255),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                    child: const Text(
                      "Login",
                      style: TextStyle(
                        fontSize: 16,
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontFamily: 'Poppins',
                      ),
                    ),
                  ),
                ),

                const SizedBox(height: 30),

                // Divider dan Google Button
                const Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    // Expanded(child: Divider()),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 8.0),
                      child: Text(
                        "Or Sign In With",
                        style: TextStyle(
                          fontFamily: 'Poppins',
                          color: Color.fromARGB(246, 0, 0, 0),
                        ),
                      ),
                    ),
                    // Expanded(child: Divider()),
                  ],
                ),
                const SizedBox(height: 26),

                SizedBox(
                  width: double.infinity,
                  child: OutlinedButton(
                    onPressed: () {},
                    style: OutlinedButton.styleFrom(
                      backgroundColor: Colors.white,
                      padding: const EdgeInsets.symmetric(vertical: 16),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30),
                      ),
                      side: const BorderSide(color: Color(0xFFDDDDDD)),
                    ),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image.asset(
                          'assets/images/foto/google_icon.jpg',
                          width: 20,
                          height: 20,
                        ),
                        const SizedBox(width: 5),
                        const Text(
                          "Google",
                          style: TextStyle(
                            fontFamily: 'Poppins',
                            fontSize: 14,
                            color: Color(0xFF222222),
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),

                const SizedBox(height: 150),
                // Spacer(),

                // Sign Up
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      "Don't have an account? ",
                      style: TextStyle(
                        fontFamily: 'Poppins',
                        letterSpacing: -0.5,
                        color: Color.fromARGB(255, 0, 0, 0),
                      ),
                    ),
                    // SizedBox(width: 0),
                    TextButton(
                      child: const Text(
                        "Sign Up",
                        style: TextStyle(
                          color: Color.fromARGB(255, 57, 90, 255),
                          fontWeight: FontWeight.bold,
                          fontFamily: 'Poppins',
                          fontSize: 12,
                        ),
                      ),
                      onPressed: () {
                        context.push(Regist());
                      },
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
