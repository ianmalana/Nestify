import 'package:flutter/material.dart';

class FAQPage extends StatelessWidget {
  const FAQPage({super.key});

  @override
  Widget build(BuildContext context) {
    final List<Map<String, String>> faqItems = [
      {
        'question':
            'What kind of facilities do I get while staying at Nestify?',
        'answer': '''Facilities you get when staying at RedDoorz:
1) Clean Linen
2) Clean Bathroom
3) Amenities
4) TV
5) Free WiFi
6) Mineral Water''',
      },
      {
        'question': 'How to book RedDoorz property?',
        'answer':
            'Booking can be made through website www.reddoorz.com or mobile app which can be downloaded in Play Store.',
      },
      {
        'question':
            'What kinds of payment methods are available to complete the booking transaction?',
        'answer':
            'You can make a payment using: Bank Transfer /ATM, Credit Card, In-store Payment (Alfamart), Doku Wallet, Kredivo & Pay at Hotel.',
      },
      {
        'question': 'Where can I find the detailed property direction?',
        'answer':
            'Detailed property direction can be found by inputting the property address and coordinate on smartphone GPS application. Address details can also be seen from the sent booking voucher.',
      },
      {
        'question': 'Where can I find the property address?',
        'answer':
            'The property address can be found on the upper part of the property detail. For convenience, it is also available in the booking voucher.',
      },
      {
        'question': 'Is there any other thing should be prepared for check-in?',
        'answer':
            'Things to be prepared for check-in:\n1. You should present a valid ID and the booking confirmation at the reception.',
      },
    ];

    return Scaffold(
      appBar: AppBar(
        title: const Text('FAQ'),
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
        padding: const EdgeInsets.all(16),
        child: ListView.builder(
          itemCount: faqItems.length,
          itemBuilder: (context, index) {
            final item = faqItems[index];
            return Card(
              margin: const EdgeInsets.symmetric(vertical: 8),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
              elevation: 3,
              child: ExpansionTile(
                tilePadding: const EdgeInsets.symmetric(horizontal: 16),
                title: Text(
                  item['question']!,
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                  ),
                ),
                children: [
                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Text(
                      item['answer']!,
                      style: const TextStyle(fontSize: 15),
                    ),
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
