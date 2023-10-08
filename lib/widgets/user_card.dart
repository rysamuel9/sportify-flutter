import 'package:flutter/material.dart';

class UserCard extends StatelessWidget {
  final String userName;
  final int userPoints;

  const UserCard({Key? key, required this.userName, required this.userPoints})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.all(10),
      elevation: 4,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10.0),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text(
                  'Hello, $userName!',
                  style: const TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                    fontFamily: 'Nunito',
                  ),
                ),
                Chip(
                  label: Text(
                    'Points: $userPoints',
                    style: const TextStyle(
                      fontSize: 14,
                      color: Colors.white,
                      fontFamily: 'Nunito',
                    ),
                  ),
                  backgroundColor: Colors.blue,
                ),
              ],
            ),
            const SizedBox(height: 10),
            const Text(
              'Collect as many points as possible to get discounts!',
              style: TextStyle(
                fontSize: 14,
                color: Colors.grey,
                fontFamily: 'Nunito',
              ),
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
            ),
          ],
        ),
      ),
    );
  }
}
