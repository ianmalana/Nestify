import 'package:flutter/material.dart';

class ProfileDetailsPage extends StatelessWidget {
  const ProfileDetailsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Edit Profile'),
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
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(16),
          child: Column(
            children: [
              const CircleAvatar(
                radius: 60,
                backgroundImage: AssetImage('assets/Sins.jpg'),
              ),
              const SizedBox(height: 8),
              const Text(
                'Prelian Malana',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 4),
              LinearProgressIndicator(
                value: 0,
                backgroundColor: Colors.grey[300],
                valueColor: const AlwaysStoppedAnimation<Color>(Colors.blue),
              ),
              const SizedBox(height: 8),
              const Text("0% Profile Completed"),
              const SizedBox(height: 16),
              buildTextField(label: "Name", hint: "Prelian Malana"),
              buildTextField(
                label: "Date of Birth",
                hint: "Select date of birth",
              ),
              buildDropdown(label: "Gender", items: ["Male", "Female"]),
              buildDropdown(
                label: "Marital Status",
                items: ["Single", "Married"],
              ),
              buildTextField(label: "Hometown", hint: "Type Your Hometown"),
              buildTextField(
                label: "Current City",
                hint: "Current City",
                icon: Icons.my_location,
              ),
              buildDropdown(
                label: "Travel type",
                items: ["Business", "Leisure"],
              ),
              buildTextField(label: "Phone", hint: "Enter Phone Number"),
              const SizedBox(height: 16),
              Row(
                children: [
                  Expanded(
                    child: Text("Subscribe to Newsletter & Latest Offers"),
                  ),
                  Switch(value: true, onChanged: (_) {}),
                ],
              ),
              const SizedBox(height: 16),
              ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(backgroundColor: Colors.grey),
                child: const Text("Save Profile"),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildTextField({
    required String label,
    required String hint,
    IconData? icon,
  }) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: TextField(
        decoration: InputDecoration(
          labelText: label,
          hintText: hint,
          suffixIcon: icon != null ? Icon(icon) : null,
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(8)),
          filled: true,
          fillColor: Colors.white,
        ),
      ),
    );
  }

  Widget buildDropdown({required String label, required List<String> items}) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: DropdownButtonFormField<String>(
        decoration: InputDecoration(
          labelText: label,
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(8)),
          filled: true,
          fillColor: Colors.white,
        ),
        items:
            items.map((item) {
              return DropdownMenuItem<String>(value: item, child: Text(item));
            }).toList(),
        onChanged: (value) {},
      ),
    );
  }
}
