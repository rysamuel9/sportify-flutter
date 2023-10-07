class SportCenter {
  String name;
  String location;
  String description;
  String openDays;
  String openTime;
  String bookingPrice;
  String imageAsset;

  SportCenter({
    required this.name,
    required this.location,
    required this.description,
    required this.openDays,
    required this.openTime,
    required this.bookingPrice,
    required this.imageAsset,
  });
}

var sportCenterList = {
  'Futsal': [
    for (int i = 1; i <= 10; i++)
      SportCenter(
        name: 'Futsal Center $i',
        location: 'Lokasi $i',
        description: 'Ini placeholder deskripsi saja',
        openDays: 'Senin - Jumat',
        openTime: '08:00 - 22:00',
        bookingPrice: 'Rp 100.000',
        imageAsset: 'images/sportcenter/futsal_$i.jpg',
      ),
  ],
  'Berenang': [
    for (int i = 1; i <= 10; i++)
      SportCenter(
        name: 'Swimming Pool $i',
        location: 'Lokasi $i',
        description: 'Ini placeholder deskripsi saja',
        openDays: 'Senin - Sabtu',
        openTime: '10:00 - 18:00',
        bookingPrice: 'Rp 150.000',
        imageAsset: 'images/sportcenter/swimming_pool_$i.jpg',
      ),
  ],
};
