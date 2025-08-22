import 'package:flutter/material.dart';
import 'package:flutter_toko_sederhana/extension/navigation.dart';
import 'package:flutter_toko_sederhana/screens/tambah_produk.dart';
import 'package:flutter_toko_sederhana/widgets/chart.dart';

class ProdukModel {
  String name;
  String price;
  int stok;
  String image;

  ProdukModel({
    required this.name,
    required this.price,
    required this.stok,
    required this.image,
  });
}

class ProdukPage extends StatefulWidget {
  const ProdukPage({super.key});

  @override
  State<ProdukPage> createState() => _ProdukPageState();
}

class _ProdukPageState extends State<ProdukPage> {
  final List<ProdukModel> produkList = [
    ProdukModel(
      name: "Jersey Player Issue 25/26",
      price: "Rp999.900",
      stok: 10,
      image: "assets/images/foto/jerseypi.jpg",
    ),
    ProdukModel(
      name: "Jersey Training Persija 25/26",
      price: "Rp299.900",
      stok: 15,
      image: "assets/images/foto/jerseytraining.jpg",
    ),
    ProdukModel(
      name: "Bucket Had Hut 96 Persija",
      price: "Rp249.900",
      stok: 5,
      image: "assets/images/foto/buckethad.png",
    ),
    ProdukModel(
      name: "Windbreaker Tiger Pix",
      price: "Rp599.900",
      stok: 3,
      image: "assets/images/foto/windbreaker.png",
    ),
    ProdukModel(
      name: "Joger Motion Persija",
      price: "Rp499.900",
      stok: 7,
      image: "assets/images/foto/joger.png",
    ),
    ProdukModel(
      name: "Caps Trucker Persija",
      price: "Rp149.900",
      stok: 7,
      image: "assets/images/foto/caps.png",
    ),
  ];

  void tambahProduk(ProdukModel produk) {
    setState(() {
      produkList.add(produk);
    });
  }

  void editProduk(int index, ProdukModel produk) {
    setState(() {
      produkList[index] = produk;
    });
  }

  void hapusProduk(int index) {
    setState(() {
      produkList.removeAt(index);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Padding(
          padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 12),
          child: Image.asset(
            "assets/images/foto/juaragalogo.png",
            width: 40,
            height: 40,
            fit: BoxFit.contain,
          ),
        ),
        title: const Text(
          "Katalog Persija Store",
          style: TextStyle(
            fontFamily: 'NotoSerif',
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
        automaticallyImplyLeading: false,
        backgroundColor: const Color.fromARGB(255, 194, 52, 23),
        centerTitle: true,
        actions: [
          IconButton(
            icon: const Icon(Icons.shopping_cart, color: Colors.white),
            onPressed: () {
              context.push(Chart());
            },
          ),
          const SizedBox(width: 8),
        ],
      ),
      body: ListView.builder(
        padding: const EdgeInsets.all(12),
        itemCount: produkList.length,
        itemBuilder: (context, index) {
          final model = produkList[index];
          return Card(
            child: ListTile(
              leading: Image.asset(
                model.image,
                width: 40,
                height: 40,
                fit: BoxFit.cover,
              ),
              title: Text(model.name),
              subtitle: Text("${model.price} | Stok: ${model.stok}"),
              trailing: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  IconButton(
                    icon: const Icon(Icons.edit, color: Colors.blue),
                    onPressed: () async {
                      final hasil = await Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => FormProduk(produk: model),
                        ),
                      );
                      if (hasil != null) editProduk(index, hasil);
                    },
                  ),
                  IconButton(
                    icon: const Icon(Icons.delete, color: Colors.red),
                    onPressed: () => hapusProduk(index),
                  ),
                ],
              ),
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          final hasil = await Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const FormProduk()),
          );
          if (hasil != null) tambahProduk(hasil);
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
