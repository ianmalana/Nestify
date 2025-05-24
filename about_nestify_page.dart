import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class AboutNestifyPage extends StatelessWidget {
  const AboutNestifyPage({super.key});

  void _launchEmail() async {
    final Uri emailLaunchUri = Uri(
      scheme: 'mailto',
      path: 'support@nestify.com',
    );
    launchUrl(emailLaunchUri);
  }

  void _launchPhone() async {
    final Uri phoneLaunchUri = Uri(scheme: 'tel', path: '+1234567890');
    launchUrl(phoneLaunchUri);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('About Nestify'),
        backgroundColor: const Color.fromARGB(255, 0, 140, 255),
      ),
      body: Container(
        width: double.infinity,
        height: double.infinity,
        padding: const EdgeInsets.all(24.0),
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [Color.fromARGB(255, 0, 140, 255), Colors.white],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Icon(Icons.home, size: 60, color: Colors.blue),
              const SizedBox(height: 16),
              const Text(
                'Nestify: Find your perfect nest effortlessly',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Colors.black87,
                ),
              ),
              const SizedBox(height: 16),
              const Text(
                'Nestify connects travelers with handpicked homes across the globe. Whether it’s a weekend retreat or a month-long relocation, we bring you a homey experience combined with modern convenience. Our platform builds trust through verified listings, secure payments, and 24/7 support.',
                style: TextStyle(fontSize: 16, color: Colors.black87),
              ),
              const SizedBox(height: 24),
              const Row(
                children: [
                  Icon(Icons.flag, color: Colors.black87),
                  SizedBox(width: 8),
                  Text(
                    'Our Mission',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.black87,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 8),
              const Text(
                'To simplify travel by offering seamless, reliable, and inspiring stays everywhere you go.',
                style: TextStyle(fontSize: 16),
              ),
              const SizedBox(height: 24),
              const Row(
                children: [
                  Icon(Icons.star, color: Colors.black87),
                  SizedBox(width: 8),
                  Text(
                    'Why Choose Nestify?',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.black87,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 8),
              const Text(
                '• Curated listings that meet quality standards\n'
                '• Instant and secure booking\n'
                '• Friendly customer support\n'
                '• Verified hosts and real-time updates',
                style: TextStyle(fontSize: 16),
              ),
              const SizedBox(height: 24),
              const Row(
                children: [
                  Icon(Icons.contact_mail, color: Colors.black87),
                  SizedBox(width: 8),
                  Text(
                    'Get in Touch',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.black87,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 8),
              GestureDetector(
                onTap: _launchEmail,
                child: const Text(
                  'Email: support@nestify.com',
                  style: TextStyle(
                    fontSize: 16,
                    decoration: TextDecoration.underline,
                    color: Colors.blue,
                  ),
                ),
              ),
              const SizedBox(height: 4),
              GestureDetector(
                onTap: _launchPhone,
                child: const Text(
                  'Phone: +123-456-7890',
                  style: TextStyle(
                    fontSize: 16,
                    decoration: TextDecoration.underline,
                    color: Colors.blue,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
