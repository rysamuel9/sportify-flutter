import 'package:feather_icons/feather_icons.dart';
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
        title: Text(
          'Tempat $categoryName Terdekat',
          style: const TextStyle(
            fontFamily: 'Nunito',
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: sportCenters
              .map((sportCenter) => SportCenterItem(sportCenter: sportCenter))
              .toList(),
        ),
      ),
    );
  }
}

class SportCenterItem extends StatelessWidget {
  final SportCenter sportCenter;

  const SportCenterItem({Key? key, required this.sportCenter})
      : super(key: key);

  String _truncateAddress(String address) {
    const maxLength = 50;
    return (address.length <= maxLength)
        ? address
        : '${address.substring(0, maxLength)}...';
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 2,
      margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
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
        child: Hero(
          tag: sportCenter.imageAsset,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                height: 150,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage(sportCenter.imageAsset),
                    fit: BoxFit.cover,
                  ),
                  borderRadius: const BorderRadius.vertical(
                    top: Radius.circular(12),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      sportCenter.name,
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 18,
                        fontFamily: 'Nunito',
                      ),
                    ),
                    const SizedBox(height: 8),
                    Row(
                      children: <Widget>[
                        const Icon(
                          FeatherIcons.mapPin,
                          size: 16,
                          color: Colors.grey,
                        ),
                        const SizedBox(width: 4),
                        Expanded(
                          child: Text(
                            _truncateAddress(sportCenter.location),
                            style: const TextStyle(
                              color: Colors.grey,
                              fontFamily: 'Nunito',
                            ),
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 8),
                    Row(
                      children: <Widget>[
                        const Icon(
                          FeatherIcons.clock,
                          size: 16,
                          color: Colors.grey,
                        ),
                        const SizedBox(width: 4),
                        Text(
                          'Buka: ${sportCenter.openDays} - ${sportCenter.openTime}',
                          style: const TextStyle(
                            color: Colors.grey,
                            fontFamily: 'Nunito',
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 8),
                    Row(
                      children: <Widget>[
                        const Icon(
                          FeatherIcons.dollarSign,
                          size: 16,
                          color: Colors.grey,
                        ),
                        const SizedBox(width: 4),
                        Text(
                          'Harga: ${sportCenter.bookingPrice}',
                          style: const TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 16,
                            fontFamily: 'Nunito',
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
