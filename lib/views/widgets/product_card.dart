
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:moniepoint_test/utils/colors.dart';
import 'package:moniepoint_test/utils/dimension.dart';
import 'package:moniepoint_test/views/product_detail_screen.dart';

class ProductCard extends StatelessWidget {
  const ProductCard({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
        onTap: () => Navigator.push(
              context,
              PageRouteBuilder(
                transitionDuration: const Duration(milliseconds: 300),
                pageBuilder: (context, animation, secondaryAnimation) {
                  return const ProductDetailScreen();
                },
                transitionsBuilder:
                    (context, animation, secondaryAnimation, child) {
                  return SlideTransition(
                    position: Tween<Offset>(
                      begin: const Offset(1.0, 0.0),
                      end: Offset.zero,
                    ).animate(animation),
                    child: child,
                  );
                },
              ),
            ),
        child: InkResponse(
            splashColor: Colors.red,
            highlightColor: Colors.black,
            containedInkWell: false,
            child: Container(
              height: getProportionateMobileHeight(150),
              width: getProportionateMobileHeight(200),
              decoration: BoxDecoration(
                  color: Colors.transparent,
                  borderRadius: BorderRadius.circular(cardBorderRadiusSm)),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Stack(
                    children: [
                      Container(
                        height: getProportionateMobileHeight(130),
                        decoration: const BoxDecoration(
                          color: backgroundLightGray,
                          image: DecorationImage(
                            image: AssetImage(
                              'assets/pngs/shirt1.png',
                            ),
                            fit: BoxFit.contain,
                          ),
                        ),
                      ),
                      Positioned(
                          right: getProportionateMobileHeight(5),
                          top: getProportionateMobileHeight(0),
                          child: const Icon(
                            Icons.favorite_border_rounded,
                            color: primaryColor,
                          ))
                    ],
                  ),
                  Padding(
                    padding: EdgeInsets.all(getProportionateMobileHeight(6)),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Shirt',
                          style: GoogleFonts.poppins(
                              color: accentColor,
                              fontSize: getProportionateMobileHeight(11),
                              fontWeight: FontWeight.w400),
                        ),
                        VerticalSpacingMobile(
                            heightValue: getProportionateMobileHeight(2)),
                        Text(
                          'Essentials Men\'s Short-\nSleeve Crewneck T-Shirt',
                          style: GoogleFonts.poppins(
                              color: primaryColor,
                              fontSize: getProportionateMobileHeight(11.5),
                              fontWeight: FontWeight.w500),
                        ),
                        VerticalSpacingMobile(
                            heightValue: getProportionateMobileHeight(5)),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            SizedBox(
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Icon(
                                    Icons.star,
                                    color: const Color(0xFFEAA555),
                                    size: getProportionateMobileHeight(16),
                                  ),
                                  SizedBox(
                                    width: getProportionateMobileHeight(2),
                                  ),
                                  Text(
                                    '4.9',
                                    style: GoogleFonts.poppins(
                                        color: textGray,
                                        fontSize:
                                            getProportionateMobileHeight(11),
                                        fontWeight: FontWeight.w400,
                                        height:
                                            getProportionateMobileHeight(1.9)),
                                  ),
                                  SizedBox(
                                    width: getProportionateMobileHeight(2),
                                  ),
                                  Text(
                                    '|',
                                    style: GoogleFonts.poppins(
                                        color: textGray,
                                        fontSize:
                                            getProportionateMobileHeight(11),
                                        fontWeight: FontWeight.w400,
                                        height:
                                            getProportionateMobileHeight(1.7)),
                                  ),
                                  SizedBox(
                                    width: getProportionateMobileHeight(2),
                                  ),
                                  Text(
                                    '2356',
                                    style: GoogleFonts.poppins(
                                        color: textGray,
                                        fontSize:
                                            getProportionateMobileHeight(11),
                                        fontWeight: FontWeight.w400,
                                        height:
                                            getProportionateMobileHeight(1.9)),
                                  ),
                                ],
                              ),
                            ),
                            Text(
                              '\$12.00',
                              style: GoogleFonts.poppins(
                                  color: accentColor,
                                  fontSize: getProportionateMobileHeight(13),
                                  fontWeight: FontWeight.w500,
                                  height: getProportionateMobileHeight(1.9)),
                            ),
                          ],
                        )
                      ],
                    ),
                  )
                ],
              ),
            )));
  }
}
