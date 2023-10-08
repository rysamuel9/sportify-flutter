import 'package:feather_icons/feather_icons.dart';
import 'package:flutter/material.dart';
import 'package:sportify/screens/payment_screen.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:photo_view/photo_view.dart';
import '../models/sport_center.dart';
// import 'package:url_launcher/url_launcher.dart';

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

  bool _isTimeLoading = false;
  bool _isDateLoading = false;

  @override
  void initState() {
    super.initState();
    _selectedDate = DateTime.now();
    _selectedTime = TimeOfDay.now();
  }

  Future<void> _selectDate(BuildContext context) async {
    setState(() {
      _isDateLoading = true;
    });

    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: _selectedDate,
      firstDate: DateTime.now(),
      lastDate: DateTime(2101),
    );
    if (picked != null && picked != _selectedDate) {
      setState(() {
        _selectedDate = picked;
        _isDateLoading = false;
      });
    } else {
      setState(() {
        _isDateLoading = false;
      });
    }
  }

  Future<void> _selectTime(BuildContext context) async {
    setState(() {
      _isTimeLoading = true;
    });

    TimeOfDay? selectedTime = await showTimePicker(
      context: context,
      initialTime: _selectedTime,
    );

    if (selectedTime != null) {
      if (!_isTimeValid(selectedTime)) {
        // ignore: use_build_context_synchronously
        showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              title: const Text('Invalid Time'),
              content: const Text(
                  'The selected time is not available. Please choose a time between 08:00 AM and 09:00 PM.'),
              actions: <Widget>[
                TextButton(
                  child: const Text('OK'),
                  onPressed: () {
                    Navigator.of(context).pop();
                    _selectTime(context);
                  },
                ),
              ],
            );
          },
        );
        setState(() {
          _isTimeLoading = false;
        });
      } else {
        setState(() {
          _selectedTime = selectedTime;
          _isTimeLoading = false;
        });
      }
    } else {
      setState(() {
        _isTimeLoading = false;
      });
    }
  }

  bool _isTimeValid(TimeOfDay time) {
    const startTime = TimeOfDay(hour: 8, minute: 0);
    const endTime = TimeOfDay(hour: 21, minute: 0);
    return (time.hour > startTime.hour ||
            (time.hour == startTime.hour && time.minute >= startTime.minute)) &&
        (time.hour < endTime.hour ||
            (time.hour == endTime.hour && time.minute <= endTime.minute));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          widget.sportCenter.name,
          style: const TextStyle(
            fontSize: 20,
            fontFamily: 'Nunito',
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            buildImageGallery(context),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  buildDetail('Location:', widget.sportCenter.location),
                  buildDetail('Open Hours:',
                      '${widget.sportCenter.openDays} - ${widget.sportCenter.openTime}'),
                  buildDetail('Price:', widget.sportCenter.bookingPrice),
                  buildDateTimeSelector(context),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget buildDetail(String label, String value) {
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
            fontSize: 16,
            fontFamily: 'Nunito',
          ),
        ),
        const SizedBox(height: 10),
      ],
    );
  }

  Widget buildImageGallery(BuildContext context) {
    final List<String> imageUrls = widget.sportCenter.imageUrls;
    return SizedBox(
      height: 200.0,
      child: CarouselSlider(
        options: CarouselOptions(
          height: 200.0,
          enlargeCenterPage: false,
          autoPlay: false,
          enableInfiniteScroll: false,
        ),
        items: imageUrls.map((imageUrl) {
          return GestureDetector(
            onTap: () {
              _showImageModal(context, imageUrl);
            },
            child: Image.network(
              imageUrl,
              fit: BoxFit.cover,
            ),
          );
        }).toList(),
      ),
    );
  }

  // Fix Soon (Open in another app)
  // Widget buildLocationInfo(String label, String location) {
  //   return Column(
  //     crossAxisAlignment: CrossAxisAlignment.start,
  //     children: [
  //       Text(
  //         label,
  //         style: const TextStyle(
  //           fontSize: 18,
  //           fontWeight: FontWeight.bold,
  //           fontFamily: 'Nunito',
  //         ),
  //       ),
  //       GestureDetector(
  //         onTap: () {
  //           _launchMapSearch(location);
  //         },
  //         child: Text(
  //           location,
  //           style: const TextStyle(
  //             fontSize: 18,
  //             fontFamily: 'Nunito',
  //             decoration: TextDecoration.underline,
  //             color: Colors.blue,
  //           ),
  //         ),
  //       ),
  //       const SizedBox(height: 12),
  //     ],
  //   );
  // }

  // Fix Soon (Open in another app)
  // Future<void> _launchMapSearch(String location) async {
  //   final encodedLocation = Uri.encodeComponent(location);
  //   final googleMapsUrl =
  //       'https://www.google.com/maps/search/?api=1&query=$encodedLocation';

  //   if (await canLaunch(googleMapsUrl)) {
  //     await launch(googleMapsUrl);
  //   } else {
  //     throw 'Could not launch $googleMapsUrl';
  //   }
  // }

  void _showImageModal(BuildContext context, String imageUrl) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return Dialog(
          backgroundColor: Colors.black.withOpacity(0.1),
          elevation: 0,
          child: GestureDetector(
            onTap: () {
              Navigator.of(context).pop();
            },
            child: SizedBox(
              width: double.infinity,
              height: MediaQuery.of(context).size.height * 0.8,
              child: PhotoView(
                imageProvider: NetworkImage(imageUrl),
                backgroundDecoration: const BoxDecoration(
                  color: Colors.transparent,
                ),
                minScale: PhotoViewComputedScale.contained,
                maxScale: PhotoViewComputedScale.covered,
              ),
            ),
          ),
        );
      },
    );
  }

  Widget buildDateTimeSelector(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        GestureDetector(
          onTap: () {
            _selectDate(context);
          },
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Text(
                "Date: ${_selectedDate.day}/${_selectedDate.month}/${_selectedDate.year}",
                style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  fontFamily: 'Nunito',
                ),
              ),
              GestureDetector(
                onTap: () {
                  if (!_isDateLoading) {
                    _selectDate(context);
                  }
                },
                child: _isDateLoading
                    ? const CircularProgressIndicator()
                    : const Icon(
                        FeatherIcons.calendar,
                        size: 30,
                      ),
              ),
            ],
          ),
        ),
        const SizedBox(height: 10),
        GestureDetector(
          onTap: () {
            _selectTime(context);
          },
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Text(
                "Time: ${_selectedTime.format(context)}",
                style: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  fontFamily: 'Nunito',
                ),
              ),
              GestureDetector(
                onTap: () {
                  if (!_isTimeLoading) {
                    _selectTime(context);
                  }
                },
                child: _isTimeLoading
                    ? const CircularProgressIndicator()
                    : const Icon(
                        FeatherIcons.clock,
                        size: 30,
                      ),
              ),
            ],
          ),
        ),
        const SizedBox(height: 20),
        ElevatedButton(
          onPressed: () {
            if (!_isTimeLoading && !_isDateLoading) {
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
            }
          },
          style: ElevatedButton.styleFrom(
            padding: const EdgeInsets.symmetric(
              vertical: 16,
              horizontal: 32,
            ),
            backgroundColor: Colors.blue,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(100),
            ),
          ),
          child: const Text(
            "Book Now",
            style: TextStyle(
              fontSize: 18,
              color: Colors.white,
              fontFamily: 'Nunito',
            ),
          ),
        ),
      ],
    );
  }
}
