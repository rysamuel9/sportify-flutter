import 'package:flutter/material.dart';

class AccountSettingsScreen extends StatefulWidget {
  const AccountSettingsScreen({Key? key}) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _AccountSettingsScreenState createState() => _AccountSettingsScreenState();
}

class _AccountSettingsScreenState extends State<AccountSettingsScreen> {
  final TextEditingController _nameController =
      TextEditingController(text: 'Rony Samuel Tamba');
  final TextEditingController _emailController =
      TextEditingController(text: 'ronysamuel19@gmail.com');
  final TextEditingController _contactController =
      TextEditingController(text: '1234567890');

  final String _profileImageURL =
      'https://avatars.githubusercontent.com/u/47234528?v=4';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Account Settings',
            style: TextStyle(fontFamily: 'Nunito')),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Center(
              child: GestureDetector(
                onTap: () {},
                child: CircleAvatar(
                  radius: 64,
                  backgroundImage: NetworkImage(_profileImageURL),
                ),
              ),
            ),
            const SizedBox(height: 16),
            const Text(
              'Name',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                fontFamily: 'Nunito',
              ),
            ),
            TextField(
              controller: _nameController,
              style: const TextStyle(fontFamily: 'Nunito'),
              decoration: const InputDecoration(
                hintText: 'Enter your name',
              ),
            ),
            const SizedBox(height: 16),
            const Text(
              'Email',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                fontFamily: 'Nunito',
              ),
            ),
            TextField(
              controller: _emailController,
              style: const TextStyle(fontFamily: 'Nunito'),
              keyboardType: TextInputType.emailAddress,
              decoration: const InputDecoration(
                hintText: 'Enter your email address',
              ),
            ),
            const SizedBox(height: 16),
            const Text(
              'Contact',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                fontFamily: 'Nunito',
              ),
            ),
            TextField(
              controller: _contactController,
              style: const TextStyle(fontFamily: 'Nunito'),
              keyboardType: TextInputType.phone,
              decoration: const InputDecoration(
                hintText: 'Enter your phone number',
              ),
            ),
            const SizedBox(height: 24),
            Center(
              child: ElevatedButton(
                onPressed: () {
                  _saveChanges(context);
                },
                child: const Text('Save Changes',
                    style: TextStyle(fontFamily: 'Nunito')),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _saveChanges(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Profile Updated',
              style: TextStyle(fontFamily: 'Nunito')),
          content: const Text(
              'Your profile information has been successfully updated.',
              style: TextStyle(fontFamily: 'Nunito')),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text('OK', style: TextStyle(fontFamily: 'Nunito')),
            ),
          ],
        );
      },
    );
  }
}
