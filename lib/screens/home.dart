import 'package:flutter/material.dart';
import 'package:flutter_toko_sederhana/screens/body.dart';
import 'package:iconsax/iconsax.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(appBar: buildAppBar(), body: Body());
  }

  AppBar buildAppBar() {
    return AppBar(
      backgroundColor: Colors.white,
      elevation: 0,
      leading: IconButton(icon: Icon(Iconsax.user4), onPressed: () {}),
      actions: <Widget>[
        IconButton(
          icon: Image.asset(
            "assets/images/foto/search.png",
            width: 25,
            // color: kTextColor,
          ),
          onPressed: () {},
        ),
        IconButton(
          icon: Image.asset("assets/images/foto/shopping-cart.png", width: 25),
          onPressed: () {},
        ),
      ],
    );
  }
}
