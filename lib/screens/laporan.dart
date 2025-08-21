import 'package:flutter/material.dart';
import 'package:flutter_toko_sederhana/db/db_helper.dart';
import 'package:flutter_toko_sederhana/main.dart';
import 'package:flutter_toko_sederhana/model/transaksi.dart';
import 'package:flutter_toko_sederhana/screens/keuangan.dart';
import 'package:flutter_toko_sederhana/screens/mutasi.dart';

class Report extends StatefulWidget {
  static const id = '/report_transaction_screen';

  const Report({super.key});

  @override
  _ReportState createState() => _ReportState();
}

class _ReportState extends State<Report> {
  List<Transaksi> transaksiList = [];
  double totalPemasukan = 0;
  double totalPengeluaran = 0;
  double saldo = 0;

  @override
  void initState() {
    super.initState();
    _loadReportData();
  }

  Future<void> _loadReportData() async {
    final allTransaksi = await DbHelper.getAllTransaksi();

    double pemasukan = 0;
    double pengeluaran = 0;

    for (var transaksi in allTransaksi) {
      if (transaksi.jenis == 'Pemasukan') {
        pemasukan += transaksi.jumlah;
      } else {
        pengeluaran += transaksi.jumlah;
      }
    }

    setState(() {
      transaksiList = allTransaksi;
      totalPemasukan = pemasukan;
      totalPengeluaran = pengeluaran;
      saldo = pemasukan - pengeluaran;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Laporan Keuangan',
          style: TextStyle(fontFamily: 'Poppins', fontWeight: FontWeight.bold),
        ),
        automaticallyImplyLeading: false,
        centerTitle: true,
        actions: [
          IconButton(icon: Icon(Icons.refresh), onPressed: _loadReportData),
        ],
      ),

      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            // Card Saldo
            Card(
              elevation: 4,
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  children: [
                    Text(
                      'Saldo saat ini',
                      style: TextStyle(
                        fontSize: 18,
                        fontFamily: 'Poppins',
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      formatCurrency(saldo),
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
            ),

            SizedBox(height: 16),

            // Card Pemasukan dan Pengeluaran
            Row(
              children: [
                Expanded(
                  child: Card(
                    color: Colors.green[50],
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Column(
                        children: [
                          Text(
                            'Pemasukan',
                            style: TextStyle(
                              color: Colors.green,
                              fontFamily: 'Poppins',
                              fontWeight: FontWeight.bold,
                              fontSize: 18,
                            ),
                          ),
                          Text(
                            formatCurrency(totalPemasukan),
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: Card(
                    color: Colors.red[50],
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Column(
                        children: [
                          Text(
                            'Pengeluaran',
                            style: TextStyle(
                              color: Colors.red,
                              fontFamily: 'Poppins',
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Text(
                            formatCurrency(totalPengeluaran),
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),

            SizedBox(height: 16),
            Divider(),
            SizedBox(height: 12),

            // Header Daftar Transaksi
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Daftar Transaksi',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    fontFamily: 'Poppins',
                  ),
                ),
                // ElevatedButton(
                //   onPressed: _loadReportData,
                //   style: ElevatedButton.styleFrom(
                //     backgroundColor: Colors.blue,
                //     foregroundColor: Colors.white,
                //   ),
                //   child: Text('Refresh'),
                // ),
              ],
            ),

            SizedBox(height: 16),

            // Daftar Transaksi
            Expanded(
              child: transaksiList.isEmpty
                  ? Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.receipt_long,
                            size: 64,
                            color: Colors.grey,
                          ),
                          SizedBox(height: 16),
                          Text(
                            'Belum ada transaksi',
                            style: TextStyle(
                              color: Colors.grey[600],
                              fontSize: 16,
                            ),
                          ),
                          Text(
                            'Tekan tombol + untuk menambah transaksi',
                            style: TextStyle(color: Colors.grey[500]),
                            textAlign: TextAlign.center,
                          ),
                        ],
                      ),
                    )
                  : ListView.builder(
                      itemCount: transaksiList.length,
                      itemBuilder: (context, index) {
                        final transaksi = transaksiList[index];
                        return _buildTransactionItem(transaksi);
                      },
                    ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          await Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => TambahKeuangan()),
          );
          // Refresh data setelah kembali dari tambah transaksi
          _loadReportData();
        },
        child: Icon(Icons.add),
      ),
    );
  }

  Widget _buildTransactionItem(Transaksi transaksi) {
    return Card(
      margin: EdgeInsets.symmetric(vertical: 4, horizontal: 0),
      child: ListTile(
        leading: Icon(
          transaksi.jenis == 'Pemasukan'
              ? Icons.arrow_downward
              : Icons.arrow_upward,
          color: transaksi.jenis == 'Pemasukan' ? Colors.green : Colors.red,
        ),
        title: Text(
          transaksi.deskripsi.isNotEmpty
              ? transaksi.deskripsi
              : transaksi.kategori,
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        subtitle: Text(
          '${transaksi.tanggal.day}/${transaksi.tanggal.month}/${transaksi.tanggal.year}',
        ),
        trailing: Text(
          formatCurrency(transaksi.jumlah),
          style: TextStyle(
            color: transaksi.jenis == 'Pemasukan' ? Colors.green : Colors.red,
            fontWeight: FontWeight.bold,
            fontSize: 15,
          ),
        ),
        onTap: () async {
          await Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => EditTransaksi(transaksi: transaksi),
            ),
          );
          // Refresh data setelah kembali dari edit transaksi
          _loadReportData();
        },
      ),
    );
  }
}
