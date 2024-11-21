import 'package:flutter/material.dart';
import 'package:pool/widgets/expenses.dart';

var kColorScheme =
    ColorScheme.fromSeed(seedColor: const Color.fromARGB(255, 96, 59, 181));
void main() {
  runApp(
    MaterialApp(
      theme: ThemeData().copyWith(
        colorScheme: kColorScheme,
        cardTheme: CardTheme().copyWith(
          color: Colors.white,
          margin: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        ),
      ),
      debugShowCheckedModeBanner: false,
      home: Expenses(),
    ),
  );
}
