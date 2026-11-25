import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pascua_mobprog/constants.dart';
import 'newsfeed_screen.dart';
import 'notification_screen.dart';
import '../widgets/custom_text.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedIndex = 0;
  final PageController _pageController = PageController();

  // Enhancement 2 & 4: Dynamic AppBar title & custom App Name placeholder
  final List<String> _appBarTitles = [
    'BenStagram',
    'Notifications',
    'Profile',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: fbTextColorWhite,
        shadowColor: fbDarkPrimary,
        elevation: 2,
        title: CustomText(
          text: _appBarTitles[_selectedIndex],
          fontSize: ScreenUtil().setSp(25),
          color: _selectedIndex == 0 ? fbPrimary : fbDarkPrimary,
          fontFamily: 'Klavika',
          fontWeight: FontWeight.w700,
        ),
      ),
      body: PageView(
        controller: _pageController,
        children: const <Widget>[
          NewsfeedScreen(),
          NotificationScreen(),
          Center(child: Text('Profile Screen Placeholder')),
        ],
        onPageChanged: (page) {
          setState(() {
            _selectedIndex = page;
          });
        },
      ),
      // Enhancement 3: Added more BottomNavigationBarItems
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: fbTextColorWhite,
        showUnselectedLabels: false,
        showSelectedLabels: false,
        onTap: _onTappedBar,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.notifications),
            label: 'Notifications',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Profile',
          ),
        ],
        selectedItemColor: fbPrimary,
        unselectedItemColor: fbSecondary,
        currentIndex: _selectedIndex,
      ),
    );
  }

  void _onTappedBar(int value) {
    setState(() {
      _selectedIndex = value;
    });
    _pageController.jumpToPage(value);
  }
}