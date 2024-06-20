import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:ross/Appcolor.dart';
import 'package:ross/Change_Password.dart';
import 'package:ross/Help_Support.dart';
import 'package:ross/Login.dart';
import 'package:ross/Personal_Details.dart';
import 'package:ross/Privacy_Policy.dart';
class Profile extends StatefulWidget {
  const Profile({Key? key}) : super(key: key);

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(child: Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        toolbarHeight: 180, // Set this height
        flexibleSpace: Container(
          height: 180,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.only(bottomLeft: Radius.circular(24),bottomRight: Radius.circular(24)),
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomLeft,
              colors: [
                Appcolor.PrimaryColor3,
                Appcolor.PrimaryColor4
                //add more colors for gradient
              ],
            ),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ListTile(
                leading: Image.asset('assets/woman.png'),
                title: Text('Arianna Deo',style: TextStyle(color: Colors.white),),
                subtitle: Text('ariannadeo@gmail.com',style: TextStyle(color: Colors.white)),
              )
            ],
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: SingleChildScrollView(
          child: SizedBox(
            width: double.infinity,
            child: Column(
              children: [
                SizedBox(height: 15,),
                  InkWell(
                    onTap: (){
                      Navigator.push(context, MaterialPageRoute(builder: (context) => Personal_Details(),));
                    },
                    child: Row(
                      children: [
                        Icon(Icons.person),
                        SizedBox(width: 10,),
                        Text('Personal Details',style: TextStyle(fontSize: 15,fontWeight: FontWeight.w500),)
                      ],
                    ),
                  ),
                SizedBox(height: 5,),
                Divider(thickness: 1,color: Colors.grey,),
                SizedBox(height: 15,),
                InkWell(
                  onTap: (){
                    Navigator.push(context, MaterialPageRoute(builder: (context) => Change_Password(),));
                  },
                  child: Row(
                    children: [
                      Icon(Icons.privacy_tip_outlined),
                      SizedBox(width: 10,),
                      Text('Security',style: TextStyle(fontSize: 15,fontWeight: FontWeight.w500))
                    ],
                  ),
                ),
                SizedBox(height: 5,),
                Divider(thickness: 1,color: Colors.grey,),
                SizedBox(height: 15,),
                InkWell(
                  onTap: (){
                    Navigator.push(context, MaterialPageRoute(builder: (context) => Privacy_Policy(),));
                  },
                  child: Row(
                    children: [
                      Icon(Icons.lock),
                      SizedBox(width: 10,),
                      Text('Privacy Policy',style: TextStyle(fontSize: 15,fontWeight: FontWeight.w500))
                    ],
                  ),
                ),
                SizedBox(height: 5,),
                Divider(thickness: 1,color: Colors.grey,),
                SizedBox(height: 15,),
                InkWell(
                  onTap: (){
                    Navigator.push(context, MaterialPageRoute(builder: (context) => Help_Support(),));
                  },
                  child: Row(
                    children: [
                      Icon(Icons.help_outline),
                      SizedBox(width: 10,),
                      Text('Help & Support',style: TextStyle(fontSize: 15,fontWeight: FontWeight.w500))
                    ],
                  ),
                ),
                SizedBox(height: 5,),
                Divider(thickness: 1,color: Colors.grey,),
                SizedBox(height: 5,),
                Row(
                  children: [
                    Icon(Icons.logout,color: Colors.red,),
                    //SizedBox(width: 10,),
                    TextButton(
                      child: Text('Log Out',style: TextStyle(color: Colors.red,fontSize: 15,fontWeight: FontWeight.w500)),
                      onPressed: () {
                        showAlertDialog(context);
                      },
                    )
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    ));
  }
}

showAlertDialog(BuildContext context) {
  Widget okButton = TextButton(
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        InkWell(
          onTap: () {
            Navigator.pop(context);
          },
          child: Container(
            height: 50,
            width: 100,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                border: Border.all(color: Colors.grey)
            ),
            child: Center(
                child: Text('Cancel', style: TextStyle(color: Colors.grey),)),
          ),
        ),
        InkWell(
          onTap: () {
            Navigator.push(
                context, MaterialPageRoute(builder: (context) => Login(),));
          },
          child: Container(
            height: 50,
            width: 100,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
              gradient: LinearGradient(
                colors: [
                  Appcolor.PrimaryColor1,
                  Appcolor.PrimaryColor2
                  //add more colors for gradient
                ],
              ),
            ),
            child: Center(
                child: Text('Logout', style: TextStyle(color: Colors.white),)),
          ),
        )
      ],
    ),
    onPressed: () {
      //   Navigator.push(context, MaterialPageRoute(builder: (context) => Login(),));
    },
  );

  showDialog(
    context: context,
    builder: (BuildContext context) {
      return Stack(
        children: [
          // Blurred background
          Positioned.fill(
            child: BackdropFilter(
              filter: ImageFilter.blur(sigmaX: 5, sigmaY: 5),
              // Adjust the sigma values for desired blur intensity
              child: Container(
                color: Colors.black.withOpacity(
                    0.5), // Adjust the opacity as needed
              ),
            ),
          ),
          // AlertDialog
          AlertDialog(
            elevation: 10,
            backgroundColor: Colors.white,
            title: Column(
              children: [
                Image.asset('assets/logout.png'),
                Text(
                  'Logout',
                  style: TextStyle(color: Colors.black, fontSize: 20),
                )
              ],
            ),
            content: Text(
              "Are you sure you want to logout?",
              style: TextStyle(color: Colors.grey),
            ),
            actions: [
              okButton,
            ],
          ),
        ],
      );
    },

  );
}
