import 'package:flutter/material.dart';
import 'package:moniepoint_test/utils/colors.dart';
import 'package:moniepoint_test/utils/dimension.dart';

class ProductCheckImage extends StatelessWidget {
  final String productImage;

  final bool isViewing;

  const ProductCheckImage({
    super.key,
    required this.productImage,
    required this.isViewing,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: getProportionateMobileHeight(40),
      width: getProportionateMobileHeight(45),
      decoration: BoxDecoration(
        color: backgroundGray,
        borderRadius: BorderRadius.circular(cardBorderRadiusSm),
        border: isViewing
            ? Border.all(
                color: accentColor,
                width: getProportionateMobileHeight(1.4),
              )
            : null,
        image: DecorationImage(
          image: AssetImage(
            'assets/pngs/$productImage.png',
          ),
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}
