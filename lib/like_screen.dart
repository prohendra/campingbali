import 'package:flutter/material.dart';
import 'package:campingbali/model/tourism_place.dart';

class LikeScreen extends StatefulWidget {
  final List<TourismPlace> likedPlaces;

  const LikeScreen({super.key, required this.likedPlaces});

  @override
  _LikeScreenState createState() => _LikeScreenState();
}

class _LikeScreenState extends State<LikeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Tempat yang Disukai'),
      ),
      body: widget.likedPlaces.isEmpty
          ? const Center(
              child: Text('Belum ada tempat yang disukai'),
            )
          : ListView.builder(
              itemCount: widget.likedPlaces.length,
              itemBuilder: (context, index) {
                final place = widget.likedPlaces[index];
                return ListTile(
                  leading: Image.asset(
                    place.imageAsset,
                    width: 50,
                    height: 50,
                    fit: BoxFit.cover,
                  ),
                  title: Text(place.name),
                  subtitle: Text(place.location),
                  trailing: IconButton(
                    icon: const Icon(Icons.delete),
                    onPressed: () {
                      setState(() {
                        widget.likedPlaces.removeAt(index);
                      });
                    },
                  ),
                );
              },
            ),
    );
  }
}
