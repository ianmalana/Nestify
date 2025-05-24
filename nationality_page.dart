import 'package:flutter/material.dart';

class NationalityPage extends StatefulWidget {
  const NationalityPage({super.key});

  @override
  State<NationalityPage> createState() => _NationalityPageState();
}

class _NationalityPageState extends State<NationalityPage> {
  final List<String> _allNationalities = [
    'American',
    'British',
    'Canadian',
    'Chinese',
    'Dutch',
    'French',
    'German',
    'Indian',
    'Indonesian',
    'Italian',
    'Japanese',
    'Korean',
    'Mexican',
    'Nigerian',
    'Russian',
    'Spanish',
    'Swedish',
    'Thai',
    'Turkish',
    'Vietnamese',
    'Australian',
    'Brazilian',
    'Egyptian',
    'Filipino',
    'Greek',
    'Hungarian',
    'Iraqi',
    'Israeli',
    'Pakistani',
    'Saudi Arabian',
    'South African',
    'UAE',
    'Argentinian',
    'Colombian',
    'Danish',
    'Finnish',
    'Norwegian',
  ];

  String _searchQuery = '';
  String? _selectedNationality;

  @override
  Widget build(BuildContext context) {
    List<String> filteredNationalities =
        _allNationalities
            .where((n) => n.toLowerCase().contains(_searchQuery.toLowerCase()))
            .toList();

    return Scaffold(
      appBar: AppBar(
        title: const Text('Nationality'),
        backgroundColor: const Color.fromARGB(255, 0, 140, 255),
      ),
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [Color.fromARGB(255, 0, 140, 255), Colors.white],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: Column(
          children: [
            // Search Bar
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextField(
                decoration: InputDecoration(
                  hintText: 'Search nationality',
                  filled: true,
                  fillColor: Colors.white,
                  prefixIcon: const Icon(Icons.search),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12.0),
                  ),
                ),
                onChanged: (value) {
                  setState(() {
                    _searchQuery = value;
                  });
                },
              ),
            ),
            // List of nationalities
            Expanded(
              child: ListView.separated(
                itemCount: filteredNationalities.length,
                separatorBuilder:
                    (context, index) => const Divider(height: 1, thickness: 1),
                itemBuilder: (context, index) {
                  final nationality = filteredNationalities[index];
                  final isSelected = nationality == _selectedNationality;

                  return ListTile(
                    title: Text(nationality),
                    trailing:
                        isSelected
                            ? const Icon(
                              Icons.check,
                              color: Color.fromARGB(255, 0, 0, 0),
                            )
                            : null,
                    onTap: () {
                      setState(() {
                        _selectedNationality = nationality;
                      });
                    },
                  );
                },
              ),
            ),
            // Done button
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color.fromARGB(255, 0, 140, 255),
                    padding: const EdgeInsets.symmetric(vertical: 16.0),
                  ),
                  onPressed: () {
                    if (_selectedNationality != null) {
                      Navigator.pop(context, _selectedNationality);
                    }
                  },
                  child: const Text('Done', style: TextStyle(fontSize: 16)),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
