import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../../../core/utils/constant.dart';

class ContactUsView extends StatelessWidget {
  const ContactUsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: appBar(context: context,text: 'Contact Us'),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: ListView.separated(
          physics: const BouncingScrollPhysics(),
          itemBuilder: (context, index) {
            var contact = contacts[index];
            return InkWell(
              onTap: () => _handleContactTap(context, contact.linkedInUrl),
              child: Card(
                child: Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 10,
                    vertical: 5,
                  ),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Row(
                    children: [
                      CircleAvatar(
                        radius: 30,
                        backgroundImage: AssetImage(contact.imageUrl),
                      ),
                      const SizedBox(width: 10),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            contact.name,
                            style: const TextStyle(
                              fontSize: 18,
                              color: Colors.black,
                            ),
                          ),
                          const SizedBox(height: 5),
                          const Text(
                            "Software Engineer",
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(
                              fontSize: 16,
                              color: Colors.grey,
                            ),
                          ),
                        ],
                      ),
                      const Spacer(),
                      Image.asset(
                        'assets/images/OIP-removebg-preview.png',
                        width: 50,
                        height: 60,
                      ),
                    ],
                  ),
                ),
              ),
            );
          },
          separatorBuilder: (context, index) => const SizedBox(height: 20),
          itemCount: contacts.length,
        ),
      ),
    );
  }

  // Function to handle contact tap
  void _handleContactTap(BuildContext context, String url) async {
    if (url.contains('@')) {
      // Handle email addresses
      final Uri emailUri = Uri(
        scheme: 'mailto',
        path: url,
      );
      if (await canLaunchUrl(emailUri)) {
        await launchUrl(emailUri);
      } else {
        _showSnackBar(context, 'Could not launch email client for $url');
      }
    } else {
      // Handle LinkedIn URLs
      final Uri linkedInUri = Uri.parse(url);
      if (await canLaunchUrl(linkedInUri)) {
        await launchUrl(linkedInUri, mode: LaunchMode.externalApplication);
      } else {
        _showSnackBar(context, 'Could not launch $url');
      }
    }
  }

  void _showSnackBar(BuildContext context, String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text(message)),
    );
  }
}

// Model for Contact
class Contact {
  final String name;
  final String imageUrl;
  final String linkedInUrl;

  Contact({
    required this.name,
    required this.imageUrl,
    required this.linkedInUrl,
  });
}

// Define a list of contacts
List<Contact> contacts = [
  Contact(
    name: 'Moaz Mohamed',
    imageUrl: 'assets/images/moaz.jpg',
    linkedInUrl: 'https://www.linkedin.com/in/moaz-mohamed-46b053231/',
  ),
  Contact(
    name: 'Mostafa Mohamed',
    imageUrl: 'assets/images/mostafa.jpg',
    linkedInUrl: 'https://www.linkedin.com/in/mostafa-mohamed-talkhan-58a7b927a/',
  ),
  Contact(
    name: 'Emad Ahmed',
    imageUrl: 'assets/images/emad.jpg',
    linkedInUrl: 'https://www.linkedin.com/in/emad-ahmed-196712284/',
  ),
  Contact(
    name: 'Amany Fathy',
    imageUrl: 'assets/images/amany.jpg',
    linkedInUrl: 'amanyfathy540@gmail.com',
  ),
  Contact(
    name: 'Rehab Mohamed',
    imageUrl: 'assets/images/rehab.jpg',
    linkedInUrl: 'rr01274973839@gmail.com',
  ),
  Contact(
    name: 'Mai Mohamed',
    imageUrl: 'assets/images/mai.jpg',
    linkedInUrl: 'https://www.linkedin.com/in/mai-mohamed-39bab1219/',
  ),
];
