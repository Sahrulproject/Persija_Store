import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HalamanState();
}

class _HalamanState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Hallo, jak !",
          style: TextStyle(
            fontFamily: 'Poppins',
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),

        automaticallyImplyLeading: false,
      ),

      // drawer: MyDrawer(),
      body: Container(
        height: double.infinity,
        width: double.infinity,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/images/background.jpg"),
            fit: BoxFit.cover,
          ),
        ),

        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,

            children: [
              SizedBox(height: 50),
              Image.asset(
                'assets/images/foto/persijalogo.png',
                fit: BoxFit.cover,
                width: 120,
                height: 130,
              ),
              const SizedBox(height: 20),
              const Text(
                "Welcome to Persija Store!",
                style: TextStyle(
                  fontSize: 30,
                  fontFamily: 'NotoSerif',
                  fontWeight: FontWeight.bold,
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 10),
              const Text(
                "Come on shopping at Persija Store, support products original merchandise.",
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 30),
              // ElevatedButton(
              //   onPressed: () {
              //     // contoh ke halaman lain
              //     Navigator.push(
              //       context,
              //       MaterialPageRoute(builder: (context) => const Cekbox()),
              //     );
              //   },
              //   child: const Text("Lihat Drawer"),
              // ),
              // InkWell(
              //   onTap: () {
              //     Navigator.pushReplacement(
              //       context,
              //       MaterialPageRoute(builder: (context) => const Cekbox()),
              //     );
              //   },
              //   child: const Text(
              //     'Go to CheckBox',
              //     style: TextStyle(fontSize: 18),
              //   ),
              // ),
            ],
          ),
        ),
      ),
    );
  }
}
