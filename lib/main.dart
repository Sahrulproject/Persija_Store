import 'package:flutter/material.dart';
import 'package:flutter_toko_sederhana/model/transaksi.dart';
import 'package:flutter_toko_sederhana/screens/mutasi.dart';
import 'package:flutter_toko_sederhana/views/bottom.dart';
import 'package:flutter_toko_sederhana/views/login.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:intl/intl.dart';

String formatCurrency(double amount) {
  final format = NumberFormat.currency(
    locale: 'id_ID',
    symbol: 'Rp ',
    decimalDigits: 0,
  );
  return format.format(amount);
}

void main() {
  initializeDateFormatting("id_ID");
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color.fromARGB(255, 3, 3, 3),
        ),
      ),
      initialRoute: Login.id,
      routes: {
        '/login': (context) => Login(),
        Bottom.id: (context) => Bottom(),
        '/edit_transaction_screen': (context) {
          final transaksi =
              ModalRoute.of(context)!.settings.arguments as Transaksi;
          return EditTransaksi(transaksi: transaksi);
        },
      },

      // home: Login(),
    );
    // Navigator.pushNamed(context, '/Tugas6');
    // return MaterialApp(
    //   initialRoute: '/',
    //   routes: {
    //     '/': (context) => Tugas6(),
    //     '/Tugastes': (context) => Tugastes(),
    //   },
    // );
  }
}
