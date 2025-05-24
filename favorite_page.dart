import 'package:flutter/material.dart';
import 'apartment_details_page.dart';

class FavoritesPage extends StatefulWidget {
  final List<String> favorites;
  final Function(String) onFavoriteToggle;

  const FavoritesPage({
    super.key,
    required this.favorites,
    required this.onFavoriteToggle,
  });

  @override
  _FavoritesPageState createState() => _FavoritesPageState();
}

class _FavoritesPageState extends State<FavoritesPage> {
  final TextEditingController _searchController = TextEditingController();
  String _searchQuery = "";

  final Map<String, Map<String, dynamic>> apartmentData = {
    'Cozy Studio in Makati': {
      'imagePath': 'assets/Apart 1.jpg',
      'location': 'Makati City, Metro Manila',
      'price': '₱3,500/month',
      'description':
          'A stylish and compact studio perfect for professionals. Close to the business district and public transport. Includes Wi-Fi and air-conditioning.',
      'latitude': 14.5547,
      'longitude': 121.0244,
    },
    '2BR Apartment with Balcony': {
      'imagePath': 'assets/Apart 2.jpg',
      'location': 'Quezon City, Metro Manila',
      'price': '₱4,000/month',
      'description':
          'Spacious two-bedroom unit with a scenic balcony view. Great for small families or roommates. Walking distance to malls and schools.',
      'latitude': 14.6760,
      'longitude': 121.0437,
    },
    'Minimalist Apartment': {
      'imagePath': 'assets/Apart 3.jpg',
      'location': 'Cebu City',
      'price': '₱2,500/month',
      'description':
          'A modern, minimalist design located in a peaceful neighborhood. Features natural lighting and an open living space.',
      'latitude': 10.3157,
      'longitude': 123.8854,
    },
  };

  @override
  Widget build(BuildContext context) {
    final filteredFavorites =
        widget.favorites.where((title) {
          final data = apartmentData[title];
          if (data == null) return false;
          return title.toLowerCase().contains(_searchQuery.toLowerCase());
        }).toList();

    return Container(
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [
            Color.fromARGB(255, 0, 140, 255),
            Color.fromARGB(255, 255, 255, 255),
          ],
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Container(
              height: 40,
              width: 300,
              decoration: BoxDecoration(
                color: Colors.grey[200],
                borderRadius: BorderRadius.circular(12),
                border: Border.all(color: Colors.blueAccent, width: 2),
              ),
              child: TextField(
                controller: _searchController,
                decoration: InputDecoration(
                  hintText: 'Search favorites...',
                  hintStyle: TextStyle(color: Colors.grey[600]),
                  prefixIcon: Icon(Icons.search, color: Colors.blueAccent),
                  border: InputBorder.none,
                  contentPadding: const EdgeInsets.symmetric(vertical: 12),
                ),
                onChanged: (value) {
                  setState(() {
                    _searchQuery = value;
                  });
                },
              ),
            ),
          ),
          if (filteredFavorites.isEmpty)
            const Expanded(
              child: Center(
                child: Text(
                  "No favorites found.",
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ),
          if (filteredFavorites.isNotEmpty)
            Expanded(
              child: ListView.builder(
                padding: const EdgeInsets.all(16),
                itemCount: filteredFavorites.length,
                itemBuilder: (context, index) {
                  final title = filteredFavorites[index];
                  final data = apartmentData[title];
                  if (data == null) return const SizedBox();

                  return GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder:
                              (context) => ApartmentDetailsPage(
                                imagePath: data['imagePath']!,
                                title: title,
                                location: data['location']!,
                                price: data['price']!,
                                description: data['description']!,
                                ownerName: 'John Doe',
                                latitude: data['latitude'],
                                longitude: data['longitude'],
                              ),
                        ),
                      );
                    },
                    child: Container(
                      margin: const EdgeInsets.only(bottom: 16),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(16),
                        boxShadow: const [
                          BoxShadow(
                            color: Colors.grey,
                            spreadRadius: 1,
                            blurRadius: 6,
                            offset: Offset(0, 4),
                          ),
                        ],
                        border: Border.all(color: Colors.grey.shade300),
                      ),
                      child: Row(
                        children: [
                          ClipRRect(
                            borderRadius: const BorderRadius.only(
                              topLeft: Radius.circular(16),
                              bottomLeft: Radius.circular(16),
                            ),
                            child: Image.asset(
                              data['imagePath']!,
                              width: 200,
                              height: 150,
                              fit: BoxFit.fill,
                            ),
                          ),
                          Expanded(
                            child: Padding(
                              padding: const EdgeInsets.symmetric(
                                horizontal: 12,
                                vertical: 10.0,
                              ),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    title,
                                    style: const TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold,
                                    ),
                                    maxLines: 2,
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                  const SizedBox(height: 4),
                                  Text(
                                    data['location']!,
                                    style: const TextStyle(
                                      color: Colors.black87,
                                    ),
                                  ),
                                  const SizedBox(height: 6),
                                  Text(
                                    data['price']!,
                                    style: const TextStyle(
                                      color: Color(0xFFFF0000),
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(right: 8.0),
                            child: IconButton(
                              icon: const Icon(
                                Icons.favorite,
                                color: Color(0xFFEC008C),
                              ),
                              onPressed: () => widget.onFavoriteToggle(title),
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
        ],
      ),
    );
  }
}
