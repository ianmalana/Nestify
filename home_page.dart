import 'package:flutter/material.dart';
import 'menu_page.dart';
import 'apartment_details_page.dart';
import 'favorite_page.dart';

// Reusable ApartmentCard for grid layout
class ApartmentCard extends StatelessWidget {
  final String imagePath;
  final String title;
  final String location;
  final String price;
  final VoidCallback? onTap;
  final VoidCallback? onFavorite;
  final bool isFavorite;

  const ApartmentCard({
    super.key,
    required this.imagePath,
    required this.title,
    required this.location,
    required this.price,
    this.onTap,
    this.onFavorite,
    this.isFavorite = false,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Card(
        elevation: 4,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.vertical(top: Radius.circular(12)),
                  child: AspectRatio(
                    // keep the same image ratio but let it flex to the card’s width
                    aspectRatio: 500 / 200,
                    child: Image.asset(
                      imagePath,
                      width: double.infinity,
                      fit: BoxFit.fill,
                    ),
                  ),
                ),
                Positioned(
                  top: 4,
                  right: 4,
                  child: IconButton(
                    icon: Icon(
                      isFavorite ? Icons.favorite : Icons.favorite_border,
                      color: Color(0xFFEC008C),
                      size: 20,
                    ),
                    onPressed: onFavorite,
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(5),
              child: Text(
                title,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 5),
              child: Text(
                location,
                maxLines: 1,
                style: TextStyle(
                  fontSize: 12,
                  color: Color.fromARGB(255, 0, 0, 0),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(5),
              child: Text(
                price,
                style: TextStyle(
                  fontWeight: FontWeight.w600,
                  color: Color.fromARGB(255, 255, 0, 0),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// HomePage
class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedIndex = 0;
  final List<String> _favoriteTitles = [];
  bool _isOnListingsPage = true;
  final TextEditingController _searchController = TextEditingController();
  String _searchQuery = "";

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
      _isOnListingsPage = index == 0;
    });
  }

  void _toggleFavorite(String title) {
    setState(() {
      if (_favoriteTitles.contains(title)) {
        _favoriteTitles.remove(title);
      } else {
        _favoriteTitles.add(title);
      }
    });
  }

  List<Widget> get _pages => [
    ListingsPage(
      onFavoriteToggle: _toggleFavorite,
      favorites: _favoriteTitles,
      searchQuery: _searchQuery,
    ),
    FavoritesPage(
      favorites: _favoriteTitles,
      onFavoriteToggle: _toggleFavorite,
    ),
    ProfilePage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          children: [
            Icon(Icons.maps_home_work_rounded, color: Colors.white),
            SizedBox(width: 8),
            Text('Nestify', style: TextStyle(color: Colors.white)),
          ],
        ),
        backgroundColor: Color.fromARGB(255, 0, 51, 255),
        automaticallyImplyLeading: false,
        actions: [
          if (_isOnListingsPage)
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Container(
                height: 40,
                width: 250,
                decoration: BoxDecoration(
                  color: const Color.fromARGB(255, 255, 255, 255),
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(
                    color: const Color.fromARGB(255, 0, 0, 0),
                    width: 2,
                  ),
                ),
                child: TextField(
                  controller: _searchController,
                  decoration: InputDecoration(
                    hintText: 'Search apartments...',
                    hintStyle: TextStyle(
                      color: const Color.fromARGB(255, 0, 0, 0),
                    ),
                    prefixIcon: Icon(
                      Icons.search,
                      color: const Color.fromARGB(255, 0, 0, 255),
                    ),
                    border: InputBorder.none,
                    contentPadding: EdgeInsets.symmetric(vertical: 12),
                  ),
                  onChanged: (value) {
                    setState(() {
                      _searchQuery = value;
                    });
                  },
                ),
              ),
            ),
        ],
      ),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [Colors.blue[100]!, Colors.purple[100]!],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: _pages[_selectedIndex],
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Apartments'),
          BottomNavigationBarItem(
            icon: Icon(Icons.favorite),
            label: 'Favorites',
          ),
          BottomNavigationBarItem(icon: Icon(Icons.menu), label: 'Menu'),
        ],
        currentIndex: _selectedIndex,
        unselectedItemColor: const Color.fromARGB(255, 104, 104, 104),
        selectedItemColor: Color.fromARGB(255, 0, 38, 255),
        onTap: _onItemTapped,
      ),
    );
  }
}

// ListingsPage with Gradient Background
class ListingsPage extends StatelessWidget {
  final Function(String) onFavoriteToggle;
  final List<String> favorites;
  final String searchQuery;

  ListingsPage({
    super.key,
    required this.onFavoriteToggle,
    required this.favorites,
    required this.searchQuery,
  });

  final List<Map<String, dynamic>> apartments = [
    {
      'title': 'Cozy Studio in Makati',
      'imagePath': 'assets/Apart 1.jpg',
      'location': 'Makati City, Metro Manila',
      'price': '₱3,500/month',
      'description': 'A stylish and compact studio perfect for professionals.',
      'latitude': 14.5547,
      'longitude': 121.0244,
    },
    {
      'title': '2BR Apartment with Balcony',
      'imagePath': 'assets/Apart 2.jpg',
      'location': 'Quezon City, Metro Manila',
      'price': '₱4,000/month',
      'description': 'Spacious two-bedroom unit with a scenic balcony view.',
      'latitude': 14.6760,
      'longitude': 121.0437,
    },
    {
      'title': 'Minimalist Apartment',
      'imagePath': 'assets/Apart 3.jpg',
      'location': 'Cebu City',
      'price': '₱2,500/month',
      'description':
          'A modern, minimalist design located in a peaceful neighborhood.',
      'latitude': 10.3157,
      'longitude': 123.8854,
    },
  ];

  @override
  Widget build(BuildContext context) {
    final filteredApartments =
        apartments.where((apt) {
          final title = apt['title']!.toLowerCase();
          final location = apt['location']!.toLowerCase();
          return title.contains(searchQuery.toLowerCase()) ||
              location.contains(searchQuery.toLowerCase());
        }).toList();

    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [
            Color.fromARGB(255, 0, 140, 255), // Light blue
            Color.fromARGB(255, 255, 255, 255), // Light purple
          ],
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
        ),
      ),
      child: Column(
        children: [
          Expanded(
            child: GridView.builder(
              padding: const EdgeInsets.all(12),
              itemCount: filteredApartments.length,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3,
                mainAxisSpacing: 20,
                crossAxisSpacing: 20,
                childAspectRatio: 1.5,
              ),
              itemBuilder: (context, index) {
                final apt = filteredApartments[index];
                return ApartmentCard(
                  imagePath: apt['imagePath']!,
                  title: apt['title']!,
                  location: apt['location']!,
                  price: apt['price']!,
                  isFavorite: favorites.contains(apt['title']),
                  onFavorite: () => onFavoriteToggle(apt['title']!),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder:
                            (context) => ApartmentDetailsPage(
                              imagePath: apt['imagePath']!,
                              title: apt['title']!,
                              location: apt['location']!,
                              price: apt['price']!,
                              description: apt['description']!,
                              ownerName: 'John Doe',
                              latitude: apt['latitude'],
                              longitude: apt['longitude'],
                            ),
                      ),
                    );
                  },
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
