import 'package:flutter/material.dart';
import 'package:moniepoint_test/utils/colors.dart';
import 'package:moniepoint_test/utils/dimension.dart';

class ComingSoonScreen extends StatelessWidget {
  const ComingSoonScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Text(
          'Coming Soon',
          style: TextStyle(
            fontSize: getProportionateMobileHeight(16),
            color: primaryColor,
          ),
        ),
      ),
    );
  }
}
