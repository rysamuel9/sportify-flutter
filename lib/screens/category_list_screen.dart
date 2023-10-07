import 'package:flutter/material.dart';
import 'package:sportify/screens/sport_center_detail_screen.dart';

import '../models/sport_center.dart';

class CategoryListScreen extends StatelessWidget {
  final String categoryName;

  const CategoryListScreen({Key? key, required this.categoryName})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final List<SportCenter> sportCenters = sportCenterList[categoryName] ?? [];

    return Scaffold(
      appBar: AppBar(
        title: Text('List Lapangan $categoryName'),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: sportCenters.map((sportCenter) {
            return SportCenterItem(sportCenter: sportCenter);
          }).toList(),
        ),
      ),
    );
  }
}

class SportCenterItem extends StatelessWidget {
  final SportCenter sportCenter;

  const SportCenterItem({Key? key, required this.sportCenter})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 2,
      margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
      child: InkWell(
        onTap: () {
          Navigator.of(context).push(
            MaterialPageRoute(
              builder: (context) => SportCenterDetailScreen(
                sportCenter: sportCenter,
              ),
            ),
          );
        },
        child: ListTile(
          leading: Image.asset(
            sportCenter.imageAsset,
            width: 100,
            height: 100,
            fit: BoxFit.cover,
          ),
          title: Text(
            sportCenter.name,
            style: const TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 16,
            ),
          ),
          subtitle: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(sportCenter.location),
              Text('Buka: ${sportCenter.openDays} - ${sportCenter.openTime}'),
              Text('Harga: ${sportCenter.bookingPrice}'),
            ],
          ),
        ),
      ),
    );
  }
}
