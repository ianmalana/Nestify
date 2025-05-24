import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';

class RegisterBusinessPage extends StatefulWidget {
  const RegisterBusinessPage({super.key});

  @override
  State<RegisterBusinessPage> createState() => _RegisterBusinessPageState();
}

class _RegisterBusinessPageState extends State<RegisterBusinessPage> {
  final _formKey = GlobalKey<FormState>();
  String? businessName, email, phone, address;
  File? _imageFile;
  bool _submitted = false;

  Future<void> _pickImage() async {
    final picked = await ImagePicker().pickImage(source: ImageSource.gallery);
    if (picked != null) {
      setState(() {
        _imageFile = File(picked.path);
      });
    }
  }

  void _submitForm() {
    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save();

      // Simulate submission
      setState(() {
        _submitted = true;
      });

      // Optional: Show snackbar
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(const SnackBar(content: Text('Submitted Successfully')));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Register Your Business'),
        centerTitle: true,
        backgroundColor: const Color.fromARGB(255, 0, 13, 255),
      ),
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Color.fromARGB(255, 0, 98, 255),
              Color.fromARGB(255, 255, 255, 255),
            ],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: SingleChildScrollView(
            child: Column(
              children: [
                Form(
                  key: _formKey,
                  child: Column(
                    children: [
                      // Logo Upload
                      GestureDetector(
                        onTap: _pickImage,
                        child: CircleAvatar(
                          radius: 50,
                          backgroundColor: Colors.white,
                          backgroundImage:
                              _imageFile != null
                                  ? FileImage(_imageFile!)
                                  : null,
                          child:
                              _imageFile == null
                                  ? const Icon(
                                    Icons.camera_alt,
                                    size: 40,
                                    color: Color.fromARGB(255, 0, 0, 0),
                                  )
                                  : null,
                        ),
                      ),
                      const SizedBox(height: 20),

                      // Business Name
                      TextFormField(
                        decoration: const InputDecoration(
                          prefixIcon: Icon(
                            Icons.business,
                            color: Color.fromARGB(255, 0, 0, 0),
                          ),
                          labelText: 'Business Name',
                          filled: true,
                          fillColor: Colors.white,
                        ),
                        onSaved: (value) => businessName = value,
                        validator:
                            (value) =>
                                value!.isEmpty ? 'Enter business name' : null,
                      ),
                      const SizedBox(height: 16),

                      // Email
                      TextFormField(
                        decoration: const InputDecoration(
                          prefixIcon: Icon(
                            Icons.email,
                            color: Color.fromARGB(255, 0, 0, 0),
                          ),
                          labelText: 'Email',
                          filled: true,
                          fillColor: Colors.white,
                        ),
                        onSaved: (value) => email = value,
                        validator:
                            (value) => value!.isEmpty ? 'Enter email' : null,
                      ),
                      const SizedBox(height: 16),

                      // Phone
                      TextFormField(
                        decoration: const InputDecoration(
                          prefixIcon: Icon(
                            Icons.phone,
                            color: Color.fromARGB(255, 0, 0, 0),
                          ),
                          labelText: 'Phone',
                          filled: true,
                          fillColor: Colors.white,
                        ),
                        onSaved: (value) => phone = value,
                        validator:
                            (value) =>
                                value!.isEmpty ? 'Enter phone number' : null,
                      ),
                      const SizedBox(height: 16),

                      // Address
                      TextFormField(
                        decoration: const InputDecoration(
                          prefixIcon: Icon(
                            Icons.location_on,
                            color: Color.fromARGB(255, 0, 0, 0),
                          ),
                          labelText: 'Address',
                          filled: true,
                          fillColor: Colors.white,
                        ),
                        onSaved: (value) => address = value,
                        validator:
                            (value) => value!.isEmpty ? 'Enter address' : null,
                      ),
                      const SizedBox(height: 30),

                      ElevatedButton.icon(
                        onPressed: _submitForm,
                        icon: const Icon(Icons.send),
                        label: const Text('Submit'),
                        style: ElevatedButton.styleFrom(
                          backgroundColor: const Color.fromARGB(
                            255,
                            13,
                            0,
                            255,
                          ),
                          foregroundColor: const Color.fromARGB(
                            255,
                            255,
                            255,
                            255,
                          ),
                          padding: const EdgeInsets.symmetric(
                            vertical: 14,
                            horizontal: 30,
                          ),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 30),

                // Confirmation message
                if (_submitted)
                  Container(
                    padding: const EdgeInsets.all(20),
                    decoration: BoxDecoration(
                      color: const Color.fromARGB(
                        255,
                        0,
                        21,
                        255,
                      ).withOpacity(0.9),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: const Text(
                      'Wait 24 hours for confirmation.\nWe’re still reviewing your submission.',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 16,
                        color: Color.fromARGB(255, 255, 255, 255),
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
