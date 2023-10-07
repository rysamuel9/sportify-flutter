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
  int _currentIndex = 0;
  final FocusNode _searchFocusNode = FocusNode();

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
                hintText: 'Cari tempat olahraga...',
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
      body: GestureDetector(
        onTap: () {
          _searchFocusNode.unfocus();
        },
        child: IndexedStack(
          index: _currentIndex,
          children: <Widget>[
            // Halaman Home
            Column(
              children: <Widget>[
                const UserCard(
                  userName: 'Samuel',
                  userPoints: 1024,
                ),
                const SizedBox(height: 20),
                const Text(
                  'Pilih Kategori Olahraga:',
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                const SizedBox(height: 10),
                Expanded(
                  child: GridView.count(
                    crossAxisCount: 3,
                    padding: const EdgeInsets.all(10),
                    children: <Widget>[
                      GestureDetector(
                        onTap: () {
                          Navigator.of(context).push(
                            MaterialPageRoute(
                              builder: (context) => const CategoryListScreen(
                                  categoryName: 'Futsal'),
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
                              builder: (context) => const CategoryListScreen(
                                  categoryName: 'Mini Soccer'),
                            ),
                          );
                        },
                        child: const CategoryCard(
                          categoryName: 'Mini Soccer',
                          categoryIcon: Icons.sports_volleyball,
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          Navigator.of(context).push(
                            MaterialPageRoute(
                              builder: (context) => const CategoryListScreen(
                                  categoryName: 'Berenang'),
                            ),
                          );
                        },
                        child: const CategoryCard(
                          categoryName: 'Berenang',
                          categoryIcon: Icons.pool,
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          Navigator.of(context).push(
                            MaterialPageRoute(
                              builder: (context) => const CategoryListScreen(
                                  categoryName: 'Badminton'),
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
                                  categoryName: 'Basket'),
                            ),
                          );
                        },
                        child: const CategoryCard(
                          categoryName: 'Basket',
                          categoryIcon: Icons.sports_basketball,
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          Navigator.of(context).push(
                            MaterialPageRoute(
                              builder: (context) => const CategoryListScreen(
                                  categoryName: 'Tennis'),
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
                ),
                const Text(
                  'Riwayat Booking:',
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                const SizedBox(height: 10),
                Expanded(
                  child: ListView.builder(
                    itemCount: sportCenterList.length,
                    itemBuilder: (context, index) {
                      final booking = sportCenterList[index];
                      return BookingHistoryCard(booking: booking);
                    },
                  ),
                ),
              ],
            ),
            const QRCodeScreen(userData: 'QRSamuel'),
            const SettingScreen(),
          ],
        ),
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
          setState(() {
            _currentIndex = index;
          });
        },
      ),
    );
  }

  @override
  void dispose() {
    _searchFocusNode.dispose();
    super.dispose();
  }
}
