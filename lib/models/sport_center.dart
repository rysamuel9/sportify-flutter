class SportCenter {
  String name;
  String location;
  String openDays;
  String openTime;
  String bookingPrice;
  String imageAsset;
  List<String> imageUrls;

  SportCenter({
    required this.name,
    required this.location,
    required this.openDays,
    required this.openTime,
    required this.bookingPrice,
    required this.imageAsset,
    required this.imageUrls,
  });
}

var sportCenterList = {
  'Futsal': [
    SportCenter(
      name: 'Bos Futsal',
      location:
          'Jl. Cikoneng, Bojongsoang, Kec. Bojongsoang, Kabupaten Bandung, Jawa Barat 40288',
      openDays: 'Setiap Hari',
      openTime: '08:00 - 22:00',
      bookingPrice: 'Rp 120.000',
      imageAsset: 'images/sportcenter/futsal_1.jpg',
      imageUrls: [
        'https://lh3.googleusercontent.com/p/AF1QipMbxXJ6ENefF5VFi7b2d8BJWdiGyOC6yvEuaMQ=s1360-w1360-h1020',
        'https://lh3.googleusercontent.com/p/AF1QipPNF7tIBtbHidieI3PXYhR1K4VJDTrxtpZtctI2=s1360-w1360-h1020',
        'https://lh3.googleusercontent.com/p/AF1QipMJTFxfcUjlmwIgZIs4F5tFOdcUXZxI3JgSqzEW=s1360-w1360-h1020'
      ],
    ),
    SportCenter(
      name: 'MMC FUTSAL INDOOR,BSD SERPONG',
      location:
          'Jl. Serpong Park, Jelupang, Kec. Serpong Utara, Kota Tangerang Selatan, Banten 15323',
      openDays: 'Setiap Hari',
      openTime: '08:00 - 22:00',
      bookingPrice: 'Rp 140.000',
      imageAsset: 'images/sportcenter/futsal_2.jpg',
      imageUrls: [
        'https://lh3.googleusercontent.com/p/AF1QipMbxXJ6ENefF5VFi7b2d8BJWdiGyOC6yvEuaMQ=s1360-w1360-h1020',
        'https://lh3.googleusercontent.com/p/AF1QipPNF7tIBtbHidieI3PXYhR1K4VJDTrxtpZtctI2=s1360-w1360-h1020',
        'https://lh3.googleusercontent.com/p/AF1QipMJTFxfcUjlmwIgZIs4F5tFOdcUXZxI3JgSqzEW=s1360-w1360-h1020'
      ],
    ),
    SportCenter(
      name: 'MS Indoor Soccer',
      location:
          'Kavling Ocean Walk, Jl. Pahlawan Seribu Blok CBD LOT No.VI A, Lengkong Gudang, Kec. Serpong, Kota Tangerang Selatan, Banten 15322',
      openDays: 'Setiap Hari',
      openTime: '08:00 - 22:00',
      bookingPrice: 'Rp 140.000',
      imageAsset: 'images/sportcenter/futsal_3.jpg',
      imageUrls: [
        'https://lh3.googleusercontent.com/p/AF1QipMbxXJ6ENefF5VFi7b2d8BJWdiGyOC6yvEuaMQ=s1360-w1360-h1020',
        'https://lh3.googleusercontent.com/p/AF1QipPNF7tIBtbHidieI3PXYhR1K4VJDTrxtpZtctI2=s1360-w1360-h1020',
        'https://lh3.googleusercontent.com/p/AF1QipMJTFxfcUjlmwIgZIs4F5tFOdcUXZxI3JgSqzEW=s1360-w1360-h1020'
      ],
    ),
    SportCenter(
      name: 'SKY Futsal',
      location:
          'Ciater Raya BSD, Jl. Masjid Ciater No.134, Ciater, Serpong Sub-District, South Tangerang City, Banten 15317',
      openDays: 'Setiap Hari',
      openTime: '08:00 - 22:00',
      bookingPrice: 'Rp 140.000',
      imageAsset: 'images/sportcenter/futsal_4.jpg',
      imageUrls: [
        'https://lh3.googleusercontent.com/p/AF1QipMbxXJ6ENefF5VFi7b2d8BJWdiGyOC6yvEuaMQ=s1360-w1360-h1020',
        'https://lh3.googleusercontent.com/p/AF1QipPNF7tIBtbHidieI3PXYhR1K4VJDTrxtpZtctI2=s1360-w1360-h1020',
        'https://lh3.googleusercontent.com/p/AF1QipMJTFxfcUjlmwIgZIs4F5tFOdcUXZxI3JgSqzEW=s1360-w1360-h1020'
      ],
    ),
    SportCenter(
      name: 'Stadiums Futsal',
      location:
          'Jl. Pondok Jagung Timur No.35, Pd. Jagung Tim., Kec. Serpong Utara, Kota Tangerang Selatan, Banten 15326',
      openDays: 'Setiap Hari',
      openTime: '08:00 - 22:00',
      bookingPrice: 'Rp 140.000',
      imageAsset: 'images/sportcenter/futsal_5.jpg',
      imageUrls: [
        'https://lh3.googleusercontent.com/p/AF1QipMbxXJ6ENefF5VFi7b2d8BJWdiGyOC6yvEuaMQ=s1360-w1360-h1020',
        'https://lh3.googleusercontent.com/p/AF1QipPNF7tIBtbHidieI3PXYhR1K4VJDTrxtpZtctI2=s1360-w1360-h1020',
        'https://lh3.googleusercontent.com/p/AF1QipMJTFxfcUjlmwIgZIs4F5tFOdcUXZxI3JgSqzEW=s1360-w1360-h1020'
      ],
    ),
    SportCenter(
      name: 'Icon Futsal',
      location:
          'Jl. Damar Poso 8 Blok, AA8 Blok AA8 No.23, Medang, Kec. Pagedangan, Kabupaten Tangerang, Banten 15334',
      openDays: 'Setiap Hari',
      openTime: '08:00 - 22:00',
      bookingPrice: 'Rp 140.000',
      imageAsset: 'images/sportcenter/futsal_6.jpg',
      imageUrls: [
        'https://lh3.googleusercontent.com/p/AF1QipMbxXJ6ENefF5VFi7b2d8BJWdiGyOC6yvEuaMQ=s1360-w1360-h1020',
        'https://lh3.googleusercontent.com/p/AF1QipPNF7tIBtbHidieI3PXYhR1K4VJDTrxtpZtctI2=s1360-w1360-h1020',
        'https://lh3.googleusercontent.com/p/AF1QipMJTFxfcUjlmwIgZIs4F5tFOdcUXZxI3JgSqzEW=s1360-w1360-h1020'
      ],
    ),
    SportCenter(
      name: 'Vero Futsal 2',
      location:
          'Jl. Kodiklat Tni Ampera No.2, Buaran, Kec. Serpong, Kota Tangerang Selatan, Banten 15310',
      openDays: 'Setiap Hari',
      openTime: '08:00 - 22:00',
      bookingPrice: 'Rp 140.000',
      imageAsset: 'images/sportcenter/futsal_7.jpg',
      imageUrls: [
        'https://lh3.googleusercontent.com/p/AF1QipMbxXJ6ENefF5VFi7b2d8BJWdiGyOC6yvEuaMQ=s1360-w1360-h1020',
        'https://lh3.googleusercontent.com/p/AF1QipPNF7tIBtbHidieI3PXYhR1K4VJDTrxtpZtctI2=s1360-w1360-h1020',
        'https://lh3.googleusercontent.com/p/AF1QipMJTFxfcUjlmwIgZIs4F5tFOdcUXZxI3JgSqzEW=s1360-w1360-h1020'
      ],
    ),
    SportCenter(
      name: 'Lembah Bates Futsal',
      location:
          'Jl. Raya Pagedangan, Cicalengka, Kec. Pagedangan, Kabupaten Tangerang, Banten 15820',
      openDays: 'Setiap Hari',
      openTime: '08:00 - 22:00',
      bookingPrice: 'Rp 140.000',
      imageAsset: 'images/sportcenter/futsal_8.jpg',
      imageUrls: [
        'https://lh3.googleusercontent.com/p/AF1QipMbxXJ6ENefF5VFi7b2d8BJWdiGyOC6yvEuaMQ=s1360-w1360-h1020',
        'https://lh3.googleusercontent.com/p/AF1QipPNF7tIBtbHidieI3PXYhR1K4VJDTrxtpZtctI2=s1360-w1360-h1020',
        'https://lh3.googleusercontent.com/p/AF1QipMJTFxfcUjlmwIgZIs4F5tFOdcUXZxI3JgSqzEW=s1360-w1360-h1020'
      ],
    ),
  ],
  'Berenang': [
    SportCenter(
      name: 'Kolam Renang Damai Indah Golf',
      location: 'Jalan Bukti Golf 1, Sektor VI, Serpong, Tangerang Selatan',
      openDays: 'Setiap Hari',
      openTime: '07:00 - 19:00',
      bookingPrice: 'Rp 58.000',
      imageAsset: 'images/sportcenter/swimming_pool_1.jpg',
      imageUrls: [
        'https://lh3.googleusercontent.com/p/AF1QipMbxXJ6ENefF5VFi7b2d8BJWdiGyOC6yvEuaMQ=s1360-w1360-h1020',
        'https://lh3.googleusercontent.com/p/AF1QipPNF7tIBtbHidieI3PXYhR1K4VJDTrxtpZtctI2=s1360-w1360-h1020',
        'https://lh3.googleusercontent.com/p/AF1QipMJTFxfcUjlmwIgZIs4F5tFOdcUXZxI3JgSqzEW=s1360-w1360-h1020'
      ],
    ),
    SportCenter(
      name: 'Ocean Park Water Adventure BSD',
      location:
          'Jalan Pahlawan Seribu, CBD Area, Lengkong Gudang, Serpong, Tangerang Selatan',
      openDays: 'Setiap Hari',
      openTime: '07:00 - 19:00',
      bookingPrice: 'Rp 100.000',
      imageAsset: 'images/sportcenter/swimming_pool_2.jpg',
      imageUrls: [
        'https://lh3.googleusercontent.com/p/AF1QipMbxXJ6ENefF5VFi7b2d8BJWdiGyOC6yvEuaMQ=s1360-w1360-h1020',
        'https://lh3.googleusercontent.com/p/AF1QipPNF7tIBtbHidieI3PXYhR1K4VJDTrxtpZtctI2=s1360-w1360-h1020',
        'https://lh3.googleusercontent.com/p/AF1QipMJTFxfcUjlmwIgZIs4F5tFOdcUXZxI3JgSqzEW=s1360-w1360-h1020'
      ],
    ),
    SportCenter(
      name: 'The Green BSD',
      location:
          'Jalan Buaran Rawa Buntu No.51, Cilenggang, Serpong, Tangerang Selatan',
      openDays: 'Setiap Hari',
      openTime: '07:00 - 19:00',
      bookingPrice: 'Rp 50.000',
      imageAsset: 'images/sportcenter/swimming_pool_3.jpg',
      imageUrls: [
        'https://lh3.googleusercontent.com/p/AF1QipMbxXJ6ENefF5VFi7b2d8BJWdiGyOC6yvEuaMQ=s1360-w1360-h1020',
        'https://lh3.googleusercontent.com/p/AF1QipPNF7tIBtbHidieI3PXYhR1K4VJDTrxtpZtctI2=s1360-w1360-h1020',
        'https://lh3.googleusercontent.com/p/AF1QipMJTFxfcUjlmwIgZIs4F5tFOdcUXZxI3JgSqzEW=s1360-w1360-h1020'
      ],
    ),
    SportCenter(
      name: 'Paradise Dreamland',
      location: 'Jalan Paradise Serpong City, Babakan Setu, Tangerang Selatan',
      imageUrls: [
        'https://lh3.googleusercontent.com/p/AF1QipMbxXJ6ENefF5VFi7b2d8BJWdiGyOC6yvEuaMQ=s1360-w1360-h1020',
        'https://lh3.googleusercontent.com/p/AF1QipPNF7tIBtbHidieI3PXYhR1K4VJDTrxtpZtctI2=s1360-w1360-h1020',
        'https://lh3.googleusercontent.com/p/AF1QipMJTFxfcUjlmwIgZIs4F5tFOdcUXZxI3JgSqzEW=s1360-w1360-h1020'
      ],
      openDays: 'Setiap Hari',
      openTime: '07:00 - 19:00',
      bookingPrice: 'Rp 35.000',
      imageAsset: 'images/sportcenter/swimming_pool_4.jpg',
    ),
    SportCenter(
      name: 'The Springs Club Summarecon Serpong',
      location:
          'Jalan Springs Boulevard Blok C No.1, Gading, Serpong, Tangerang Selatan',
      openDays: 'Setiap Hari',
      openTime: '07:00 - 19:00',
      bookingPrice: 'RP 200.000',
      imageAsset: 'images/sportcenter/swimming_pool_5.jpg',
      imageUrls: [
        'https://lh3.googleusercontent.com/p/AF1QipMbxXJ6ENefF5VFi7b2d8BJWdiGyOC6yvEuaMQ=s1360-w1360-h1020',
        'https://lh3.googleusercontent.com/p/AF1QipPNF7tIBtbHidieI3PXYhR1K4VJDTrxtpZtctI2=s1360-w1360-h1020',
        'https://lh3.googleusercontent.com/p/AF1QipMJTFxfcUjlmwIgZIs4F5tFOdcUXZxI3JgSqzEW=s1360-w1360-h1020'
      ],
    ),
    SportCenter(
      name: 'Kolam Renang Bumi Serpong Residence',
      location: 'Pd. Benda, Kec. Pamulang, Tangerang Selatan',
      openDays: 'Setiap Hari',
      openTime: '07:00 - 19:00',
      bookingPrice: 'RP 25.000',
      imageAsset: 'images/sportcenter/swimming_pool_6.jpg',
      imageUrls: [
        'https://lh3.googleusercontent.com/p/AF1QipMbxXJ6ENefF5VFi7b2d8BJWdiGyOC6yvEuaMQ=s1360-w1360-h1020',
        'https://lh3.googleusercontent.com/p/AF1QipPNF7tIBtbHidieI3PXYhR1K4VJDTrxtpZtctI2=s1360-w1360-h1020',
        'https://lh3.googleusercontent.com/p/AF1QipMJTFxfcUjlmwIgZIs4F5tFOdcUXZxI3JgSqzEW=s1360-w1360-h1020'
      ],
    ),
  ],
};
