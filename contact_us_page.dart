import 'package:flutter/material.dart';

class ContactUsPage extends StatelessWidget {
  const ContactUsPage({super.key});

  Widget _buildHelpItem(String text) {
    return Column(
      children: [
        ListTile(
          title: Text(
            text,
            style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
          ),
          trailing: const Icon(Icons.arrow_forward_ios, size: 16),
          onTap: () {
            // TODO: Handle tap if needed
          },
        ),
        const Divider(thickness: 1),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Help'),
        backgroundColor: const Color.fromARGB(255, 0, 140, 255),
      ),
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [Color.fromARGB(255, 0, 140, 255), Colors.white],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            _buildHelpItem('How to Book?'),
            _buildHelpItem('How to find the complete address of the Property?'),
            _buildHelpItem('How to use/apply promo code?'),
            _buildHelpItem(
              'What are the standard check-in and check-out timings?',
            ),
            _buildHelpItem(
              'Are unmarried couples allowed to stay at Red Doorz?',
            ),
            const ListTile(
              title: Text(
                'If your query is regarding a booking then go to\nMy Bookings > select booking > click on Help.',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
              ),
            ),
            const SizedBox(height: 8),
            const Align(
              alignment: Alignment.centerLeft,
              child: Text(
                'For more information Click Here',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w700,
                  decoration: TextDecoration.underline,
                  color: Colors.blueAccent,
                ),
              ),
            ),
            const Spacer(),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton.icon(
                icon: const Icon(Icons.headset_mic),
                label: const Text('Still need help?'),
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color.fromARGB(255, 0, 140, 255),
                  padding: const EdgeInsets.symmetric(vertical: 16),
                  textStyle: const TextStyle(fontSize: 16),
                ),
                onPressed: () {
                  // TODO: Add navigation to support
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
