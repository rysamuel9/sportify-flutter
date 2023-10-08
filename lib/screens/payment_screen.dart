import 'package:flutter/material.dart';

class PaymentScreen extends StatelessWidget {
  final String sportCenterName;
  final String location;
  final String bookingPrice;
  final DateTime selectedDate;
  final TimeOfDay selectedTime;

  const PaymentScreen({
    Key? key,
    required this.sportCenterName,
    required this.location,
    required this.bookingPrice,
    required this.selectedDate,
    required this.selectedTime,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Payment',
          style: TextStyle(
            fontSize: 20,
            fontFamily: 'Nunito',
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Payment Summary',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                fontFamily: 'Nunito',
              ),
            ),
            const SizedBox(height: 16),
            Card(
              elevation: 4,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(16.0),
              ),
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    buildPaymentInfo('Sport Center:', sportCenterName),
                    buildPaymentInfo('Location:', location),
                    buildPaymentInfo(
                      'Date:',
                      '${selectedDate.day}/${selectedDate.month}/${selectedDate.year}',
                    ),
                    buildPaymentInfo('Time:', selectedTime.format(context)),
                    buildPaymentInfo('Booking Price:', bookingPrice),
                    const SizedBox(height: 24),
                    Center(
                      child: ElevatedButton(
                        onPressed: () {
                          _showLoadingDialog(context);
                        },
                        style: ElevatedButton.styleFrom(
                          padding: const EdgeInsets.symmetric(
                            vertical: 16,
                            horizontal: 32,
                          ),
                        ),
                        child: const Text(
                          'Pay Now',
                          style: TextStyle(
                            fontSize: 18,
                            fontFamily: 'Nunito',
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget buildPaymentInfo(String label, String value) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: const TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
            fontFamily: 'Nunito',
          ),
        ),
        Text(
          value,
          style: const TextStyle(
            fontSize: 18,
            fontFamily: 'Nunito',
          ),
        ),
        const SizedBox(height: 12),
      ],
    );
  }

  void _showLoadingDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return const Center(
          child: CircularProgressIndicator(),
        );
      },
    );

    Future.delayed(const Duration(seconds: 2), () {
      Navigator.of(context, rootNavigator: true).pop();
      _showPaymentSuccessDialog(context);
    });
  }

  void _showPaymentSuccessDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Row(
            children: [
              Icon(
                Icons.check_circle,
                color: Colors.green,
                size: 32,
              ),
              SizedBox(width: 8),
              Text(
                'Payment Successful',
                style: TextStyle(
                  fontSize: 20,
                  fontFamily: 'Nunito',
                ),
              ),
            ],
          ),
          content: const Text(
            'Your payment has been successfully processed.',
            style: TextStyle(
              fontSize: 16,
              fontFamily: 'Nunito',
            ),
          ),
          actions: <Widget>[
            ElevatedButton(
              onPressed: () {
                Navigator.of(context).popUntil((route) => route.isFirst);
              },
              child: const Text(
                'OK',
                style: TextStyle(
                  fontSize: 16,
                  fontFamily: 'Nunito',
                ),
              ),
            ),
          ],
        );
      },
    );
  }
}
