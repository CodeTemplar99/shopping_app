import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:moniepoint_test/utils/colors.dart';
import 'package:moniepoint_test/views/dashboard_screen.dart';
import 'package:moniepoint_test/utils/misc.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primaryColor: primaryColor,
        fontFamily: GoogleFonts.poppins().fontFamily,
        primarySwatch: createMaterialColor(primaryColor),
      ),
      home: const DashboardScreen(),
    );
  }
}
