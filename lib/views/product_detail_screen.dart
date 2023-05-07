import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:moniepoint_test/utils/colors.dart';
import 'package:moniepoint_test/utils/dimension.dart';
import 'package:moniepoint_test/views/widgets/dot_shape.dart';
import 'package:moniepoint_test/views/widgets/icon_with_widget.dart';
import 'package:moniepoint_test/views/widgets/product_check_image.dart';

class ProductDetailScreen extends StatefulWidget {
  const ProductDetailScreen({super.key});

  @override
  State<ProductDetailScreen> createState() => _ProductDetailScreenState();
}

class _ProductDetailScreenState extends State<ProductDetailScreen>
    with TickerProviderStateMixin {
  late TabController _tabController;
  bool isFavorite = false;

  late AnimationController _animationController;
  late Animation<double> _animation1;
  late Animation<double> _animation2;
  late Animation<double> _animation3;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);

    _animationController = AnimationController(
      duration: const Duration(milliseconds: 1200),
      vsync: this,
    );

    _animation1 = Tween<double>(begin: 15.0, end: 0.0).animate(CurvedAnimation(
      parent: _animationController,
      curve: const Interval(0.2, 0.3),
    ));

    _animation2 = Tween<double>(begin: 25.0, end: 1.0).animate(CurvedAnimation(
      parent: _animationController,
      curve: const Interval(0.3, 0.6),
    ));

    _animation3 = Tween<double>(begin: 35.0, end: 1.0).animate(CurvedAnimation(
      parent: _animationController,
      curve: const Interval(0.3, 1.0),
    ));

    _animationController.forward();
  }

  @override
  void dispose() {
    _tabController.dispose();
    _animationController.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: scaffoldColor,
      appBar: AppBar(
        systemOverlayStyle: const SystemUiOverlayStyle(
          statusBarIconBrightness: Brightness.dark,
          statusBarBrightness: Brightness.light,
        ),
        backgroundColor: Colors.transparent,
        elevation: 0,
        automaticallyImplyLeading: true,
        leading: GestureDetector(
          onTap: () => Navigator.pop(context),
          child: const Icon(
            Icons.arrow_back_ios_rounded,
            color: primaryColor,
          ),
        ),
        actions: [
          Row(
            children: [
              GestureDetector(
                onTap: () => setState(() {
                  isFavorite = !isFavorite;
                }),
                child: isFavorite
                    ? Icon(
                        Icons.favorite,
                        size: getProportionateMobileHeight(25),
                        color: notificationbadgeColor,
                      )
                    : Icon(
                        Icons.favorite_border_rounded,
                        size: getProportionateMobileHeight(25),
                        color: primaryColor,
                      ),
              ),
              SizedBox(width: getProportionateMobileHeight(15)),
              Icon(
                Icons.share_outlined,
                size: getProportionateMobileHeight(25),
                color: primaryColor,
              ),
              SizedBox(width: getProportionateMobileHeight(15)),
              const IconWithBadge(
                iconName: Icons.shopping_bag_outlined,
                notificationCount: '1',
              ),
              SizedBox(width: getProportionateMobileHeight(20)),
            ],
          ),
        ],
      ),
      body: Stack(
        clipBehavior: Clip.none,
        children: [
          SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.symmetric(
                horizontal: getProportionateMobileHeight(15),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  VerticalSpacingMobile(
                      heightValue: getProportionateMobileHeight(20)),
                  AnimatedBuilder(
                    animation: _animationController,
                    builder: (context, child) => Padding(
                      padding: EdgeInsets.only(top: _animation3.value),
                      child: Stack(
                        children: [
                          Container(
                            height: getProportionateMobileHeight(350),
                            width: double.infinity,
                            decoration: BoxDecoration(
                              color: backgroundLightGray,
                              borderRadius:
                                  BorderRadius.circular(cardBorderRadiusLg),
                              image: const DecorationImage(
                                image: AssetImage(
                                  'assets/pngs/shirt1.png',
                                ),
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                          Positioned(
                            left: getProportionateMobileHeight(20),
                            top: getProportionateMobileHeight(20),
                            child: SizedBox(
                              height: getProportionateMobileHeight(190),
                              width: getProportionateMobileHeight(50),
                              child: Column(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: const [
                                  ProductCheckImage(
                                    productImage: 'shirt1',
                                    isViewing: true,
                                  ),
                                  ProductCheckImage(
                                    productImage: 'shirt2',
                                    isViewing: false,
                                  ),
                                  ProductCheckImage(
                                    productImage: 'shirt3',
                                    isViewing: false,
                                  ),
                                  ProductCheckImage(
                                    productImage: 'shirt2',
                                    isViewing: false,
                                  ),
                                ],
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                  VerticalSpacingMobile(
                      heightValue: getProportionateMobileHeight(20)),
                  AnimatedBuilder(
                    animation: _animationController,
                    builder: (context, child) => Padding(
                      padding: EdgeInsets.only(
                        top: _animation2.value,
                      ),
                      child: Row(
                        children: [
                          Icon(
                            Icons.storefront_outlined,
                            size: getProportionateMobileHeight(18),
                            color: textGray,
                          ),
                          SizedBox(
                            width: getProportionateMobileHeight(2),
                          ),
                          Text(
                            'Tokobaju.id',
                            style: TextStyle(
                                color: textGray,
                                fontSize: getProportionateMobileHeight(12)),
                          )
                        ],
                      ),
                    ),
                  ),
                  VerticalSpacingMobile(
                      heightValue: getProportionateMobileHeight(10)),
                  AnimatedBuilder(
                    animation: _animationController,
                    builder: (BuildContext context, Widget? child) {
                      return Padding(
                        padding: EdgeInsets.only(top: _animation1.value),
                        child: Text(
                          'Essentials Men\'s Short-Sleeve\nCrewneck T-Shirt',
                          style: GoogleFonts.poppins(
                              color: primaryColor,
                              fontSize: getProportionateMobileHeight(17),
                              fontWeight: FontWeight.w600),
                        ),
                      );
                    },
                  ),
                  VerticalSpacingMobile(
                      heightValue: getProportionateMobileHeight(5)),
                  AnimatedBuilder(
                    animation: _animationController,
                    builder: (context, child) => Padding(
                      padding: EdgeInsets.only(top: _animation2.value),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.center,
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
                                  '4.9 Ratings',
                                  style: GoogleFonts.poppins(
                                      color: textGray,
                                      fontSize:
                                          getProportionateMobileHeight(13),
                                      fontWeight: FontWeight.w500,
                                      height:
                                          getProportionateMobileHeight(1.9)),
                                ),
                              ],
                            ),
                          ),
                          const DotShape(
                            dotWidth: 5,
                            dotHeight: 5,
                            dotRadius: 50,
                            dotMarginTop: 4,
                            dotMarginLeft: 0,
                          ),
                          SizedBox(
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                SizedBox(
                                  width: getProportionateMobileHeight(2),
                                ),
                                Text(
                                  '2.3k+ Reviews',
                                  style: GoogleFonts.poppins(
                                      color: textGray,
                                      fontSize:
                                          getProportionateMobileHeight(13),
                                      fontWeight: FontWeight.w500,
                                      height:
                                          getProportionateMobileHeight(1.9)),
                                ),
                              ],
                            ),
                          ),
                          const DotShape(
                            dotWidth: 5,
                            dotHeight: 5,
                            dotRadius: 50,
                            dotMarginTop: 4,
                            dotMarginLeft: 0,
                          ),
                          SizedBox(
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                SizedBox(
                                  width: getProportionateMobileHeight(2),
                                ),
                                Text(
                                  '2.9k+ Sold',
                                  style: GoogleFonts.poppins(
                                      color: textGray,
                                      fontSize:
                                          getProportionateMobileHeight(13),
                                      fontWeight: FontWeight.w500,
                                      height:
                                          getProportionateMobileHeight(1.9)),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  VerticalSpacingMobile(
                      heightValue: getProportionateMobileHeight(10)),
                  Stack(clipBehavior: Clip.none, children: [
                    Container(
                      height: getProportionateMobileHeight(42),
                      decoration: BoxDecoration(
                          border: Border(
                              bottom: BorderSide(
                                  color: backgroundGray,
                                  width: getProportionateMobileHeight(2)))),
                    ),
                    Positioned(
                      // bottom: getProportionateMobileHeight(0),
                      child: TabBar(
                        controller: _tabController,
                        labelStyle: GoogleFonts.poppins(
                          color: accentColor,
                          fontSize: getProportionateMobileHeight(13),
                          fontWeight: FontWeight.w500,
                        ),
                        unselectedLabelStyle: GoogleFonts.poppins(
                          color: primaryColor,
                          fontSize: getProportionateMobileHeight(13),
                          fontWeight: FontWeight.w500,
                        ),
                        labelColor: textGray,
                        indicatorColor: accentColor,
                        tabs: const [
                          Align(
                              alignment: Alignment.centerLeft,
                              child: Tab(text: 'About Item')),
                          Align(
                              alignment: Alignment.centerLeft,
                              child: Tab(text: 'Reviews')),
                        ],
                      ),
                    )
                  ]),
                  SizedBox(
                    height: getProportionateMobileHeight(50),
                    width: getProportionateMobileHeight(400),
                    child: TabBarView(
                      controller: _tabController,
                      children: [
                        // Content for Tab 1
                        Center(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              RichText(
                                text: TextSpan(children: [
                                  TextSpan(
                                    text: 'Brand: ',
                                    style: GoogleFonts.poppins(
                                        color: textGray,
                                        fontSize:
                                            getProportionateMobileHeight(13),
                                        fontWeight: FontWeight.w400,
                                        height:
                                            getProportionateMobileHeight(1.9)),
                                  ),
                                  TextSpan(
                                    text: 'ChArnKpR',
                                    style: GoogleFonts.poppins(
                                        color: primaryColor,
                                        fontSize:
                                            getProportionateMobileHeight(13),
                                        fontWeight: FontWeight.w500,
                                        height:
                                            getProportionateMobileHeight(1.9)),
                                  ),
                                ]),
                              ),
                              SizedBox(
                                width: getProportionateMobileHeight(150),
                                child: Center(
                                  child: RichText(
                                    text: TextSpan(children: [
                                      TextSpan(
                                        text: 'Color: ',
                                        style: GoogleFonts.poppins(
                                            color: textGray,
                                            fontSize:
                                                getProportionateMobileHeight(
                                                    13),
                                            fontWeight: FontWeight.w400,
                                            height:
                                                getProportionateMobileHeight(
                                                    1.9)),
                                      ),
                                      TextSpan(
                                        text: 'ApriKot',
                                        style: GoogleFonts.poppins(
                                            color: primaryColor,
                                            fontSize:
                                                getProportionateMobileHeight(
                                                    13),
                                            fontWeight: FontWeight.w500,
                                            height:
                                                getProportionateMobileHeight(
                                                    1.9)),
                                      ),
                                    ]),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        // Content for Tab 2
                        Center(
                          child: Text(
                            'No reviews for this product yet',
                            style: GoogleFonts.poppins(
                                color: primaryColor,
                                fontSize: getProportionateMobileHeight(13),
                                fontWeight: FontWeight.w500,
                                height: getProportionateMobileHeight(1.9)),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
          Positioned(
            bottom: -125,
            child: Container(
              color: Colors.white,
              height: getProportionateMobileHeight(115),
              width: MediaQuery.of(context).size.width,
              padding: EdgeInsets.only(
                left: getProportionateMobileHeight(15),
                right: getProportionateMobileHeight(15),
                top: getProportionateMobileHeight(15),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Total Price',
                          style: GoogleFonts.poppins(
                            color: textGray,
                            fontSize: getProportionateMobileHeight(11),
                            fontWeight: FontWeight.w400,
                          )),
                      Text('\$18.00',
                          style: GoogleFonts.poppins(
                            color: accentColor,
                            fontSize: getProportionateMobileHeight(24),
                            fontWeight: FontWeight.w500,
                          )),
                    ],
                  ),
                  Align(
                    alignment: Alignment.topCenter,
                    child: Container(
                      height: getProportionateMobileHeight(50),
                      decoration: BoxDecoration(
                          color: Colors.red,
                          borderRadius:
                              BorderRadius.circular(cardBorderRadiusLg)),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            width: getProportionateMobileHeight(70),
                            decoration: BoxDecoration(
                              color: accentColor,
                              borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(
                                    getProportionateMobileHeight(5)),
                                bottomLeft: Radius.circular(
                                  getProportionateMobileHeight(5),
                                ),
                              ),
                            ),
                            child: Center(
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Icon(
                                    Icons.shopping_bag_outlined,
                                    color: Colors.white,
                                    size: getProportionateMobileHeight(23),
                                  ),
                                  SizedBox(
                                    width: getProportionateMobileHeight(10),
                                  ),
                                  Text(
                                    '1',
                                    style: GoogleFonts.poppins(
                                        color: Colors.white,
                                        fontSize:
                                            getProportionateMobileHeight(14),
                                        fontWeight: FontWeight.w600,
                                        height:
                                            getProportionateMobileHeight(1.9)),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          Container(
                            width: getProportionateMobileHeight(110),
                            decoration: BoxDecoration(
                              color: primaryColor,
                              borderRadius: BorderRadius.only(
                                topRight: Radius.circular(
                                  getProportionateMobileHeight(5),
                                ),
                                bottomRight: Radius.circular(
                                  getProportionateMobileHeight(5),
                                ),
                              ),
                            ),
                            child: Center(
                              child: Text('Buy Now',
                                  style: GoogleFonts.poppins(
                                    color: Colors.white,
                                    fontSize: getProportionateMobileHeight(14),
                                    fontWeight: FontWeight.w600,
                                  )),
                            ),
                          )
                        ],
                      ),
                    ),
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
