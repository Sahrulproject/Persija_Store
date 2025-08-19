import 'package:flutter/material.dart';

class Regist extends StatefulWidget {
  const Regist({super.key});

  @override
  State<Regist> createState() => _RegistState();
}

class _RegistState extends State<Regist> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController nameController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();
  final TextEditingController cityController = TextEditingController();
  @override
  //  controller: emailController,
  // onChanged: (value) {
  //   setState(() {});
  // },
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("")),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Form(
          key: _formKey,
          child: Column(
            spacing: 12,
            children: [
              Text(
                "Form Registration",
                style: TextStyle(fontFamily: 'Anton', fontSize: 24),
              ),
              // Divider(),
              SizedBox(height: 1),
              Row(
                children: [
                  Text(
                    'Nama',
                    style: TextStyle(
                      fontFamily: 'Poppins',
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
              TextFormField(
                controller: nameController,
                keyboardType: TextInputType.name,
                decoration: InputDecoration(
                  hintStyle: const TextStyle(
                    fontSize: 14,
                    fontFamily: 'Poppins',
                  ),
                  hintText: "Enter your name",
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),
                  // filled: true,
                  // fillColor: const Color(0xFFFFFFFF),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'name is required';
                  }

                  // if (!value.contains("@")) {
                  //   return "Email Tidak Valid";
                  // }
                  // if (!RegExp(
                  //   r'^[\w\.-]+@[\w\.-]+\.\w+$',
                  // ).hasMatch(value)) {
                  //   return 'Format email tidak valid';
                  // }
                  return null;
                },
              ),
              SizedBox(height: 2),
              Row(
                children: [
                  Text(
                    'Email',
                    style: TextStyle(
                      fontFamily: 'Poppins',
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
              TextFormField(
                controller: emailController,
                keyboardType: TextInputType.emailAddress,
                decoration: InputDecoration(
                  hintStyle: const TextStyle(
                    fontSize: 14,
                    fontFamily: 'Poppins',
                  ),
                  hintText: "Enter your email",
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),
                  // filled: true,
                  // fillColor: const Color(0xFFFFFFFF),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Email is Required';
                  }

                  if (!value.contains("@")) {
                    return "Invalid Email";
                  }
                  return null;
                },
              ),
              Row(
                children: [
                  Text(
                    'Phone',
                    style: TextStyle(
                      fontFamily: 'Poppins',
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
              // TextFormConst(
              //   hintText: "Enter Your Number",
              //   controller: phoneController,
              //   onChanged: (p0) {
              //     setState(() {});
              //   },
              // ),
              TextFormField(
                controller: cityController,
                keyboardType: TextInputType.name,
                decoration: InputDecoration(
                  hintStyle: const TextStyle(
                    fontSize: 14,
                    fontFamily: 'Poppins',
                  ),
                  hintText: "Enter your Number Phone",
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),
                  // filled: true,
                  // fillColor: const Color(0xFFFFFFFF),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'City was required';
                  }

                  // if (!value.contains("@")) {
                  //   return "Email Tidak Valid";
                  // }
                  // if (!RegExp(
                  //   r'^[\w\.-]+@[\w\.-]+\.\w+$',
                  // ).hasMatch(value)) {
                  //   return 'Format email tidak valid';
                  // }
                  return null;
                },
              ),

              SizedBox(height: 10),

              // Text(
              //   emailController.text,
              //   style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              // ),
              // Text(
              //   phoneController.text,
              //   style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              // ),
              // Text(
              //   nameController.text,
              //   style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              // ),
              // SizedBox(
              //   width: double.infinity,
              //   child: ElevatedButton(
              //     onPressed: () {
              //       if (_formKey.currentState!.validate()) {
              //         // Semua validasi lolos
              //         print('Nama: ${nameController.text}');
              //         print('Email: ${emailController.text}');
              //         print('No Phone: ${phoneController.text}');
              //         print('City: ${cityController.text}');
              //         // Tambahin logic login lo di sini bro12.3875
              //         showDialog(
              //           context: context,
              //           builder: (context) {
              //             return AlertDialog(
              //               title: Column(
              //                 mainAxisSize: MainAxisSize.min,
              //                 children: [
              //                   Lottie.asset(
              //                     "assets/images/animations/Successful.json",
              //                   ),

              //                   Text("Regist Successful!"),
              //                 ],
              //               ),

              //               content: Text(
              //                 "You have successfully Registered!",
              //                 textAlign: TextAlign.center,
              //               ),
              //               actions: [
              //                 SizedBox(
              //                   width: double.infinity,
              //                   child: ElevatedButton(
              //                     onPressed: () {
              //                       // context.push(
              //                       //   Confirm(
              //                       //     name: nameController.text,
              //                       //     city: cityController.text,
              //                       //   ),
              //                       // );
              //                     },
              //                     child: Text(
              //                       "Next",
              //                       style: TextStyle(
              //                         fontFamily: 'Poppins',
              //                         color: Colors.black,
              //                       ),
              //                     ),
              //                   ),
              //                 ),
            ],
          ),
        ),
      ),
    );
  }

  // style: ElevatedButton.styleFrom(
  //   padding: const EdgeInsets.symmetric(vertical: 16),
  //   backgroundColor: const Color.fromARGB(255, 56, 71, 146),
  //   shape: RoundedRectangleBorder(
  //     borderRadius: BorderRadius.circular(12),
  //   ),
  // ),
  // child: const Text(
  //   "Regist",
  //   style: TextStyle(
  //     fontSize: 16,
  //     color: Colors.white,
  //     fontWeight: FontWeight.bold,
  //     fontFamily: 'Poppins',
  //   ),
  // ),
}
