import 'package:flutter/material.dart';
import 'package:nestify/pages/menu_page/faq_page.dart';
import 'package:nestify/pages/menu_page/reg_bussines_acc_page.dart';
import 'login_page.dart';
import 'menu_page/nestclub_page.dart';
import 'menu_page/inbox_page.dart';
import 'menu_page/country_language_page.dart';
import 'menu_page/currency_page.dart';
import 'menu_page/nationality_page.dart';
import 'menu_page/linked_accounts_page.dart';
import 'menu_page/change_password_page.dart';
import 'menu_page/contact_us_page.dart';
import 'menu_page/refer_and_earn_page.dart';
import 'menu_page/upload_property_page.dart';
import 'menu_page/about_nestify_page.dart';
import 'menu_page/privacy_policy_page.dart';
import 'menu_page/terms_of_use_page.dart';
import 'menu_page/profile_details_page.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Color.fromARGB(255, 0, 140, 255),
              Color.fromARGB(255, 0, 140, 255),
              Colors.white,
            ],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: SingleChildScrollView(
          child: Column(
            children: const [
              SizedBox(height: 50),
              ProfileHeader(),
              SizedBox(height: 50),
              MenuSection(),
              SizedBox(height: 50),
            ],
          ),
        ),
      ),
    );
  }
}

class ProfileHeader extends StatelessWidget {
  const ProfileHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => const ProfileDetailsPage()),
        );
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: Container(
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(12),
            boxShadow: [
              BoxShadow(
                color: const Color.fromARGB(255, 106, 106, 106),
                spreadRadius: 3,
                blurRadius: 6,
                offset: Offset(0, 4),
              ),
            ],
          ),
          padding: const EdgeInsets.all(16),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const CircleAvatar(
                radius: 50,
                backgroundImage: AssetImage('assets/Sins.jpg'),
              ),
              const SizedBox(width: 16),
              const Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Johnny Sins',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                    ),
                    SizedBox(height: 4),
                    Text(
                      'PrelDrei25@gmail.com',
                      style: TextStyle(
                        fontSize: 12,
                        color: Color.fromARGB(255, 87, 87, 87),
                      ),
                    ),
                  ],
                ),
              ),
              const Icon(
                Icons.arrow_forward_ios,
                size: 16,
                color: Color.fromARGB(255, 0, 0, 0),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class MenuSection extends StatefulWidget {
  const MenuSection({super.key});

  @override
  _MenuSectionState createState() => _MenuSectionState();
}

class _MenuSectionState extends State<MenuSection> {
  bool isLogoutTapped = false;
  bool isSmsUpdatesEnabled = false;
  String _selectedCurrency = 'Philippine Peso';
  String _selectedNationality = 'NA';

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 0),
      child: Column(
        children: [
          _buildContainerSection('ACCOUNT', [
            _menuItem(
              Icons.diamond,
              'NestClub',
              subtitle: 'Get Extra 12% discount',
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const NestClubPage()),
                );
              },
            ),
            _menuItem(
              Icons.inbox_outlined,
              'Inbox',
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const InboxPage()),
                );
              },
            ),
            _menuItem(
              Icons.business_sharp,
              'Register your Business account',
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const RegisterBusinessPage(),
                  ),
                );
              },
            ),
          ]),
          SizedBox(height: 20),
          _buildContainerSection('SETTINGS', [
            _menuItem(
              Icons.language,
              'Country & Language',
              subtitle: 'Philippines (English)',
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const CountryLanguagePage(),
                  ),
                );
              },
            ),
            _menuItem(
              Icons.money,
              'Currency',
              subtitle: _selectedCurrency,
              onTap: () async {
                final result = await Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const CurrencyPage()),
                );

                if (result != null && result is String) {
                  setState(() {
                    _selectedCurrency = result;
                  });
                }
              },
            ),
            _menuItem(
              Icons.flag,
              'Nationality',
              subtitle: _selectedNationality,
              onTap: () async {
                final result = await Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const NationalityPage(),
                  ),
                );

                if (result != null && result is String) {
                  setState(() {
                    _selectedNationality = result;
                  });
                }
              },
            ),
            _menuItem(
              Icons.atm,
              'Linked Accounts & Saved Cards',
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const LinkedAccountsPage(),
                  ),
                );
              },
            ),
            _menuItem(
              Icons.password,
              'Change Password',
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const ChangePasswordPage(),
                  ),
                );
              },
            ),
            ListTile(
              leading: Icon(Icons.sms, color: Color.fromARGB(255, 4, 0, 255)),
              title: Text('Get updates on SMS'),
              trailing: Transform.scale(
                scale: 0.75,
                child: Switch(
                  value: isSmsUpdatesEnabled,
                  onChanged: (bool value) {
                    setState(() {
                      isSmsUpdatesEnabled = value;
                    });
                  },
                  activeColor: const Color.fromARGB(255, 13, 0, 255),
                  activeTrackColor: const Color.fromARGB(255, 69, 128, 255),
                  inactiveThumbColor: Colors.grey,
                  inactiveTrackColor: Colors.grey.shade300,
                ),
              ),
            ),
          ]),
          SizedBox(height: 20),
          _buildContainerSection('SUPPORT', [
            _menuItem(
              Icons.chat_bubble_outline,
              'Contact Us',
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const ContactUsPage(),
                  ),
                );
              },
            ),
            _menuItem(
              Icons.question_mark_rounded,
              'FAQ',
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const FAQPage()),
                );
              },
            ),
          ]),
          SizedBox(height: 20),
          _buildContainerSection('Earn With Nestify', [
            _menuItem(
              Icons.share,
              'Refer and Earn',
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const ReferAndEarnPage(),
                  ),
                );
              },
            ),
            _menuItem(
              Icons.house,
              'Upload Your Property',
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const UploadPropertyPage(),
                  ),
                );
              },
            ),
          ]),
          SizedBox(height: 20),
          _buildContainerSection('INFORMATION', [
            _menuItem(
              Icons.info,
              'About Nestify',
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const AboutNestifyPage(),
                  ),
                );
              },
            ),
            _menuItem(
              Icons.privacy_tip,
              'Privacy Policy',
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const PrivacyPolicyPage(),
                  ),
                );
              },
            ),
            _menuItem(
              Icons.verified_user,
              'Terms of Use',
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const TermsOfUsePage(),
                  ),
                );
              },
            ),
            _menuItem(
              Icons.logout_outlined,
              'Logout',
              onTap: () {
                setState(() {
                  isLogoutTapped = true;
                });
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (context) => const LoginPage()),
                );
              },
            ),
          ]),
        ],
      ),
    );
  }

  Widget _buildContainerSection(String title, List<Widget> items) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          child: Text(
            title,
            style: const TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: Color.fromARGB(255, 0, 0, 0),
            ),
          ),
        ),
        Container(
          width: double.infinity,
          color: Colors.white,
          child: Column(children: items),
        ),
      ],
    );
  }

  Widget _menuItem(
    IconData icon,
    String title, {
    String? subtitle,
    VoidCallback? onTap,
  }) {
    return ListTile(
      leading: Icon(icon, color: const Color.fromARGB(255, 4, 0, 255)),
      title: Text(title),
      subtitle: subtitle != null ? Text(subtitle) : null,
      trailing: const Icon(Icons.arrow_forward_ios, size: 16),
      contentPadding: const EdgeInsets.symmetric(horizontal: 16.0),
      onTap: onTap,
    );
  }
}
