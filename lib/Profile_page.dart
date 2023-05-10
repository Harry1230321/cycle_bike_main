import 'package:flutter/material.dart';
import 'Login_Page.dart';
import 'package:line_awesome_flutter/line_awesome_flutter.dart';

class ProfilePage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Stack(
      
      fit: StackFit.expand,
      children: [
        Container(
          decoration: BoxDecoration(
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
                        icon: Icon(Icons.arrow_back, color: Colors.white,),
                        onPressed: () {
                          Navigator.pop(context);
                        },
                      ),
                    ],
                  ),
                SizedBox(
                  height: 20,
                ),
                
                SizedBox(
                  height: 20,
                ),
                Container(
                  height: height * 0.4,
                  child: LayoutBuilder(builder: (context, constraints){
                    double innerHeight = constraints.maxHeight;
                    double innerWidth = constraints.maxWidth;
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
                                SizedBox(
                                  height: 70,
                                ),
                                Text(
                                  'Chuming Lin',
                                  style: TextStyle(
                                    color: Color.fromRGBO(39, 105, 171, 1),
                                    fontFamily: 'Nunito',
                                    fontSize: 40,
                                  ),
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                                Column(
                                  children: [
                                    Row(
                                      mainAxisAlignment: 
                                      MainAxisAlignment.center,
                                      children: [
                                        Text(
                                          'Student ID : ',
                                          style: TextStyle(
                                            color: Colors.grey[700],
                                            fontFamily: 'Nunito',
                                            fontSize: 23,
                                          ),
                                        ),
                                        Text(
                                          '6431503116',
                                          style: TextStyle(
                                            color: Colors.black,
                                            fontFamily: 'Nunito',
                                            fontSize: 21,
                                          ),
                                        ),
                                      ],
                                    ),
                                    SizedBox(
                                      height: 17,
                                    ),
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
                                        Text(
                                          'STUDENT CURRENT',
                                          style: TextStyle(
                                            color: Color.fromRGBO(8, 250, 36, 1),
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
                              margin: EdgeInsets.only(bottom: 10),
                              height: 180,
                              decoration: BoxDecoration(
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
                SizedBox(
                  height: 25,
                ),
                
                Container(
                  height: height * 0.06,
                  width: width ,
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
                      child: IconButton(onPressed: (){
                        Navigator.pushNamed(context, '/biography');
                      },icon: Icon(LineAwesomeIcons.user),
                    ),
                      
                    ),
                    title: Text(
                      'Biography'
                    ),
                    ),
                    ),
                  
                
                  SizedBox(
                      height: 20,
              ),
                Container(
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
                      child: IconButton(onPressed: (){
                        Navigator.pushNamed(context, '/contact');
                      },icon: Icon(Icons.phone),
                    ),
                    ),
                    title: Text(
                      'Contacts'
                    ),
                    
                ),
              ),
                
                SizedBox(
                  height: 20,
                ),
                Container(
                  height: height * 0.06,
                  width: width,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(30),
                    color: Colors.white,
                  ),
                  
                  child: ListTile(
                    
                    leading: Container(
                      width: 50,
                      height: 50,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(100),
                        color: Colors.red[100],
                      ),
                     child:  IconButton(onPressed: () {
                        Navigator.push(context,
                MaterialPageRoute(builder: (context)=> LoginPage(title: '',)),
                );
                      }, icon: Icon(Icons.logout,),
                    ),
                  ),
                    title: Text(
                      'Logout'
                    ),
                    textColor: Colors.red,
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
