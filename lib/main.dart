import 'package:flutter/material.dart';

import 'Screen/Cart.dart';
import 'Screen/DetailPage.dart';
import 'Screen/HomePage.dart';

void main() {
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: {
        '/': (context) => homepage(),
        'Details': (context) => detailpage(),
        'Cart': (context) => cartpage()
      },
    ),
  );
}
