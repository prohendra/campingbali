import 'package:flutter/material.dart';
import 'package:campingbali/model/tourism_place.dart';


var informationTextStyle = const TextStyle(fontFamily: 'Oxygen');

class DetailScreen extends StatefulWidget {
  final TourismPlace place;
  final List<TourismPlace> likedPlaces;

  const DetailScreen({super.key, required this.place, required this.likedPlaces});

  @override
  _DetailScreenState createState() => _DetailScreenState();
}

class _DetailScreenState extends State<DetailScreen> {
  final TextEditingController _reviewController = TextEditingController();
  final List<Map<String, String>> _reviews = [];

  void _addReview() {
    final newReview = _reviewController.text;

    if (newReview.isNotEmpty) {
      setState(() {
        _reviews.add({
          'name': 'Pengunjung',
          'review': newReview,
        });
        _reviewController.clear();
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    bool isLiked = widget.likedPlaces.contains(widget.place);

    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Stack(
              children: <Widget>[
                Container(
                  width: double.infinity,
                  child: AspectRatio(
                    aspectRatio: 16 / 9,
                    child: Image.asset(
                      widget.place.imageAsset,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                SafeArea(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        CircleAvatar(
                          backgroundColor: Colors.grey,
                          child: IconButton(
                            icon: const Icon(
                              Icons.arrow_back,
                              color: Colors.white,
                            ),
                            onPressed: () {
                              Navigator.pop(context);
                            },
                          ),
                        ),
                        IconButton(
                          icon: Icon(
                            isLiked ? Icons.favorite : Icons.favorite_border,
                            color: isLiked ? Colors.red : null,
                          ),
                          onPressed: () {
                            setState(() {
                              if (isLiked) {
                                widget.likedPlaces.remove(widget.place);
                              } else {
                                widget.likedPlaces.add(widget.place);
                              }
                            });
                          },
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
            Container(
              margin: const EdgeInsets.only(top: 16.0),
              child: Text(
                widget.place.name,
                textAlign: TextAlign.center,
                style: const TextStyle(
                  fontSize: 30.0,
                  fontFamily: 'Staatliches',
                ),
              ),
            ),
            // Location
            Container(
              margin: const EdgeInsets.only(top: 8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  const Icon(
                    Icons.location_on,
                    color: Colors.red,
                  ),
                  const SizedBox(width: 8.0),
                  Text(
                    widget.place.location,
                    style: const TextStyle(
                      fontSize: 16.0,
                      fontFamily: 'Oxygen',
                      color: Colors.grey,
                    ),
                  ),
                ],
              ),
            ),
            // Opening Hours and Ticket Price
            Container(
              margin: const EdgeInsets.symmetric(vertical: 16.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  Column(
                    children: <Widget>[
                      const Icon(Icons.calendar_today),
                      const SizedBox(height: 8.0),
                      Text(
                        widget.place.openDays,
                        style: informationTextStyle,
                      ),
                    ],
                  ),
                  Column(
                    children: <Widget>[
                      const Icon(Icons.access_time),
                      const SizedBox(height: 8.0),
                      Text(
                        widget.place.openTime,
                        style: informationTextStyle,
                      ),
                    ],
                  ),
                  Column(
                    children: <Widget>[
                      const Icon(Icons.monetization_on),
                      const SizedBox(height: 8.0),
                      Text(
                        widget.place.ticketPrice,
                        style: informationTextStyle,
                      ),
                    ],
                  ),
                ],
              ),
            ),
            // Display Rating
            Container(
              margin: const EdgeInsets.symmetric(vertical: 16.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  const Text(
                    'Rating tempat: ',
                    style: TextStyle(fontSize: 16.0),
                  ),
                  Row(
                    children: List.generate(widget.place.rating, (index) {
                      return const Icon(
                        Icons.star,
                        color: Colors.amber,
                      );
                    }),
                  ),
                ],
              ),
            ),
            // Description
            Container(
              padding: const EdgeInsets.all(16.0),
              child: Text(
                widget.place.description,
                textAlign: TextAlign.center,
                style: const TextStyle(
                  fontSize: 16.0,
                  fontFamily: 'Oxygen',
                ),
              ),
            ),
            // Facilities
            Container(
              padding: const EdgeInsets.all(16.0),
              margin: const EdgeInsets.only(top: 16.0),
              child: Column(
                children: [
                  const Text(
                    'Fasilitas',
                    style: TextStyle(
                      fontSize: 20.0,
                      fontFamily: 'Staatliches',
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 8.0),
                  Center(
                    child: Text(
                      widget.place.facility,
                      style: const TextStyle(
                        fontSize: 16.0,
                        fontFamily: 'Oxygen',
                        fontWeight: FontWeight.bold,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ],
              ),
            ),
            // Review Form
            Container(
              padding: const EdgeInsets.all(16.0),
              margin: const EdgeInsets.only(top: 16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Tambahkan Ulasan',
                    style: TextStyle(
                      fontSize: 20.0,
                      fontFamily: 'Staatliches',
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 8.0),
                  TextField(
                    controller: _reviewController,
                    decoration: const InputDecoration(
                      labelText: 'Masukkan ulasan Anda',
                      border: OutlineInputBorder(),
                    ),
                  ),
                  const SizedBox(height: 8.0),
                  ElevatedButton(
                    onPressed: _addReview,
                    child: const Text('Kirim Ulasan'),
                  ),
                ],
              ),
            ),
            // Review List
            Container(
              padding: const EdgeInsets.all(16.0),
              margin: const EdgeInsets.only(top: 16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Ulasan Pengunjung',
                    style: TextStyle(
                      fontSize: 20.0,
                      fontFamily: 'Staatliches',
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 8.0),
                  ListView.builder(
                    shrinkWrap: true,
                    physics: NeverScrollableScrollPhysics(),
                    itemCount: _reviews.length,
                    itemBuilder: (context, index) {
                      final review = _reviews[index];
                      return ListTile(
                        leading: const Icon(Icons.person),
                        title: Text(review['name']!),
                        subtitle: Text(review['review']!),
                      );
                    },
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
