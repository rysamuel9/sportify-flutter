import 'package:flutter/material.dart';

class SettingScreen extends StatefulWidget {
  const SettingScreen({Key? key}) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _SettingScreenState createState() => _SettingScreenState();
}

class _SettingScreenState extends State<SettingScreen> {
  bool _pushNotification = true;
  bool _promoEmail = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            const SizedBox(height: 20),
            _buildCard(
              Icons.settings,
              'Settings',
              () {
                _showUnderDevelopmentDialog(context);
              },
            ),
            const SizedBox(height: 20),
            _buildCard(
              Icons.logout,
              'Logout',
              () {
                _showUnderDevelopmentDialog(context);
              },
            ),
            const SizedBox(height: 20),
            _buildSwitchCard(
              Icons.notifications,
              'Receive Push Notifications',
              _pushNotification,
              (value) {
                setState(() {
                  _pushNotification = value;
                });
              },
            ),
            const SizedBox(height: 20),
            _buildSwitchCard(
              Icons.email,
              'Receive Promos via Email',
              _promoEmail,
              (value) {
                setState(() {
                  _promoEmail = value;
                });
              },
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildCard(IconData icon, String title, VoidCallback onPressed) {
    return Card(
      elevation: 2,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      child: InkWell(
        onTap: onPressed,
        child: ListTile(
          leading: Icon(
            icon,
            size: 24,
            color: Colors.blue,
          ),
          title: Text(
            title,
            style: const TextStyle(
              fontSize: 16,
              fontFamily: 'Nunito',
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildSwitchCard(
    IconData icon,
    String title,
    bool value,
    ValueChanged<bool> onChanged,
  ) {
    return Card(
      elevation: 2,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        children: <Widget>[
          ListTile(
            leading: Icon(
              icon,
              size: 24,
              color: Colors.blue,
            ),
            title: Text(
              title,
              style: const TextStyle(
                fontSize: 16,
                fontFamily: 'Nunito',
              ),
            ),
            trailing: Switch(
              value: value,
              onChanged: onChanged,
              activeColor: Colors.blue,
            ),
          ),
        ],
      ),
    );
  }

  void _showUnderDevelopmentDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return Dialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
          elevation: 0,
          backgroundColor: Colors.transparent,
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: Colors.white,
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                const Padding(
                  padding: EdgeInsets.all(16),
                  child: Text(
                    'Under Development',
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      fontFamily: 'Nunito',
                    ),
                  ),
                ),
                const Padding(
                  padding: EdgeInsets.all(16),
                  child: Text(
                    'This feature is still under development.',
                    style: TextStyle(
                      fontSize: 16,
                      fontFamily: 'Nunito',
                    ),
                  ),
                ),
                ElevatedButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.blue,
                  ),
                  child: const Text(
                    'OK',
                    style: TextStyle(
                      fontSize: 16,
                      fontFamily: 'Nunito',
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
