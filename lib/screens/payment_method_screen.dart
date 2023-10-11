import 'package:flutter/material.dart';

class PaymentMethodScreen extends StatefulWidget {
  const PaymentMethodScreen({Key? key}) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _PaymentMethodScreenState createState() => _PaymentMethodScreenState();
}

class _PaymentMethodScreenState extends State<PaymentMethodScreen> {
  String? _selectedPaymentMethod;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Payment Method'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView(
          children: <Widget>[
            PaymentMethodCard(
              icon: Icons.credit_card,
              cardNumber: '**** **** **** 1234',
              value: 'credit_card',
              groupValue: _selectedPaymentMethod,
              onChanged: (value) {
                setState(() {
                  _selectedPaymentMethod = value;
                });
              },
            ),
            const SizedBox(height: 20),
            PaymentMethodCard(
              icon: Icons.payment,
              cardNumber: 'DANA',
              value: 'dana',
              groupValue: _selectedPaymentMethod,
              onChanged: (value) {
                setState(() {
                  _selectedPaymentMethod = value;
                });
              },
            ),
            const SizedBox(height: 20),
            PaymentMethodCard(
              icon: Icons.payment,
              cardNumber: 'OVO',
              value: 'ovo',
              groupValue: _selectedPaymentMethod,
              onChanged: (value) {
                setState(() {
                  _selectedPaymentMethod = value;
                });
              },
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {},
              child: const Text('Add or Change Payment Method'),
            ),
          ],
        ),
      ),
    );
  }
}

class PaymentMethodCard extends StatelessWidget {
  final IconData icon;
  final String cardNumber;
  final String? value;
  final String? groupValue;
  final ValueChanged<String?>? onChanged;

  const PaymentMethodCard({
    Key? key,
    required this.icon,
    required this.cardNumber,
    required this.value,
    required this.groupValue,
    required this.onChanged,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        if (onChanged != null) {
          onChanged!(value);
        }
      },
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Material(
          elevation: 2,
          borderRadius: BorderRadius.circular(10),
          child: InkWell(
            onTap: () {
              if (onChanged != null) {
                onChanged!(value);
              }
            },
            borderRadius: BorderRadius.circular(10),
            child: Container(
              height: 100,
              padding: const EdgeInsets.all(16.0),
              child: Row(
                children: <Widget>[
                  Radio<String>(
                    value: value!,
                    groupValue: groupValue,
                    onChanged: onChanged,
                  ),
                  const SizedBox(width: 10),
                  Icon(
                    icon,
                    size: 40,
                    color: Colors.blue,
                  ),
                  const SizedBox(width: 20),
                  Text(
                    cardNumber,
                    style: const TextStyle(
                      fontSize: 18,
                      fontFamily: 'Nunito',
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
