import 'package:flutter/material.dart';

class BiographyPage extends StatelessWidget {
  const BiographyPage({super.key});

  @override
  Widget build(BuildContext context) {
    final double width = MediaQuery.of(context).size.width;
    final double height = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: Colors.transparent,
      body: Stack(
        fit: StackFit.expand,
        children: [
          Container(
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  Color.fromRGBO(4, 9, 35, 1),
                  Color.fromRGBO(231, 60, 30, 1),
                ],
                begin: FractionalOffset.bottomCenter,
                end: FractionalOffset.topCenter,
              ),
            ),
          ),
          SingleChildScrollView(
            padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 38),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                IconButton(
                  alignment: Alignment.topLeft,
                  icon: const Icon(Icons.arrow_back, color: Colors.white),
                  onPressed: () {
                    Navigator.pop(context);
                  },
                ),
                const SizedBox(height: 20),
                const SizedBox(height: 20),
                SizedBox(
                  height: height * 0.4,
                  child: LayoutBuilder(
                    builder: (context, constraints) {
                      final double innerHeight = constraints.maxHeight;
                      final double innerWidth = constraints.maxWidth;
                      return Stack(
                        fit: StackFit.expand,
                        children: [
                          Positioned(
                            bottom: 0,
                            left: 0,
                            right: 0,
                            child: Container(
                              height: innerHeight * 0.65,
                              width: innerWidth,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(30),
                                color: Colors.white,
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.black.withOpacity(0.1),
                                    blurRadius: 10,
                                    offset: const Offset(0, 3),
                                  ),
                                ],
                              ),
                              child: Column(
                                children: [
                                  const SizedBox(height: 70),
                                  const Text(
                                    'Chuming Lin',
                                    style: TextStyle(
                                      color: Color.fromARGB(255, 156, 40, 32),
                                      fontFamily: 'Nunito',
                                      fontSize: 40,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  const SizedBox(height: 10),
                                  _buildInfoRow(
                                    'Student ID',
                                    '6431503116',
                                    Colors.grey,
                                  ),
                                  _buildInfoRow(
                                    'Status',
                                    'STUDENT CURRENT',
                                    const Color.fromRGBO(8, 250, 36, 1),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          Positioned(
                            top: 0,
                            left: 0,
                            right: 0,
                            child: Center(
                              child: Container(
                                margin: const EdgeInsets.only(bottom: 10),
                                height: 180,
                                width: 180,
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  border: Border.all(
                                    color: Colors.white,
                                    width: 5,
                                  ),
                                  boxShadow: [
                                    BoxShadow(
                                      color: Colors.black.withOpacity(0.2),
                                      blurRadius: 10,
                                      offset: const Offset(0, 3),
                                    ),
                                  ],
                                  image: const DecorationImage(
                                    image:
                                        AssetImage('assets/images/human.jpg'),
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      );
                    },
                  ),
                ),
                const SizedBox(height: 25),
                Container(
                  height: height * 0.65,
                  width: width,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(30),
                    color: Colors.white,
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.1),
                        blurRadius: 10,
                        offset: const Offset(0, 3),
                      ),
                    ],
                  ),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 15),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const SizedBox(height: 20),
                        _buildSectionTitle('Program'),
                        const SizedBox(height: 10),
                        _buildInfoContainer(),
                        const SizedBox(height: 20),
                        _buildSectionTitle('School'),
                        const SizedBox(height: 10),
                        _buildInfoContainer(),
                        const SizedBox(height: 20),
                        _buildSectionTitle('Department'),
                        const SizedBox(height: 10),
                        _buildInfoContainer(),
                        const SizedBox(height: 20),
                        _buildSectionTitle('Advisor'),
                        const SizedBox(height: 10),
                        _buildInfoContainer(),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildInfoRow(String label, String value, Color color) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          '$label: ',
          style: const TextStyle(
            color: Colors.grey,
            fontFamily: 'Nunito',
            fontSize: 23,
          ),
        ),
        Text(
          value,
          style: TextStyle(
            color: color,
            fontFamily: 'Nunito',
            fontSize: 21,
          ),
        ),
      ],
    );
  }

  Widget _buildSectionTitle(String title) {
    return Text(
      title,
      style: const TextStyle(
        color: Color.fromRGBO(39, 105, 171, 1),
        fontSize: 25,
        fontFamily: 'Nunito',
        fontWeight: FontWeight.bold,
      ),
    );
  }

  Widget _buildInfoContainer() {
    return Container(
      height: 50,
      decoration: BoxDecoration(
        color: Colors.grey[300],
        borderRadius: BorderRadius.circular(30),
      ),
    );
  }
}
