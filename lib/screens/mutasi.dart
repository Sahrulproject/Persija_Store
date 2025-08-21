import 'package:flutter/material.dart';
import 'package:flutter_toko_sederhana/db/db_helper.dart';
import 'package:flutter_toko_sederhana/model/transaksi.dart';

class EditTransaksi extends StatefulWidget {
  static const id = '/edit_transaction_screen';
  final Transaksi transaksi;

  const EditTransaksi({super.key, required this.transaksi});

  @override
  EditTransaksiState createState() => EditTransaksiState();
}

class EditTransaksiState extends State<EditTransaksi> {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  late TextEditingController jumlahController;
  late TextEditingController deskripsiController;

  late String selectedJenis;
  String selectedKategori = ''; // Inisialisasi dengan nilai default
  late DateTime selectedDate;

  List<String> kategoriPemasukan = ['SurPlus', 'Penjualan', 'Retur', 'Lainnya'];
  List<String> kategoriPengeluaran = ['Gaji', 'Sewa', 'Beli Produk', 'Lainnya'];

  @override
  void initState() {
    super.initState();
    selectedJenis = widget.transaksi.jenis;
    selectedKategori = widget.transaksi.kategori; // Pastikan diinisialisasi
    jumlahController = TextEditingController(
      text: widget.transaksi.jumlah.toString(),
    );
    deskripsiController = TextEditingController(
      text: widget.transaksi.deskripsi,
    );
    selectedDate = widget.transaksi.tanggal;
  }

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: selectedDate,
      firstDate: DateTime(2000),
      lastDate: DateTime(2101),
    );
    if (picked != null && picked != selectedDate) {
      setState(() {
        selectedDate = picked;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Edit Transaksi')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: formKey,
          child: ListView(
            children: [
              DropdownButtonFormField<String>(
                value: selectedJenis,
                items: ['Pemasukan', 'Pengeluaran'].map((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(value),
                  );
                }).toList(),
                onChanged: (newValue) {
                  setState(() {
                    selectedJenis = newValue!;
                    // Reset kategori jika jenis berubah dan kategori tidak sesuai
                    if ((selectedJenis == 'Pemasukan' &&
                            !kategoriPemasukan.contains(selectedKategori)) ||
                        (selectedJenis == 'Pengeluaran' &&
                            !kategoriPengeluaran.contains(selectedKategori))) {
                      selectedKategori = '';
                    }
                  });
                },
                decoration: InputDecoration(labelText: 'Jenis Transaksi'),
              ),
              SizedBox(height: 16),
              TextFormField(
                controller: jumlahController,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  labelText: 'Jumlah',
                  prefixText: 'Rp ',
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Masukkan jumlah transaksi';
                  }
                  if (double.tryParse(value) == null) {
                    return 'Masukkan angka yang valid';
                  }
                  return null;
                },
              ),
              SizedBox(height: 16),
              DropdownButtonFormField<String>(
                value: selectedKategori.isNotEmpty ? selectedKategori : null,
                items:
                    (selectedJenis == 'Pemasukan'
                            ? kategoriPemasukan
                            : kategoriPengeluaran)
                        .map((String value) {
                          return DropdownMenuItem<String>(
                            value: value,
                            child: Text(value),
                          );
                        })
                        .toList(),
                onChanged: (newValue) {
                  setState(() {
                    selectedKategori = newValue!;
                  });
                },
                decoration: InputDecoration(labelText: 'Kategori'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Pilih kategori';
                  }
                  return null;
                },
              ),
              SizedBox(height: 16),
              TextFormField(
                controller: deskripsiController,
                decoration: InputDecoration(labelText: 'Deskripsi (opsional)'),
              ),
              SizedBox(height: 16),
              ListTile(
                title: Text('Tanggal'),
                subtitle: Text(
                  '${selectedDate.day}/${selectedDate.month}/${selectedDate.year}',
                ),
                trailing: Icon(Icons.calendar_today),
                onTap: () => _selectDate(context),
              ),
              SizedBox(height: 24),
              ElevatedButton(
                onPressed: () async {
                  if (formKey.currentState!.validate()) {
                    if (selectedKategori.isEmpty) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text('Pilih kategori terlebih dahulu'),
                        ),
                      );
                      return;
                    }

                    Transaksi updatedTransaksi = Transaksi(
                      id: widget.transaksi.id,
                      jenis: selectedJenis,
                      jumlah: double.parse(jumlahController.text),
                      kategori: selectedKategori,
                      deskripsi: deskripsiController.text,
                      tanggal: selectedDate,
                    );

                    await DbHelper.updateTransaksi(updatedTransaksi);
                    Navigator.pop(context);
                  }
                },
                child: Text('Update Transaksi'),
              ),
              SizedBox(height: 16),
              ElevatedButton(
                onPressed: () async {
                  await DbHelper.deleteTransaksi(widget.transaksi.id!);
                  Navigator.pop(context);
                },
                style: ElevatedButton.styleFrom(backgroundColor: Colors.red),
                child: Text(
                  'Hapus Transaksi',
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
