import 'package:flutter/material.dart';

class NestClubPage extends StatefulWidget {
  const NestClubPage({super.key});

  @override
  State<NestClubPage> createState() => _NestClubPageState();
}

class _NestClubPageState extends State<NestClubPage> {
  final PageController _pageController = PageController();
  int _currentIndex = 0;

  final List<MembershipCard> cards = [
    MembershipCard(
      imagePath: 'assets/Bronze.jpg',
      title: 'NestClub Bronze',
      description: 'Extra discount up to 12%',
      benefits: ['Extra discount up to 12%', 'No priority support'],
    ),
    MembershipCard(
      imagePath: 'assets/Silver.jpg',
      title: 'NestClub Silver',
      description: 'Extra discount up to 15%',
      benefits: ['Extra discount up to 15%', 'No priority support'],
    ),
    MembershipCard(
      imagePath: 'assets/Gold.jpg',
      title: 'NestClub Gold',
      description: 'Extra discount up to 20% + Priority Support',
      benefits: ['Extra discount up to 20%', 'Priority support'],
    ),
    MembershipCard(
      imagePath: 'assets/Diamond.jpg',
      title: 'NestClub Diamond',
      description:
          'Extra discount up to 25% + Priority Support & Exclusive Offers',
      benefits: [
        'Extra discount up to 25%',
        'Priority support',
        'Exclusive offers',
      ],
    ),
  ];

  void _goToNextCard() {
    if (_currentIndex < cards.length - 1) {
      _pageController.animateToPage(
        _currentIndex + 1,
        duration: const Duration(milliseconds: 400),
        curve: Curves.easeInOut,
      );
    }
  }

  void _goToPreviousCard() {
    if (_currentIndex > 0) {
      _pageController.animateToPage(
        _currentIndex - 1,
        duration: const Duration(milliseconds: 400),
        curve: Curves.easeInOut,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      appBar: AppBar(
        title: const Text('NESTCLUB Membership'),
        centerTitle: true,
        flexibleSpace: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [
                Color.fromARGB(255, 66, 142, 255),
                Color.fromARGB(255, 66, 142, 255),
              ],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
          ),
        ),
      ),
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Color.fromARGB(255, 66, 142, 255),
              Color.fromARGB(255, 255, 255, 255),
            ],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: SingleChildScrollView(
          child: Column(
            children: [
              const SizedBox(height: 16),

              // Swipeable Cards
              SizedBox(
                height: 300,
                child: PageView.builder(
                  controller: _pageController,
                  itemCount: cards.length,
                  onPageChanged: (index) {
                    setState(() {
                      _currentIndex = index;
                    });
                  },
                  itemBuilder: (context, index) {
                    final card = cards[index];
                    return Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 100),
                      child: Card(
                        elevation: 20,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(16),
                        ),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(16),
                          child: Image.asset(card.imagePath, fit: BoxFit.fill),
                        ),
                      ),
                    );
                  },
                ),
              ),

              const SizedBox(height: 16),

              // Indicator dots
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: List.generate(cards.length, (index) {
                  return Container(
                    margin: const EdgeInsets.symmetric(horizontal: 4),
                    width: _currentIndex == index ? 14 : 10,
                    height: _currentIndex == index ? 14 : 10,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color:
                          _currentIndex == index
                              ? const Color.fromARGB(255, 0, 8, 255)
                              : const Color.fromARGB(255, 67, 111, 255),
                    ),
                  );
                }),
              ),

              const SizedBox(height: 8),

              // Previous and Next Buttons (Modified with arrows)
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ElevatedButton(
                    onPressed: _currentIndex > 0 ? _goToPreviousCard : null,
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color.fromARGB(255, 44, 132, 255),
                      shape: const CircleBorder(),
                      padding: const EdgeInsets.all(12),
                    ),
                    child: const Icon(Icons.arrow_back, color: Colors.white),
                  ),
                  const SizedBox(width: 16),
                  ElevatedButton(
                    onPressed:
                        _currentIndex < cards.length - 1 ? _goToNextCard : null,
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color.fromARGB(255, 38, 0, 255),
                      shape: const CircleBorder(),
                      padding: const EdgeInsets.all(12),
                    ),
                    child: const Icon(Icons.arrow_forward, color: Colors.white),
                  ),
                ],
              ),

              const SizedBox(height: 24),

              // Benefits title with icon, left aligned
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 32.0),
                child: Row(
                  children: [
                    const Icon(
                      Icons.card_membership,
                      color: Color.fromARGB(255, 0, 13, 255),
                    ),
                    const SizedBox(width: 8),
                    Text(
                      '${cards[_currentIndex].title} Benefits',
                      style: const TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 12),

              // Benefits list
              ListView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                padding: const EdgeInsets.symmetric(horizontal: 32),
                itemCount: cards[_currentIndex].benefits.length,
                itemBuilder: (context, index) {
                  final benefit = cards[_currentIndex].benefits[index];
                  final isPositive =
                      !benefit.toLowerCase().contains('no') &&
                      !benefit.toLowerCase().contains('cancel');

                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      ListTile(
                        leading: Icon(
                          isPositive ? Icons.check_circle : Icons.cancel,
                          color: isPositive ? Colors.green : Colors.red,
                        ),
                        title: Text(
                          benefit,
                          style: TextStyle(
                            fontSize: 16,
                            color: isPositive ? Colors.black : Colors.grey[700],
                          ),
                        ),
                      ),
                      const Padding(
                        padding: EdgeInsets.symmetric(horizontal: 50),
                        child: Divider(
                          color: Color.fromARGB(66, 0, 0, 0),
                          thickness: 1,
                          height: 0,
                        ),
                      ),
                    ],
                  );
                },
              ),

              // Bottom explanatory text
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Text(
                  'How NestClub Works?\n'
                  'NestClub is a loyalty program by NESTIFY where Top Tier members are upgraded with each stays and earn points. '
                  'These points can be redeemed for discount vouchers on marketplace. With tiers like Bronze, Silver, Gold, and Diamond, '
                  'members unlock increasing rewards and exclusive perks, enhancing their staying experience.',
                  style: const TextStyle(fontSize: 14, color: Colors.black87),
                  textAlign: TextAlign.justify,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class MembershipCard {
  final String imagePath;
  final String title;
  final String description;
  final List<String> benefits;

  MembershipCard({
    required this.imagePath,
    required this.title,
    required this.description,
    required this.benefits,
  });
}
