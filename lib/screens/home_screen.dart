import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
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
          title: Padding(
            padding: const EdgeInsets.symmetric(vertical: 8),
            child: TextField(
              focusNode: _searchFocusNode,
              decoration: InputDecoration(
                hintText: 'Search sports places...',
                hintStyle: const TextStyle(color: Colors.grey),
                prefixIcon: const Icon(Icons.search, color: Colors.grey),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
                contentPadding: const EdgeInsets.all(10),
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
      bottomNavigationBar: CurvedNavigationBar(
        backgroundColor: Colors.white,
        color: Colors.blue,
        height: 50,
        items: const <Widget>[
          Icon(Icons.home, size: 30),
          Icon(Icons.qr_code, size: 30),
          Icon(Icons.settings, size: 30),
        ],
        onTap: (index) {
          _pageController.animateToPage(
            index,
            duration: const Duration(milliseconds: 300),
            curve: Curves.easeInOut,
          );
        },
      ),
    );
  }

  Widget _buildHomeScreen() {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
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
                  child: const CategoryCard(
                    categoryName: 'Futsal',
                    categoryIcon: Icons.sports_soccer,
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
                  child: const CategoryCard(
                    categoryName: 'Footabll',
                    categoryIcon: Icons.sports_volleyball,
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) =>
                            const CategoryListScreen(categoryName: 'Berenang'),
                      ),
                    );
                  },
                  child: const CategoryCard(
                    categoryName: 'Swimming',
                    categoryIcon: Icons.pool,
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
                  child: const CategoryCard(
                    categoryName: 'Badminton',
                    categoryIcon: Icons.sports_tennis,
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
                  child: const CategoryCard(
                    categoryName: 'Basketball',
                    categoryIcon: Icons.sports_basketball,
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
                  child: const CategoryCard(
                    categoryName: 'Tennis',
                    categoryIcon: Icons.sports_tennis,
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
