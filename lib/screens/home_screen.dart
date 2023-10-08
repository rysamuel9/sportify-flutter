import 'package:feather_icons/feather_icons.dart';
import 'package:flutter/material.dart';
import 'package:salomon_bottom_bar/salomon_bottom_bar.dart';
import 'package:sportify/screens/setting_screen.dart';
import '../models/booking_history_model.dart';
import '../widgets/booking_history.dart';
import '../widgets/category_sport.dart';
import '../widgets/user_card.dart';
import 'barcode_screen.dart';
import 'category_list_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  // ignore: unused_field
  int _currentIndex = 0;

  final FocusNode _searchFocusNode = FocusNode();

  final PageController _pageController = PageController();

  @override
  void dispose() {
    _searchFocusNode.dispose();
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(60),
        child: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          title: Center(
            child: Container(
              margin: const EdgeInsets.only(
                  top: 20, bottom: 4, left: 16, right: 16),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(20),
              ),
              child: Row(
                children: <Widget>[
                  const Icon(Icons.search, color: Colors.grey),
                  const SizedBox(width: 8),
                  Expanded(
                    child: TextField(
                      focusNode: _searchFocusNode,
                      decoration: const InputDecoration(
                        hintText: 'Search sports places...',
                        hintStyle: TextStyle(color: Colors.grey),
                        border: InputBorder.none,
                        contentPadding: EdgeInsets.all(10),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          actions: <Widget>[
            IconButton(
              icon: const Icon(Icons.menu, color: Colors.grey),
              onPressed: () {
                _searchFocusNode.unfocus();
              },
            ),
          ],
        ),
      ),
      body: PageView(
        controller: _pageController,
        onPageChanged: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
        children: <Widget>[
          _buildHomeScreen(),
          const QRCodeScreen(userData: 'QRSamuel'),
          const SettingScreen(),
        ],
      ),
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(16.0),
            topRight: Radius.circular(16.0),
          ),
          border: Border.all(color: Colors.grey[300]!),
        ),
        child: SalomonBottomBar(
          currentIndex: _currentIndex,
          onTap: (index) {
            setState(() {
              _currentIndex = index;
              _pageController.jumpToPage(index);
            });
          },
          items: [
            SalomonBottomBarItem(
              icon: const Icon(FeatherIcons.home),
              title: const Text("Home"),
            ),
            SalomonBottomBarItem(
              icon: const Icon(FeatherIcons.camera),
              title: const Text("QR Code"),
            ),
            SalomonBottomBarItem(
              icon: const Icon(FeatherIcons.settings),
              title: const Text("Settings"),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildHomeScreen() {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          children: <Widget>[
            const UserCard(
              userName: 'Samuel',
              userPoints: 1024,
            ),
            const SizedBox(height: 20),
            const Text(
              'Explore Your Favorite Sport:',
              style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w700,
                fontFamily: 'Nunito',
              ),
            ),
            const SizedBox(height: 10),
            GridView.count(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              crossAxisCount: 3,
              padding: const EdgeInsets.all(10),
              children: <Widget>[
                GestureDetector(
                  onTap: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) =>
                            const CategoryListScreen(categoryName: 'Futsal'),
                      ),
                    );
                  },
                  child: InkWell(
                    borderRadius: BorderRadius.circular(10),
                    splashColor: Colors.blue,
                    child: const CategoryCard(
                      categoryName: 'Futsal',
                      svgIconPath: 'assets/football.svg',
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) =>
                            const CategoryListScreen(categoryName: 'Football'),
                      ),
                    );
                  },
                  child: InkWell(
                    borderRadius: BorderRadius.circular(10),
                    splashColor: Colors.blue,
                    child: const CategoryCard(
                      categoryName: 'Football',
                      svgIconPath: 'assets/football.svg',
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) =>
                            const CategoryListScreen(categoryName: 'Swimming'),
                      ),
                    );
                  },
                  child: InkWell(
                    borderRadius: BorderRadius.circular(10),
                    splashColor: Colors.blue,
                    child: const CategoryCard(
                      categoryName: 'Swimming',
                      svgIconPath: 'assets/swimming_pool.svg',
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) =>
                            const CategoryListScreen(categoryName: 'Badminton'),
                      ),
                    );
                  },
                  child: InkWell(
                    borderRadius: BorderRadius.circular(10),
                    splashColor: Colors.blue,
                    child: const CategoryCard(
                      categoryName: 'Badminton',
                      svgIconPath: 'assets/shuttlecock.svg',
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) => const CategoryListScreen(
                            categoryName: 'Basketball'),
                      ),
                    );
                  },
                  child: InkWell(
                    borderRadius: BorderRadius.circular(10),
                    splashColor: Colors.blue,
                    child: const CategoryCard(
                      categoryName: 'Basketball',
                      svgIconPath: 'assets/basketball.svg',
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) =>
                            const CategoryListScreen(categoryName: 'Tennis'),
                      ),
                    );
                  },
                  child: InkWell(
                    borderRadius: BorderRadius.circular(10),
                    splashColor: Colors.blue,
                    child: const CategoryCard(
                      categoryName: 'Tennis',
                      svgIconPath: 'assets/long_tennis.svg',
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 20),
            const Text(
              'Booking History:',
              style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w700,
                fontFamily: 'Nunito',
              ),
            ),
            const SizedBox(height: 10),
            ListView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: sportCenterList.length,
              itemBuilder: (context, index) {
                final booking = sportCenterList[index];
                return BookingHistoryCard(booking: booking);
              },
            ),
          ],
        ),
      ),
    );
  }
}
