
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:ross/Appcolor.dart';
import 'package:ross/Booking.dart';
import 'package:ross/Chat.dart';
import 'package:ross/Home.dart';
import 'package:ross/Offline_Service.dart';
import 'package:ross/Online_Service.dart';
import 'package:ross/Profile.dart';
import 'package:ross/Travel_Booking.dart';
class Home1 extends StatefulWidget {
  const Home1({Key? key}) : super(key: key);

  @override
  State<Home1> createState() => _Home1State();
}

class _Home1State extends State<Home1> {

  int currentTab = 0;
  final List<Widget> screens = [
    Home(),
    Booking(),
    Chat(),
    Profile(),

  ];

  final PageStorageBucket bucket = PageStorageBucket();
  Widget currentscreen = Home();



  @override
  Widget build(BuildContext context) {
    return SafeArea(child: Scaffold(
      body: PageStorage(
        bucket: bucket,
        child: currentscreen ,
      ),
      floatingActionButton: FloatingActionButton(onPressed: () {
        showDialog(
          context: context,
          builder: (BuildContext context) {
            return Stack(
              children: [
                // Blurred background
                Positioned.fill(
                  child: BackdropFilter(
                    filter: ImageFilter.blur(sigmaX: 5, sigmaY: 5), // Adjust the sigma values for desired blur intensity
                    child: Container(
                      color: Colors.black.withOpacity(0.5), // Adjust the opacity as needed
                    ),
                  ),
                ),
                // AlertDialog
                AlertDialog(
                  elevation: 10,
                  backgroundColor: Colors.white,
                  title: Column(
                    children: [
                      InkWell(
                        onTap: () {
                          Navigator.push(
                              context, MaterialPageRoute(builder: (context) => Online_Service(),));
                        },
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text('Online Service'),
                            Icon(Icons.language,color: Appcolor.PrimaryColor,)
                          ],
                        ),
                      ),
                      Divider(thickness: 1,color: Colors.grey,),
                      InkWell(
                        onTap: () {
                          Navigator.push(
                              context, MaterialPageRoute(builder: (context) => Offline_Service(),));
                        },
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text('Offline Service'),
                            Image.asset('assets/os.png')
                          ],
                        ),
                      ),
                      Divider(thickness: 1,color: Colors.grey,),
                      InkWell(
                        onTap: () {
                          Navigator.push(
                              context, MaterialPageRoute(builder: (context) => Travel_Booking(),));
                        },
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text('Travel Booking'),
                            Image.asset('assets/tb.png')
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            );
          },
        );
      },
        child: Icon(Icons.add,color: Colors.white,) ,
        backgroundColor: Appcolor.PrimaryColor,
        shape: CircleBorder(),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: BottomAppBar(
        shape: CircularNotchedRectangle(),
        notchMargin: 10,
        child: Container(
          height: 60,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  MaterialButton(
                    minWidth: 40,
                      onPressed: (){
                            setState((){
                              currentscreen = Home();
                              currentTab =0;
                            });
                  },
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(Icons.home,color: currentTab ==0? Appcolor.PrimaryColor: Colors.grey,),
                        Text('Home',style: TextStyle(color: currentTab ==0? Appcolor.PrimaryColor: Colors.grey),)
                      ],
                    ),
                  ),
                  MaterialButton(
                    minWidth: 40,
                    onPressed: (){
                      setState((){
                        currentscreen = Booking();
                        currentTab =1;
                      });
                    },
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(Icons.calendar_month,color: currentTab ==1? Appcolor.PrimaryColor: Colors.grey,),
                        Text('Booking',style: TextStyle(color: currentTab ==1? Appcolor.PrimaryColor: Colors.grey),)
                      ],
                    ),
                  ),
                ],
              ),
              // Right Tab
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  MaterialButton(
                    minWidth: 40,
                    onPressed: (){
                      setState((){
                        currentscreen = Chat();
                        currentTab =2;
                      });
                    },
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(Icons.notifications,color: currentTab ==2? Appcolor.PrimaryColor: Colors.grey,),
                        Text('Notification',style: TextStyle(color: currentTab ==2? Appcolor.PrimaryColor: Colors.grey),)
                      ],
                    ),
                  ),
                  MaterialButton(
                    minWidth: 40,
                    onPressed: (){
                      setState((){
                        currentscreen = Profile();
                        currentTab =3;
                      });
                    },
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(Icons.person,color: currentTab ==3? Appcolor.PrimaryColor: Colors.grey,),
                        Text('Profile',style: TextStyle(color: currentTab ==3? Appcolor.PrimaryColor: Colors.grey),)
                      ],
                    ),
                  )


                ],
              )

            ],
          ),
        ),

      ),
    ));
  }
}
