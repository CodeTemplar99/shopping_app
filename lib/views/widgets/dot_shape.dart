import 'package:flutter/material.dart';
import 'package:moniepoint_test/utils/colors.dart';
import 'package:moniepoint_test/utils/dimension.dart';

class DotShape extends StatelessWidget {
  final double dotWidth;

  final double dotHeight;

  final double dotRadius;

  final double dotMarginTop;
  
  final double dotMarginLeft;

  const DotShape({
    super.key,
    required this.dotWidth,
    required this.dotHeight,
    required this.dotRadius,
    required this.dotMarginTop, required this.dotMarginLeft,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: getProportionateMobileHeight(dotWidth),
      height: getProportionateMobileHeight(dotHeight),
      margin: EdgeInsets.only(
        top: getProportionateMobileHeight(
            getProportionateMobileHeight(dotMarginTop)),
            left: getProportionateMobileHeight(dotMarginLeft)
      ),
      decoration: BoxDecoration(
          color: textGray,
          borderRadius:
              BorderRadius.circular(getProportionateMobileHeight(dotRadius))),
    );
  }
}
