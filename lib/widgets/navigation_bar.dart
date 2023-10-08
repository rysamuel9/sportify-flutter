// import 'package:flutter/material.dart';
// import 'package:curved_navigation_bar/curved_navigation_bar.dart';

// class CustomBottomNavigationBar extends StatelessWidget {
//   final int currentIndex;
//   final Function(int) onTap;

//   const CustomBottomNavigationBar(
//       {Key? key, required this.currentIndex, required this.onTap})
//       : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return CurvedNavigationBar(
//       index: currentIndex,
//       backgroundColor: Colors.transparent,
//       color: Colors.blue,
//       buttonBackgroundColor: Colors.blue,
//       height: 50,
//       items: <Widget>[
//         const Icon(Icons.home, size: 30, color: Colors.white),
//         InkWell(
//           onTap: () => onTap(1),
//           child: const Icon(
//             Icons.qr_code,
//             size: 30,
//             color: Colors.white,
//           ),
//         ),
//         const Icon(Icons.person, size: 30, color: Colors.white),
//       ],
//       onTap: onTap,
//     );
//   }
// }
