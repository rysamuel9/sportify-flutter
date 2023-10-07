import 'package:flutter/material.dart';
import 'package:sportify/screens/payment_screen.dart';
import '../models/sport_center.dart';

class SportCenterDetailScreen extends StatefulWidget {
  final SportCenter sportCenter;

  const SportCenterDetailScreen({Key? key, required this.sportCenter})
      : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _SportCenterDetailScreenState createState() =>
      _SportCenterDetailScreenState();
}

class _SportCenterDetailScreenState extends State<SportCenterDetailScreen> {
  late DateTime _selectedDate;
  late TimeOfDay _selectedTime;

  @override
  void initState() {
    super.initState();
    _selectedDate = DateTime.now();
    _selectedTime = TimeOfDay.now();
  }

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: _selectedDate,
      firstDate: DateTime.now(),
      lastDate: DateTime(2101),
    );
    if (picked != null && picked != _selectedDate) {
      setState(() {
        _selectedDate = picked;
      });
    }
  }

  Future<void> _selectTime(BuildContext context) async {
    final TimeOfDay? picked = await showTimePicker(
      context: context,
      initialTime: _selectedTime,
    );
    if (picked != null && picked != _selectedTime) {
      setState(() {
        _selectedTime = picked;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.sportCenter.name),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            ClipRRect(
              borderRadius: BorderRadius.circular(8.0),
              child: Container(
                margin: const EdgeInsets.all(8.0),
                child: Image.asset(
                  widget.sportCenter.imageAsset,
                  width: double.infinity,
                  height: 200,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  const Text(
                    'Lokasi:',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                    ),
                  ),
                  Text(widget.sportCenter.location),
                  const SizedBox(height: 10),
                  const Text(
                    'Deskripsi:',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                    ),
                  ),
                  Text(widget.sportCenter.description),
                  const SizedBox(height: 10),
                  const Text(
                    'Buka:',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                    ),
                  ),
                  Text(
                      '${widget.sportCenter.openDays} - ${widget.sportCenter.openTime}'),
                  const SizedBox(height: 10),
                  const Text(
                    'Harga:',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                    ),
                  ),
                  Text(widget.sportCenter.bookingPrice),
                  const SizedBox(height: 20),
                  const Text(
                    'Pilih Tanggal dan Waktu Booking:',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                    ),
                  ),
                  ListTile(
                    title: Text(
                      "${_selectedDate.toLocal()}".split(' ')[0],
                      style: const TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    trailing: const Icon(
                      Icons.keyboard_arrow_down,
                      size: 30,
                    ),
                    onTap: () {
                      _selectDate(context);
                    },
                  ),
                  ListTile(
                    title: Text(
                      _selectedTime.format(context),
                      style: const TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    trailing: const Icon(
                      Icons.keyboard_arrow_down,
                      size: 30,
                    ),
                    onTap: () {
                      _selectTime(context);
                    },
                  ),
                  const SizedBox(height: 20),
                  ElevatedButton(
                    onPressed: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) => PaymentScreen(
                            sportCenterName: widget.sportCenter.name,
                            location: widget.sportCenter.location,
                            bookingPrice: widget.sportCenter.bookingPrice,
                            selectedDate: _selectedDate,
                            selectedTime: _selectedTime,
                          ),
                        ),
                      );
                    },
                    child: const Text("Booking Now"),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
