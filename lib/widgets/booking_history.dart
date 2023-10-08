import 'package:flutter/material.dart';
import '../models/booking_history_model.dart';

class BookingHistoryCard extends StatelessWidget {
  final BookingHistory booking;

  const BookingHistoryCard({
    Key? key,
    required this.booking,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 2,
      margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8),
      ),
      child: SizedBox(
        height: 150,
        child: Row(
          children: <Widget>[
            SizedBox(
              width: 120,
              height: double.infinity,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(8),
                child: Image.asset(
                  booking.imageSportCenter,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            const SizedBox(width: 12),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text(
                    booking.sportCenterName,
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                      fontFamily: 'Nunito',
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    '${booking.date}, ${booking.time}',
                    style: const TextStyle(
                      color: Colors.grey,
                      fontFamily: 'Nunito',
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    'Booked by: ${booking.userName}',
                    style: const TextStyle(
                      fontFamily: 'Nunito',
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    'Price: ${booking.bookingPrice}',
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontFamily: 'Nunito',
                    ),
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
