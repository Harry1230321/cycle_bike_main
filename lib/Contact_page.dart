import 'package:flutter/material.dart';
import 'package:line_awesome_flutter/line_awesome_flutter.dart';

class ContactPage extends StatelessWidget {
  const ContactPage({super.key});

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;

    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          leading: IconButton(
            icon: const Icon(
              Icons.arrow_back,
              color: Colors.black,
            ),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
        ),
        body: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 38),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 20),
              _buildContactSection(
                height * 0.5,
                'Contact Us',
                [
                  _buildContactItem(
                    LineAwesomeIcons.school,
                    'Address',
                    'Registrar Division, Mae Fah Luang University AS Building, 1st floor, Room 107 and 108 333 Moo 1, Thasud, Muang, Chiang Rai 57100',
                  ),
                  _buildContactItem(
                    LineAwesomeIcons.envelope,
                    'Email',
                    'reg@mfu.ac.th',
                  ),
                  _buildContactItem(
                    LineAwesomeIcons.globe,
                    'Website',
                    'https://reg.mfu.ac.th/',
                  ),
                ],
              ),
              const SizedBox(height: 30),
              _buildContactSection(
                height * 0.4,
                'Telephone Number',
                [
                  _buildContactItem(
                    LineAwesomeIcons.phone,
                    'Educational Service and General',
                    '0 5391 6107',
                  ),
                  _buildContactItem(
                    LineAwesomeIcons.phone,
                    'Administration Section',
                    '0 5391 6544',
                  ),
                  _buildContactItem(
                    LineAwesomeIcons.phone,
                    'Administration Section',
                    '0 5391 6545',
                  ),
                  _buildContactItem(
                    LineAwesomeIcons.phone,
                    'Administration Section',
                    '0 5391 6575',
                  ),
                ],
              ),
              const SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildContactSection(
    double height,
    String title,
    List<Widget> contactItems,
  ) {
    return Container(
      height: height,
      width: double.infinity,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.3),
            blurRadius: 6,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: const TextStyle(
                color: Color.fromARGB(255, 156, 40, 32),
                fontSize: 30,
                fontWeight: FontWeight.bold,
                fontFamily: 'Nunito',
              ),
            ),
            const SizedBox(height: 15),
            const Divider(
              color: Colors.grey,
              thickness: 2,
            ),
            const SizedBox(height: 15),
            SizedBox(
              height: height - 145, // Adjust the height based on content
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: contactItems,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildContactItem(IconData icon, String title, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: 40,
            width: 40,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
              color:
                  const Color.fromARGB(255, 156, 40, 32), // Updated icon color
            ),
            child: Icon(
              icon,
              color: Colors.white,
            ),
          ),
          const SizedBox(width: 10),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: const TextStyle(
                    color: Color.fromARGB(255, 156, 40, 32),
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 5),
                Text(
                  value,
                  style: const TextStyle(
                    color: Color.fromARGB(255, 156, 40, 32),
                    fontSize: 16,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
