import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class ApartmentDetailsPage extends StatelessWidget {
  final String imagePath;
  final String title;
  final String location;
  final String price;
  final String description;
  final String ownerName;
  final double latitude;
  final double longitude;

  const ApartmentDetailsPage({
    super.key,
    required this.imagePath,
    required this.title,
    required this.location,
    required this.price,
    required this.description,
    required this.ownerName,
    required this.latitude,
    required this.longitude,
  });

  @override
  Widget build(BuildContext context) {
    final CameraPosition initialCameraPosition = CameraPosition(
      target: LatLng(latitude, longitude),
      zoom: 14,
    );

    return Scaffold(
      appBar: AppBar(
        title: Text('Apartment Details', style: TextStyle(color: Colors.white)),
        backgroundColor: const Color.fromARGB(255, 0, 4, 255),
      ),
      body: Row(
        children: [
          /// Left Side – Apartment Details
          Expanded(
            flex: 1,
            child: SingleChildScrollView(
              child: Column(
                children: [
                  Image.asset(
                    imagePath,
                    width: double.infinity,
                    height: 500,
                    fit: BoxFit.fill,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          title,
                          style: const TextStyle(
                            fontSize: 22,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(height: 8),
                        Row(
                          children: [
                            Icon(Icons.location_on, color: Colors.grey[700]),
                            const SizedBox(width: 4),
                            Text(location),
                          ],
                        ),
                        const SizedBox(height: 12),
                        Text(
                          price,
                          style: const TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: Colors.red,
                          ),
                        ),
                        const SizedBox(height: 16),
                        const Text(
                          'Description',
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(height: 8),
                        Text(
                          description,
                          style: const TextStyle(
                            fontSize: 16,
                            color: Colors.black,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),

          /// Right Side – Google Map
          Expanded(
            flex: 1,
            child: Container(
              color: Colors.white,
              child: GoogleMap(
                initialCameraPosition: initialCameraPosition,
                markers: {
                  Marker(
                    markerId: MarkerId('aptLocation'),
                    position: LatLng(latitude, longitude),
                    infoWindow: InfoWindow(title: title),
                  ),
                },
                myLocationEnabled: false,
                zoomControlsEnabled: true,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
