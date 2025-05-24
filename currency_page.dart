import 'package:flutter/material.dart';

class CurrencyPage extends StatefulWidget {
  const CurrencyPage({super.key});

  @override
  State<CurrencyPage> createState() => _CurrencyPageState();
}

class _CurrencyPageState extends State<CurrencyPage> {
  final List<String> _currencies = [
    'USD',
    'EUR',
    'JPY',
    'GBP',
    'INR',
    'AUD',
    'CAD',
    'CHF',
    'CNY',
    'SEK',
    'NZD',
    'MXN',
    'SGD',
    'HKD',
    'NOK',
    'KRW',
    'TRY',
    'RUB',
    'ZAR',
    'BRL',
    'PLN',
    'THB',
    'AED',
    'MYR',
    'IDR',
    'PHP',
  ];
  String _selectedCurrency = 'USD';

  void _selectCurrency(String currency) {
    setState(() {
      _selectedCurrency = currency;
    });
    Navigator.pop(context, currency); // Send selected currency back
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Select Currency'),
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
        child: ListView.separated(
          itemCount: _currencies.length,
          separatorBuilder:
              (context, index) =>
                  const Divider(thickness: 1, height: 1, color: Colors.grey),
          itemBuilder: (context, index) {
            String currency = _currencies[index];
            bool isSelected = currency == _selectedCurrency;

            return ListTile(
              title: Text(currency, style: const TextStyle(fontSize: 18)),
              trailing:
                  isSelected
                      ? const Icon(
                        Icons.check,
                        color: Color.fromARGB(255, 0, 0, 0),
                      )
                      : null,
              onTap: () => _selectCurrency(currency),
            );
          },
        ),
      ),
    );
  }
}
