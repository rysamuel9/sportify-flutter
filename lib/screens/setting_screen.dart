import 'package:flutter/material.dart';

import 'payment_method_screen.dart';

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
      body: ListView(
        padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
        children: <Widget>[
          _buildSwitchTile(
            Icons.notifications,
            'Push Notifications',
            _pushNotification,
            (value) {
              setState(() {
                _pushNotification = value;
              });
            },
          ),
          const Divider(),
          _buildSwitchTile(
            Icons.email,
            'Promos via Email',
            _promoEmail,
            (value) {
              setState(() {
                _promoEmail = value;
              });
            },
          ),
          const Divider(),
          _buildMenuItem(
            Icons.account_circle,
            'Account Settings',
            () {},
          ),
          const Divider(),
          _buildMenuItem(
            Icons.info,
            'About App',
            () {},
          ),
          const Divider(),
          _buildMenuItem(
            Icons.payment,
            'Payment Method',
            () {
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => const PaymentMethodScreen()),
              );
            },
          ),
          const Divider(),
          _buildMenuItem(
            Icons.privacy_tip,
            'Privacy Policy',
            () {},
          ),
          const Divider(),
          _buildLogoutTile(),
        ],
      ),
    );
  }

  Widget _buildSwitchTile(
    IconData icon,
    String title,
    bool value,
    ValueChanged<bool> onChanged,
  ) {
    return ListTile(
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
    );
  }

  Widget _buildMenuItem(
    IconData icon,
    String title,
    VoidCallback onTap,
  ) {
    return ListTile(
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
      onTap: onTap,
    );
  }

  Widget _buildLogoutTile() {
    return ListTile(
      leading: const Icon(
        Icons.logout,
        size: 24,
        color: Colors.red,
      ),
      title: const Text(
        'Logout',
        style: TextStyle(
          fontSize: 16,
          fontFamily: 'Nunito',
          color: Colors.red,
        ),
      ),
      onTap: () {
        _showLogoutDialog(context);
      },
    );
  }

  void _showLogoutDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Logout Confirmation'),
          content: const Text('Are you sure you want to logout?'),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text('Cancel'),
            ),
            TextButton(
              onPressed: () {
                Navigator.of(context).pushReplacementNamed('/');
              },
              child: const Text('Logout'),
            ),
          ],
        );
      },
    );
  }
}
