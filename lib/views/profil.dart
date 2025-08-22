import 'package:flutter/material.dart';
import 'package:flutter_toko_sederhana/extension/navigation.dart';
import 'package:flutter_toko_sederhana/preference/shared_preference.dart';
import 'package:flutter_toko_sederhana/views/login.dart';

class Profil extends StatelessWidget {
  const Profil({super.key});

  // Fungsi untuk menampilkan dialog konfirmasi logout
  void _showLogoutDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text("Confrimed Logout"),
          content: const Text("Are you sure logout Applications?"),
          actions: <Widget>[
            TextButton(
              child: const Text("Cancel"),
              onPressed: () {
                Navigator.of(context).pop(); // Tutup dialog
              },
            ),
            TextButton(
              child: const Text("Yes", style: TextStyle(color: Colors.red)),
              onPressed: () {
                Navigator.of(context).pop(); // Tutup dialog
                PreferenceHandler.removeLogin();
                context.pushReplacementNamed(Login.id);
              },
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "PROFILE",
          style: TextStyle(
            fontFamily: "Poppins",
            fontSize: 27,
            color: Color.fromARGB(255, 255, 255, 255),
          ),
        ),
        automaticallyImplyLeading: false,
        centerTitle: true,
        actions: [
          IconButton(
            icon: const Icon(Icons.logout, color: Colors.white),
            onPressed: () {
              _showLogoutDialog(context); // Panggil fungsi dialog langsung
            },
          ),
          const SizedBox(width: 8),
        ],
        backgroundColor: Color.fromARGB(255, 194, 52, 23),
      ),

      body: Container(
        width: double.infinity,
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/images/foto/newback.png"),
            fit: BoxFit.cover,
          ),
        ),
        child: SafeArea(
          child: SingleChildScrollView(
            child: Column(
              children: [
                const SizedBox(height: 30),
                const CircleAvatar(
                  radius: 70,
                  backgroundImage: AssetImage('assets/images/foto/dvlp.png'),
                ),
                const SizedBox(height: 10),
                const Text(
                  'Develop',
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: Color.fromARGB(255, 255, 255, 255),
                    fontFamily: 'Oswald',
                  ),
                ),
                const SizedBox(height: 20),

                // Email
                Container(
                  margin: const EdgeInsets.symmetric(
                    horizontal: 20,
                    vertical: 8,
                  ),
                  padding: const EdgeInsets.symmetric(
                    horizontal: 16,
                    vertical: 12,
                  ),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(30),
                    color: Color.fromARGB(255, 194, 52, 23),
                  ),
                  child: Row(
                    children: const [
                      Icon(Icons.email, color: Colors.white),
                      SizedBox(width: 10),
                      Spacer(),
                      Text(
                        'ayopelatihanppkdmprog@ppkdjp.com',
                        style: TextStyle(
                          color: Colors.white,
                          fontFamily: 'Poppins',
                        ),
                      ),
                    ],
                  ),
                ),

                Container(
                  margin: const EdgeInsets.symmetric(
                    horizontal: 20,
                    vertical: 8,
                  ),
                  padding: const EdgeInsets.symmetric(
                    horizontal: 16,
                    vertical: 12,
                  ),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(30),
                    color: Color.fromARGB(255, 194, 52, 23),
                  ),
                  child: Row(
                    children: const [
                      Icon(Icons.phone, color: Colors.white),
                      SizedBox(width: 10),
                      Spacer(),
                      Text(
                        '(021) 7893456',
                        style: TextStyle(
                          color: Colors.white,
                          fontFamily: 'Poppins',
                        ),
                      ),
                    ],
                  ),
                ),

                Row(
                  children: [
                    Expanded(
                      child: Container(
                        margin: const EdgeInsets.all(10),
                        padding: const EdgeInsets.all(40),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color: Color.fromARGB(255, 194, 52, 23),
                        ),
                        child: const Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Icon(Icons.post_add, color: Colors.white, size: 30),
                            SizedBox(height: 8),
                            Text(
                              'Postingan',
                              style: TextStyle(
                                color: Colors.white,
                                fontFamily: 'Poppins',
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Expanded(
                      child: Container(
                        margin: const EdgeInsets.all(20),
                        padding: const EdgeInsets.all(40),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color: Color.fromARGB(255, 194, 52, 23),
                        ),
                        child: const Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Icon(Icons.people, color: Colors.white, size: 30),
                            SizedBox(height: 8),
                            Text(
                              'Followers',
                              style: TextStyle(
                                color: Colors.white,
                                fontFamily: 'Poppins',
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),

                const SizedBox(height: 30),

                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 16.0),
                  child: Text(
                    'Halo! Selamat datang, kami menyediakan beberapa kebutuhan produk Persija',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontFamily: 'Oswald',
                    ),
                  ),
                ),

                const SizedBox(height: 40),

                Container(
                  padding: const EdgeInsets.all(10),
                  width: double.infinity,
                  color: Color.fromARGB(255, 194, 52, 23),
                  child: const Center(
                    child: Text(
                      'PERSIJA STORE',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
