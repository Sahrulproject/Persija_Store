import 'package:flutter/material.dart';
import 'package:flutter_toko_sederhana/model/product.dart';

class FormProduk extends StatefulWidget {
  final ProdukModel? produk;

  const FormProduk({super.key, this.produk});

  @override
  State<FormProduk> createState() => _FormProdukState();
}

class _FormProdukState extends State<FormProduk> {
  late TextEditingController name;
  late TextEditingController harga;
  late TextEditingController stok;

  @override
  void initState() {
    super.initState();
    name = TextEditingController(text: widget.produk?.name ?? "");
    harga = TextEditingController(text: widget.produk?.price ?? "");
    stok = TextEditingController(text: widget.produk?.stok.toString() ?? "");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.produk == null ? "Tambah Produk" : "Edit Produk"),
        backgroundColor: Colors.green,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            TextField(
              controller: name,
              decoration: const InputDecoration(labelText: "Nama Produk"),
            ),
            TextField(
              controller: harga,
              decoration: const InputDecoration(labelText: "Harga"),
              keyboardType: TextInputType.number,
            ),
            TextField(
              controller: stok,
              decoration: const InputDecoration(labelText: "Stok"),
              keyboardType: TextInputType.number,
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                final hasil = ProdukModel(
                  name: name.text,
                  price: harga.text,
                  stok: int.tryParse(stok.text) ?? 0,
                  image: "assets/images/foto/logo.jpg",
                );
                Navigator.pop(context, hasil);
              },
              child: Text(widget.produk == null ? "Simpan" : "Update"),
            ),
          ],
        ),
      ),
    );
  }
}
