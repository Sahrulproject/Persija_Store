// import 'package:flutter/material.dart';

// class Body extends StatelessWidget {
//   const Body({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Column(
//       crossAxisAlignment: CrossAxisAlignment.start,
//       children: <Widget>[
//         Padding(
//           padding: const EdgeInsets.all(10.0),
//           child: Text("Store", style: TextStyle(fontSize: 30)),
//         ),
//         Categories(),
//       ],
//     );
//   }
// }

// class Categories extends StatefulWidget {
//   const Categories({super.key});

//   @override
//   State<Categories> createState() => _CategoriesState();
// }

// class _CategoriesState extends State<Categories> {
//   List<String> categories = ["Carrier", "Tenda", "Sleeping Bag", "P3K"];
//   int selectedIndex = 0;
//   @override
//   Widget build(BuildContext context) {
//     return SizedBox(
//       height: 25,
//       child: ListView.builder(
//         scrollDirection: Axis.horizontal,
//         itemCount: categories.length,
//         itemBuilder: (context, index) => Text(categories[index]),
//       ),
//     );
//   }
// }
