import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:moniepoint_test/utils/colors.dart';
import 'package:moniepoint_test/utils/dimension.dart';

class QuickSelectOption extends StatelessWidget {
  final String optionName;

  final IconData quickselectIcon;

  const QuickSelectOption({
    super.key,
    required this.optionName,
    required this.quickselectIcon,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          height: getProportionateMobileHeight(40),
          width: getProportionateMobileHeight(40),
          decoration: BoxDecoration(
            color: backgroundLightGray,
            borderRadius: BorderRadius.circular(cardBorderRadiusSm),
          ),
          child: Center(
            child: Icon(quickselectIcon),
          ),
        ),
        VerticalSpacingMobile(heightValue: getProportionateMobileHeight(10)),
        Text(
          optionName,
          style: GoogleFonts.poppins(
              color: textGray,
              fontSize: getProportionateMobileHeight(11),
              fontWeight: FontWeight.w400),
        )
      ],
    );
  }
}
