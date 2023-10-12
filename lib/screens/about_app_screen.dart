import 'package:flutter/material.dart';

class AboutAppScreen extends StatelessWidget {
  const AboutAppScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('About Sportify'),
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.all(16.0),
          child: const Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(
                'Welcome to Sportify!',
                style: TextStyle(
                    fontSize: 28,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                    fontFamily: 'Nunito'),
              ),
              SizedBox(height: 16),
              Text(
                'Sportify is your ultimate sports booking app. Discover and book sports facilities like futsal courts, swimming pools, tennis courts, and more, all in one place. Whether you are a sports enthusiast or a casual playerSportify makes it easy to find and reserve your favorite sports venues.',
                style: TextStyle(
                    fontSize: 18, color: Colors.black87, fontFamily: 'Nunito'),
              ),
              SizedBox(height: 24),
              Row(
                children: <Widget>[
                  Icon(
                    Icons.check,
                    color: Colors.green,
                  ),
                  SizedBox(width: 8),
                  Flexible(
                    child: Text(
                      'Easy and convenient sports booking',
                      style: TextStyle(
                          fontSize: 16,
                          color: Colors.black87,
                          fontFamily: 'Nunito'),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 8),
              Row(
                children: <Widget>[
                  Icon(
                    Icons.star_border_rounded,
                    color: Colors.green,
                  ),
                  SizedBox(width: 8),
                  Flexible(
                    child: Text(
                      'Rated 4.8 out of 5 by our users',
                      style: TextStyle(
                          fontSize: 16,
                          color: Colors.black87,
                          fontFamily: 'Nunito'),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 24),
              Text(
                'Version: 1.0.0',
                style: TextStyle(
                    fontSize: 16, color: Colors.grey, fontFamily: 'Nunito'),
              ),
              SizedBox(height: 8),
              Text(
                'Developed by Rony Samuel Tamba',
                style: TextStyle(
                    fontSize: 16, color: Colors.grey, fontFamily: 'Nunito'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
