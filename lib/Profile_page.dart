import 'package:flutter/material.dart';
import 'package:line_awesome_flutter/line_awesome_flutter.dart';
import 'package:firebase_auth/firebase_auth.dart';

class ProfilePage extends StatelessWidget {
  final User? user = FirebaseAuth.instance.currentUser;

  ProfilePage({super.key});

  Future<void> _signOut(BuildContext context) async {
    Navigator.pushReplacementNamed(context, '/login');
    await FirebaseAuth.instance.signOut();
  }

  @override
  Widget build(BuildContext context) {
    final double width = MediaQuery.of(context).size.width;
    final double height = MediaQuery.of(context).size.height;

    return Stack(
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
        Scaffold(
          backgroundColor: Colors.transparent,
          body: SingleChildScrollView(
            padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 38),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    IconButton(
                      alignment: Alignment.topLeft,
                      icon: const Icon(
                        Icons.arrow_back,
                        color: Colors.white,
                      ),
                      onPressed: () {
                        Navigator.pop(context);
                      },
                    ),
                  ],
                ),
                const SizedBox(height: 20),
                const SizedBox(height: 20),
                SizedBox(
                  height: height * 0.4,
                  child: LayoutBuilder(builder: (context, constraints) {
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
                            ),
                            child: Column(
                              children: [
                                const SizedBox(height: 70),
                                const Text(
                                  'Chuming Lin',
                                  style: TextStyle(
                                    color: Color.fromRGBO(39, 105, 171, 1),
                                    fontFamily: 'Nunito',
                                    fontSize: 40,
                                  ),
                                ),
                                const SizedBox(height: 10),
                                Column(
                                  children: [
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: const <Widget>[],
                                    ),
                                    const SizedBox(height: 17),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Text(
                                          'Status : ',
                                          style: TextStyle(
                                            color: Colors.grey[700],
                                            fontFamily: 'Nunito',
                                            fontSize: 23,
                                          ),
                                        ),
                                        const Text(
                                          'STUDENT CURRENT',
                                          style: TextStyle(
                                            color:
                                                Color.fromRGBO(8, 250, 36, 1),
                                            fontFamily: 'Nunito',
                                            fontSize: 21,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
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
                              decoration: const BoxDecoration(
                                shape: BoxShape.circle,
                                image: DecorationImage(
                                  image: AssetImage('assets/images/human.jpg'),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    );
                  }),
                ),
                const SizedBox(height: 25),
                buildMenuItem(
                  width,
                  height,
                  LineAwesomeIcons.user,
                  'Biography',
                  '/biography',
                  context,
                ),
                const SizedBox(height: 20),
                buildMenuItem(
                  width,
                  height,
                  Icons.phone,
                  'Contacts',
                  '/contact',
                  context,
                ),
                const SizedBox(height: 20),
                buildMenuItem(
                  width,
                  height,
                  Icons.logout,
                  'Log Out',
                  '/login',
                  context,
                  onPressed: () => _signOut(context),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }

  Widget buildMenuItem(
    double width,
    double height,
    IconData icon,
    String title,
    String route,
    BuildContext context, {
    VoidCallback? onPressed,
  }) {
    return Container(
      height: height * 0.06,
      width: width,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(30),
        color: Colors.white,
      ),
      child: ListTile(
        leading: Container(
          height: 50,
          width: 50,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(100),
            color: Colors.red[100],
          ),
          child: IconButton(
            onPressed: () {
              Navigator.pushNamed(context, route);
            },
            icon: Icon(icon),
          ),
        ),
        title: Text(title),
        onTap: onPressed,
      ),
    );
  }
}
