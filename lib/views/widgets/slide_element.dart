import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:moniepoint_test/utils/colors.dart';
import 'package:moniepoint_test/utils/dimension.dart';

class SlideElement extends StatelessWidget {
  final String promoCategory;
  final String promoImage;

  final Color slideColor;

  final String promoOffer;

  final double promoOfferSize;

  final bool hasPromoText;

  const SlideElement({
    super.key,
    required this.promoCategory,
    required this.promoImage,
    required this.slideColor,
    required this.promoOffer,
    required this.promoOfferSize,
    required this.hasPromoText,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(left: getProportionateMobileHeight(10)),
      decoration: BoxDecoration(color: slideColor),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                promoCategory,
                style: GoogleFonts.poppins(
                  color: primaryColor,
                  fontSize: getProportionateMobileHeight(12),
                  fontWeight: FontWeight.w600,
                ),
              ),
              Text(
                promoOffer,
                style: GoogleFonts.poppins(
                  color: primaryColor,
                  fontSize: getProportionateMobileHeight(promoOfferSize),
                  fontWeight: FontWeight.w600,
                ),
              ),
              SizedBox(
                child: hasPromoText
                    ? Text(
                        '',
                        style: GoogleFonts.poppins(
                          color: primaryColor,
                          fontSize: getProportionateMobileHeight(9),
                          fontWeight: FontWeight.w500,
                        ),
                      )
                    : null,
              ),
              VerticalSpacingMobile(
                  heightValue: getProportionateMobileHeight(15)),
              ElevatedButton(
                style: const ButtonStyle(
                  elevation: MaterialStatePropertyAll(0),
                ),
                onPressed: () {},
                child: const Center(
                  child: Text('Check this out'),
                ),
              )
            ],
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Image.asset(
              'assets/pngs/$promoImage.png',
              height: getProportionateMobileHeight(180),
            ),
          ),
        ],
      ),
    );
  }
}
