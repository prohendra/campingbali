class TourismPlace {
  String name;
  String location;
  String description;
  String openDays;
  String openTime;
  String ticketPrice;
  String facility;
  String imageAsset;
  int rating;
 
  TourismPlace({
    required this.name,
    required this.location,
    required this.description,
    required this.openDays,
    required this.openTime,
    required this.ticketPrice,
    required this.facility,
    required this.imageAsset,
    required this.rating,
  });
}
 
var tourismPlaceList = [
  TourismPlace(
    name: 'Bukit Cinta',
    location: 'Pingan,Kintamani,Bangli',
    description:
        'Pinggan Sunrise Camping menyuguhkan tempat camping yang langsung berada di alam. Dari sini,anda dapat melihat sunrise sekaligus pemandangan Gunung Batur, Gunung Abang, persawahan dan Danau Batur.',
    openDays: 'Buka Setiap Hari',
    openTime: '09:00 - 20:00',
    ticketPrice: 'Rp 20000',
    facility: 'wifi,kamar mandi,listrik',
    imageAsset: 'images/bukitcinta.jpg',
    
     rating: 4,
  ),
  TourismPlace(
    name: 'Bukit Surga',
    location: 'Jungutan,Bebandem,Karangasem',
    description:
        'Disini anda bisa menikmati pemandangan Gunung Rinjani, perbukitan, perkebunan hingga lembah, Di sekitar camping ground, ada juga perkebunan salak bali',
    openDays: 'Buka Setiap Hari',
    openTime: '09:00 - 14:30',
    ticketPrice: 'Rp 20000',
    facility: 'wifi,kamar mandi,listrik',
    imageAsset: 'images/bukitsurga.jpg',
     rating: 5,
  ),
  TourismPlace(
    name: 'Danau Buyan',
    location: 'Pancasari,Buleleng',
    description:
        'Dari depan tenda dan menyaksikan air danau yang tenang. Belum lagi ketika bulan purnama, pemandangan danau pun semakin cantik,  Anda bisa menemukan monyet dan burung yang bebas jika berjalan-jalan di sekitar danau.',
    openDays: 'Buka Setiap Hari',
    openTime: '24 jam',
    ticketPrice: '15000',
    facility: 'wifi,kamar mandi,listrik,warung,parkir luas',
    imageAsset: 'images/danau-buyan.jpg',
     rating: 5,
  ),
  TourismPlace(
    name: 'Pinggan Sunrise Camping',
    location: 'Sukawana,Kintamani,Bangli',
    description:
        'Pinggan Sunrise Camping menyuguhkan tempat camping yang langsung berada di alam. Dari sini, anda dapat melihat sunrise sekaligus pemandangan Gunung Batur, Gunung Abang, persawahan dan Danau Batur.',
    openDays: 'Buka Setiap Hari',
    openTime: '06:00 - 17:00',
    ticketPrice: 'Rp 20000',
    facility: 'wifi,kamar mandi,listrik,warung,parkir luas',
    imageAsset: 'images/pingan.jpg',
     rating: 5,
  ),
  TourismPlace(
    name: 'Alengkong Bali Camp',
    location: 'Kintamani,Bangli',
    description:
        'Di Alengkong Bali Camp, kalian dapat menikmati banyak pemandangan sekaligus dari satu lokasi. Gunung Batur, Gunung Abang, Gunung Agung, bahkan Gunung Rinjani pun terlihat dari sini. Kalian juga menyaksikan sunrise dan sunset dengan nuansa negeri di atas awan.',
    openDays: 'Buka Setiap Hari',
    openTime: '24 jam',
    ticketPrice: '25000',
    facility: 'wifi,kamar mandi,listrik',
    imageAsset: 'images/alengkong.jpg',
     rating: 4,
  ),
  TourismPlace(
    name: 'Bukit Asah',
    location: 'Manggis,Karangasem',
    description:
        'Letaknya berada di tebing yang berbatasan dengan laut. Tentu Anda bisa menikmati matahari terbit yang muncul dari laut maupun sunset. Lokasinya yang dekat dengan Virgin Beach Karangasem juga membuatnya menjadi favorit wisatawan. Tempat camping di sini sudah dilengkapi fasilitas umum, mulai dari toilet, listrik hinggi wifi.',
    openDays: 'Buka Setiap Hari',
    openTime: '09:00 - 15:30',
    ticketPrice: 'Rp 10000',
    facility: 'wifi,kamar mandi,listrik',
    imageAsset: 'images/bukitasah.jpg',
     rating: 4,
  ),
  TourismPlace(
    name: 'Bukit Cemara',
    location: 'Bebandem,Karangasem',
    description:
        'Wilayah Karangasem memang memiliki pemandangan alam yang indah untuk dinikmati. Anda bisa melihat pemandangan sunrise dan sunset dengan pemandangan Gunung Batur. Kawasan ini masih jarang dikunjungi wisatawan, sehingga cukup tenang jika berkemah.',
    openDays: 'Buka Setiap Hari',
    openTime: '09:00 - 17:00',
    ticketPrice: 'Rp 20000',
    facility: 'wifi,kamar mandi,listrik,',
    imageAsset: 'images/bukitcemara.jpg',
     rating: 5,
  ),
  TourismPlace(
    name: 'Maha Gangga Valley',
    location: 'Abang,Karangasem',
    description:
        'Maha Gangga Valley menggabungkan konsep alam, tradisional namun modern. Tempat ini menyediakan eco camp berbentuk seperti gubuk namun agak besar dengan fasilitas lengkap, seperti toilet, listrik, tempat tidur dan selimut. Di sini juga menyediakan aktivitas lain, seperti swing dan bermain di sungai jernih.',
    openDays: ' Buka Setiap Hari',
    openTime: '07:00 - 17:00',
    ticketPrice: 'Rp 20000',
    facility: 'wifi,kamar mandi,listrik,',
    imageAsset: 'images/mahagangga.jpg',
     rating: 4,
  ),
  
];