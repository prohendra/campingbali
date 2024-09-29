import 'package:flutter/material.dart';
import 'package:campingbali/detail_screen.dart';
import 'package:campingbali/model/tourism_place.dart';
import 'package:campingbali/login_screen.dart';
import 'package:campingbali/like_screen.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  TextEditingController _searchController = TextEditingController();
  List<TourismPlace> _filteredTourismPlaceList = tourismPlaceList;
  int _selectedIndex = 0; 
  List<TourismPlace> likedPlaces = []; 

  @override
  void initState() {
    super.initState();

    // Listen to the search controller for changes
    _searchController.addListener(() {
      filterPlaces();
    });
  }

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  void filterPlaces() {
    String query = _searchController.text.toLowerCase();
    setState(() {
      _filteredTourismPlaceList = tourismPlaceList.where((place) {
        return place.name.toLowerCase().contains(query) ||
            place.location.toLowerCase().contains(query);
      }).toList();
    });
  }

  Widget _buildContent() {
    if (_selectedIndex == 0) {
      return _buildHomeContent(); 
    } else {
      return LikeScreen(likedPlaces: likedPlaces); 
    }
  }

  Widget _buildHomeContent() {
    return Column(
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: TextField(
            controller: _searchController,
            decoration: InputDecoration(
              labelText: 'Cari Tempat',
              hintText: 'tempat/lokasi',
              prefixIcon: const Icon(Icons.search),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8.0),
              ),
            ),
          ),
        ),
        Expanded(
          child: GridView.builder(
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2, 
              crossAxisSpacing: 8, 
              mainAxisSpacing: 8, 
              childAspectRatio: 3 / 4, 
            ),
            itemBuilder: (context, index) {
              final TourismPlace place = _filteredTourismPlaceList[index];
              return InkWell(
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) {
                    return DetailScreen(place: place, likedPlaces: likedPlaces,);
                  }));
                },
                child: Card(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(10.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        AspectRatio(
                          aspectRatio: 3 / 2, 
                          child: Image.asset(
                            place.imageAsset,
                            fit: BoxFit.cover, 
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Text(
                                place.name,
                                style: const TextStyle(
                                  fontSize: 16.0,
                                  fontWeight: FontWeight.bold,
                                ),
                                softWrap: true,
                                overflow: TextOverflow.ellipsis,
                              ),
                              const SizedBox(height: 5),
                              Row(
                                children: List.generate(place.rating, (index) {
                                  return const Icon(
                                    Icons.star,
                                    color: Colors.amber,
                                    size: 16.0,
                                  );
                                }),
                              ),
                              const SizedBox(height: 5),
                              Text(
                                place.location,
                                style: const TextStyle(
                                  fontSize: 14.0,
                                  color: Colors.grey,
                                ),
                                softWrap: true,
                                textAlign: TextAlign.left,
                                overflow: TextOverflow.ellipsis,
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              );
            },
            itemCount: _filteredTourismPlaceList.length,
          ),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Builder(
          builder: (context) => IconButton(
            icon: const Icon(
              Icons.menu,
              color: Colors.black,
              size: 30,
            ),
            onPressed: () {
              Scaffold.of(context).openDrawer(); 
            },
          ),
        ),
        title: const Text(
          'Bali Camping',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: Colors.black,
          ),
        ),
        centerTitle: true, 
        backgroundColor: Colors.white, 
        elevation: 0, 
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            DrawerHeader(
              decoration: const BoxDecoration(
                color: Color.fromARGB(255, 148, 141, 251),
              ),
              child: const Text(
                'BALI CAMPING  Destinasi Tempat Hiling',
                style: TextStyle(
                  color: Color.fromARGB(255, 201, 198, 220),
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            ListTile(
              leading: const Icon(Icons.home),
              title: const Text('Home'),
              onTap: () {
                Navigator.pop(context); 
              },
            ),
            ListTile(
              leading: const Icon(Icons.logout, color: Colors.red),
              title: const Text(
                'Logout',
                style: TextStyle(
                  color: Colors.red, 
                  fontWeight: FontWeight.bold,
                ),
              ),
              onTap: () {
                Navigator.pop(context); 
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const LoginScreen(),
                  ),
                );
              },
            ),
          ],
        ),
      ),
      body: _buildContent(), 
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        onTap: (int index) {
          setState(() {
            _selectedIndex = index; 
          });
        },
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.favorite),
            label: 'Liked',
          ),
        ],
      ),
    );
  }
}
