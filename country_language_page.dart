import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';

class CountryLanguagePage extends StatelessWidget {
  const CountryLanguagePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('title'.tr()), // Translated title
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
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'body'.tr(), // Translated body text
              style: const TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
            ),
            const SizedBox(height: 20),
            Text('select_language'.tr(), style: const TextStyle(fontSize: 16)),
            const SizedBox(height: 10),
            DropdownButton<Locale>(
              value: context.locale,
              icon: const Icon(Icons.language),
              onChanged: (Locale? newLocale) {
                if (newLocale != null) {
                  context.setLocale(newLocale);
                }
              },
              items: const [
                DropdownMenuItem(value: Locale('en'), child: Text('English')),
                DropdownMenuItem(value: Locale('es'), child: Text('Español')),
                DropdownMenuItem(value: Locale('fil'), child: Text('filipino')),
                DropdownMenuItem(value: Locale('jp'), child: Text('japanese')),
                DropdownMenuItem(value: Locale('chi'), child: Text('chinese')),
                DropdownMenuItem(value: Locale('kor'), child: Text('korean')),
                DropdownMenuItem(value: Locale('spa'), child: Text('spanish')),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
