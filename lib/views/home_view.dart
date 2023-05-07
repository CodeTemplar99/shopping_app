import 'dart:async';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:moniepoint_test/utils/colors.dart';
import 'package:moniepoint_test/utils/dimension.dart';
import 'package:moniepoint_test/views/widgets/dot_shape.dart';
import 'package:moniepoint_test/views/widgets/product_card.dart';
import 'package:moniepoint_test/views/widgets/quick_select_option.dart';
import 'package:moniepoint_test/views/widgets/slide_element.dart';

class HomeView extends StatefulWidget {
  final ScrollController scrollController;
  final bool shouldBlockScroll;
  const HomeView({
    super.key,
    required this.scrollController,
    required this.shouldBlockScroll,
  });

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  late PageController _slidePageController;
  late Timer _timer;
  int _slideCurrentPage = 0;

  @override
  void initState() {
    super.initState();
    _slidePageController = PageController(initialPage: _slideCurrentPage);
    _startSlideshow();
  }

  @override
  void dispose() {
    _slidePageController.dispose();
    _timer.cancel();
    super.dispose();
  }

  // image slideshow
  void _startSlideshow() {
    const Duration slideDuration = Duration(seconds: 3);
    _timer = Timer.periodic(slideDuration, (Timer timer) {
      _slideCurrentPage = (_slideCurrentPage + 1) % 3;
      _slidePageController.animateToPage(
        _slideCurrentPage,
        duration: const Duration(milliseconds: 500),
        curve: Curves.easeInOut,
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final itemWidth = screenWidth / 2;

    return SingleChildScrollView(
      controller: widget.scrollController,
      child: NotificationListener<ScrollUpdateNotification>(
        onNotification: (notification) {
          if (widget.shouldBlockScroll) {
            return true;
          }
          return false;
        },
        child: Column(
          children: [
            Container(
              height: getProportionateMobileHeight(215),
              width: double.infinity,
              decoration: const BoxDecoration(color: backgroundGray),
              child: PageView(
                controller: _slidePageController,
                onPageChanged: (int page) {
                  setState(() {
                    _slideCurrentPage = page;
                  });
                },
                children: const [
                  SlideElement(
                    promoCategory: '#BEAUTYSALE',
                    slideColor: slide1Color,
                    promoImage: 'beauty',
                    promoOffer: 'DISCOVER OUR\nBEAUTY SELECTION',
                    promoOfferSize: 15,
                    hasPromoText: false,
                  ),
                  SlideElement(
                    promoCategory: '#FASHION DAY',
                    slideColor: backgroundLightGray,
                    promoImage: 'clothes',
                    promoOffer: '80% OFF',
                    promoOfferSize: 30,
                    hasPromoText: true,
                  )
                ],
              ),
            ),
            VerticalSpacingMobile(
                heightValue: getProportionateMobileHeight(20)),
            Padding(
              padding: EdgeInsets.symmetric(
                  horizontal: getProportionateMobileHeight(15)),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: const [
                      QuickSelectOption(
                        optionName: 'Category',
                        quickselectIcon: Icons.apps_rounded,
                      ),
                      QuickSelectOption(
                        optionName: 'Flight',
                        quickselectIcon: Icons.flight,
                      ),
                      QuickSelectOption(
                        optionName: 'Bill',
                        quickselectIcon: Icons.payments_rounded,
                      ),
                      QuickSelectOption(
                        optionName: 'Data plan',
                        quickselectIcon: Icons.network_check_rounded,
                      ),
                      QuickSelectOption(
                        optionName: 'Top Up',
                        quickselectIcon: Icons.phone_android_rounded,
                      ),
                    ],
                  ),
                  VerticalSpacingMobile(
                      heightValue: getProportionateMobileHeight(30)),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        width: getProportionateMobileHeight(10),
                        height: getProportionateMobileHeight(2.4),
                        decoration: BoxDecoration(
                            color: primaryColor,
                            borderRadius: BorderRadius.circular(
                                getProportionateMobileHeight(3))),
                      ),
                      const DotShape(
                        dotWidth: 3,
                        dotHeight: 3,
                        dotRadius: 3,
                        dotMarginTop: 0,
                        dotMarginLeft: 3,
                      ),
                      const DotShape(
                        dotWidth: 3,
                        dotHeight: 3,
                        dotRadius: 3,
                        dotMarginTop: 0,
                        dotMarginLeft: 3,
                      ),
                    ],
                  ),
                  VerticalSpacingMobile(
                      heightValue: getProportionateMobileHeight(25)),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Best Sale Product',
                        style: GoogleFonts.poppins(
                            color: primaryColor,
                            fontSize: getProportionateMobileHeight(16),
                            fontWeight: FontWeight.w400),
                      ),
                      Text(
                        'See more',
                        style: GoogleFonts.poppins(
                            color: accentColor,
                            fontSize: getProportionateMobileHeight(11),
                            fontWeight: FontWeight.w400),
                      )
                    ],
                  ),
                  VerticalSpacingMobile(
                      heightValue: getProportionateMobileHeight(10)),
                  GridView.builder(
                    shrinkWrap: true,
                    itemCount: 8,
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: (screenWidth ~/ itemWidth).toInt(),
                      mainAxisSpacing: getProportionateMobileHeight(25),
                      crossAxisSpacing: getProportionateMobileWidth(15),
                      childAspectRatio: getProportionateMobileHeight(0.6),
                    ),
                    itemBuilder: (context, index) => const ProductCard(),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
