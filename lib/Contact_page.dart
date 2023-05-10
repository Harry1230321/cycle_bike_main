import 'package:flutter/material.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import 'package:line_awesome_flutter/line_awesome_flutter.dart';

class ContactPage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
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
              children:[
               
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      IconButton(
                        alignment: Alignment.topLeft,
                        icon: const Icon(Icons.arrow_back, color: Colors.white,),
                        onPressed: () {
                          Navigator.pop(context);
                        },
                      ),
                    ],
                  ),
                
                const SizedBox(
                  height: 20,
                ),
                
                const SizedBox(
                  height: 20,
                ),
                
                Container(
                  height: height * 0.5,
                  width: width ,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(30),
                    color: Colors.white,
                  ),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 15),
                    child: Column(
                      children: [
                        const SizedBox(
                          height: 20,
                        ),
                        
                        const Text(
                          'Contact Us',
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 30,
                            fontWeight: FontWeight.bold,
                            fontFamily: 'Nunito',
                          ),
                        ),
                        const Divider(
                          thickness: 2.5,
                        ),
                        
                        Container(
                          child: ListTile(
                            leading: Container(
                              height: 40,
                              width: 40,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(100),
                                
                              ),
                              child: const Icon(LineAwesomeIcons.school, color: Color.fromARGB(255, 244, 188, 4),),
                            ),
                          ),
                        ),
                        const Text(
                          'Address                                              ',
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(
                          height: 5,
                        ),
                        const Text(
                          '      Registrar Division, Mae Fah Luang University AS \n      Building, 1st floor, Room 107 and 108 333 Moo 1, Thasud, Muang, Chiang Rai 57100'
                        ),
                        
                        Container(
                          child: ListTile(
                            leading: Container(
                              height: 40,
                              width: 40,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(100),
                                
                              ),
                              child: const Icon(LineAwesomeIcons.envelope, color: Color.fromARGB(255, 244, 188, 4),),
                            ),
                          ),
                        ),
                        const Text(
                          'Email                                                  ',
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                          
                        ),
                        const SizedBox(
                          height: 5,
                        ),
                        const Text(
                          'reg@mfu.ac.th                                                       '
                        ),

                        Container(
                          child: ListTile(
                            leading: Container(
                              height: 40,
                              width: 40,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(100),
                                
                              ),
                              child: const Icon(LineAwesomeIcons.globe, color: Color.fromARGB(255, 244, 188, 4),),
                            ),
                          ),
                        ),
                        
                        const Text(
                          'Website                                           ',
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(
                          height: 5,
                        ),
                        const Text(
                          'hettps://reg.mfu.ac.th/                                       ',
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(
                  height: 30,
                ),
                Container(
                  height: height * 0.4,
                  width: width ,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(30),
                    color: Colors.white,
                  ),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 15),
                    child: Column(
                      children: [
                        const SizedBox(
                          height: 20,
                        ),
                        const Text(
                          'Telephone Number',
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 28,
                            fontWeight: FontWeight.bold,
                            fontFamily: 'Nunito'
                          ),
                        ),
                        const Divider(
                          thickness: 2.5,
                        ),
                        const SizedBox(
                          height: 15,
                        ),
                        const Text(
                          'Educational Service and General       ',
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(
                          height: 8,
                        ),
                        const Text(
                          'Administration Section                         ',
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Container(
                          child: ListTile(
                            leading: Container(
                              height: 40,
                              width: 40,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(100),
                                
                              ),
                              child: const Icon(LineAwesomeIcons.phone, color: Color.fromARGB(255, 244, 188, 4),),
                            ),
                          ),
                        ),
                        const Text(
                          '0 5391 6107                                   ',
                          style: TextStyle(
                            fontSize: 20,
                            color: Color.fromARGB(255, 244, 188, 4),
                          ),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        const Text(
                          '0 5391 6544                                   ',
                          style: TextStyle(
                            fontSize: 20,
                            color: Color.fromARGB(255, 244, 188, 4),
                          ),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        const Text(
                          '0 5391 6545                                   ',
                          style: TextStyle(
                            fontSize: 20,
                            color: Color.fromARGB(255, 244, 188, 4),
                          ),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        const Text(
                          '0 5391 6575                                   ',
                          style: TextStyle(
                            fontSize: 20,
                            color: Color.fromARGB(255, 244, 188, 4),
                          ),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        )
      ],
    );
  }
}
