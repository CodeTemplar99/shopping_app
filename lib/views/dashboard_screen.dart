import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:moniepoint_test/utils/colors.dart';
import 'package:moniepoint_test/utils/dimension.dart';
import 'package:moniepoint_test/views/coming_soon_screen.dart';
import 'package:moniepoint_test/views/home_view.dart';
import 'package:moniepoint_test/views/widgets/bottom_navbar_item.dart';
import 'package:moniepoint_test/views/widgets/icon_with_widget.dart';

class DashboardScreen extends StatefulWidget {
  const DashboardScreen({super.key});

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  final ScrollController _scrollController = ScrollController();

  bool _shouldBlockScroll = false;
  final double _maxScrollExtent = 100.0;

  bool _isAppBarColored = true;

  late List<Widget> _pages;
  late Widget _page1;
  late Widget _page2;
  late Widget _page3;
  late Widget _page4;

  late int _currentIndex;
  late Widget _currentPage;

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(_scrollListener);
    _page1 = HomeView(
      scrollController: _scrollController,
      shouldBlockScroll: _shouldBlockScroll,
    );
    _page2 = const ComingSoonScreen();
    _page3 = const ComingSoonScreen();
    _page4 = const ComingSoonScreen();

    _currentIndex = 0;
    _currentPage = _page1;
  }

  @override
  void dispose() {
    _scrollController.removeListener(_scrollListener);
    _scrollController.dispose();
    super.dispose();
  }

    // Lock scrolling after scrolling to a given height
  void _scrollListener() {
    if (_scrollController.offset >= 285) {
      setState(() {
        _isAppBarColored = false;
        _shouldBlockScroll = true;
      });
      _scrollController.animateTo(_maxScrollExtent * 3,
          duration: const Duration(milliseconds: 300), curve: Curves.ease);

      // Enable scrolling after a delay
      Future.delayed(const Duration(milliseconds: 300), () {
        setState(() {
          _shouldBlockScroll = false;
        });
      });
    } else {
      setState(() {
        _isAppBarColored = true;
        _shouldBlockScroll = false;
      });
    }
  }

  // change tab in dashboard
  void changeTab(int index) {
    setState(() {
      _currentIndex = index;
      _currentPage = _pages[index];
    });
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);

    // assign pages for the bottom nav
    _pages = [_page1, _page2, _page3, _page4];

    return Scaffold(
      backgroundColor: scaffoldColor,
      appBar: AppBar(
        systemOverlayStyle: const SystemUiOverlayStyle(
          statusBarIconBrightness: Brightness.dark,
          statusBarBrightness: Brightness.light,
        ),

        // switch appbar color based on displayed screen
        backgroundColor: _isAppBarColored
            ? _currentIndex > 0
                ? Colors.white
                : backgroundGray
            : Colors.transparent,
        elevation: 0,
        bottom: PreferredSize(
            preferredSize: Size.fromHeight(getProportionateMobileHeight(2)),
            child: Row(
              children: [
                SizedBox(width: getProportionateMobileHeight(15)),
                SizedBox(
                  width: getProportionateMobileHeight(250),
                  height: getProportionateMobileHeight(45),
                  child: TextField(
                    enabled: true,
                    decoration: InputDecoration(
                      prefixIcon: Icon(
                        Icons.search,
                        size: getProportionateMobileHeight(25),
                      ),
                      hintText: 'Search...',
                      contentPadding: EdgeInsets.symmetric(
                          horizontal: getProportionateMobileHeight(15),
                          vertical: getProportionateMobileHeight(10)),
                      enabledBorder: OutlineInputBorder(
                        borderSide: const BorderSide(
                            color: Color.fromRGBO(168, 169, 172, 1)),
                        borderRadius: BorderRadius.circular(8),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: const BorderSide(
                            color: Color.fromRGBO(168, 169, 172, 1)),
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                  ),
                ),
                const Expanded(
                  child: SizedBox.shrink(),
                ),
                const IconWithBadge(
                  iconName: Icons.shopping_bag_outlined,
                  notificationCount: '1',
                ),
                SizedBox(width: getProportionateMobileHeight(15)),
                const IconWithBadge(
                  iconName: Icons.chat_bubble_outline_rounded,
                  notificationCount: '9+',
                ),
                SizedBox(width: getProportionateMobileHeight(20)),
              ],
            )),
      ),
      body: _currentPage,
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.white,
        onTap: (index) => changeTab(index),
        iconSize: getProportionateMobileHeight(22.74),
        unselectedLabelStyle: GoogleFonts.poppins(
          fontSize: getProportionateMobileHeight(11.44),
          color: textGray,
          fontWeight: FontWeight.w400,
        ),
        selectedLabelStyle: GoogleFonts.poppins(
          fontSize: getProportionateMobileHeight(11.44),
          fontWeight: FontWeight.w500,
        ),
        selectedItemColor: accentColor,
        currentIndex: _currentIndex,
        type: BottomNavigationBarType.fixed,
        items: [
          buttomNavbarItem(
            const Icon(Icons.home_filled),
            'Home',
          ),
          buttomNavbarItem(
            const Icon(Icons.bookmark),
            'Voucher',
          ),
          buttomNavbarItem(
            const Icon(Icons.wallet),
            'Wallet',
          ),
          buttomNavbarItem(
            const Icon(Icons.settings),
            'Settings',
          ),
        ],
      ),
    );
  }
}
