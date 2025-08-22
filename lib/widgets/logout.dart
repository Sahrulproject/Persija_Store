import 'package:flutter/material.dart';
import 'package:flutter_toko_sederhana/extension/navigation.dart';
import 'package:flutter_toko_sederhana/preference/shared_preference.dart';
import 'package:flutter_toko_sederhana/views/login.dart';

class LogOutButton extends StatelessWidget {
  const LogOutButton({super.key});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        PreferenceHandler.removeLogin();
        context.pushReplacementNamed(Login.id);
      },
      child: Text("Keluar"),
    );
  }
}
