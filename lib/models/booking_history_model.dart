class BookingHistory {
  final String userName;
  final String sportCenterName;
  final String date;
  final String time;
  final String bookingPrice;
  final String imageSportCenter;

  BookingHistory(
      {required this.userName,
      required this.sportCenterName,
      required this.date,
      required this.time,
      required this.bookingPrice,
      required this.imageSportCenter});
}

var sportCenterList = [
  BookingHistory(
    userName: 'Samuel',
    sportCenterName: 'BSD Sport Center',
    date: '2023-02-20',
    time: '17:00',
    bookingPrice: 'Rp 350000',
    imageSportCenter: 'images/bookinghistory/booking_futsal.jpg',
  ),
  BookingHistory(
    userName: 'Samuel',
    sportCenterName: 'Ocean Park BSD',
    date: '2023-02-20',
    time: '17:00',
    bookingPrice: 'Rp 350000',
    imageSportCenter: 'images/bookinghistory/booking_pool.jpg',
  ),
  BookingHistory(
    userName: 'Samuel',
    sportCenterName: 'Swimming Pool BSD',
    date: '2023-02-20',
    time: '17:00',
    bookingPrice: 'Rp 350000',
    imageSportCenter: 'images/bookinghistory/booking_pool2.jpg',
  ),
  BookingHistory(
    userName: 'Samuel',
    sportCenterName: 'Mini Soccer POP Jakarta Pusat',
    date: '2023-02-20',
    time: '17:00',
    bookingPrice: 'Rp 350000',
    imageSportCenter: 'images/bookinghistory/booking_minisoccer.jpg',
  ),
];
