import 'package:flutter/material.dart';
import 'package:qr_flutter/qr_flutter.dart';

class QRCodeScreen extends StatelessWidget {
  final String userData;

  const QRCodeScreen({Key? key, required this.userData}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.5),
                    spreadRadius: 2,
                    blurRadius: 4,
                    offset: const Offset(0, 2),
                  ),
                ],
              ),
              padding: const EdgeInsets.all(16.0),
              child: QrImageView(
                data: userData,
                version: QrVersions.auto,
                size: 200.0,
                backgroundColor: Colors.white,
                // ignore: deprecated_member_use
                foregroundColor: Colors.black,
              ),
            ),
            const SizedBox(height: 20.0),
            const Text(
              'Show and Scan this QR Code to check-in.',
              style: TextStyle(
                fontSize: 16,
                fontFamily: 'Nunito',
                color: Colors.white,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
