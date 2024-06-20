import 'dart:async';

import 'package:flutter/material.dart';
import 'package:ross/Appcolor.dart';
import 'package:ross/Chat1.dart';
import 'package:ross/Service_Details.dart';
class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {

  bool _showProgress = true;

  @override
  void initState() {
    super.initState();
    // Set the timer to hide the CircularProgressIndicator after 5 seconds
    Timer(Duration(seconds: 3), () {
      setState(() {
        _showProgress = false;
      });
    });
  }


  @override
  Widget build(BuildContext context) {
    return SafeArea(child: Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        toolbarHeight: 210, // Set this height
        flexibleSpace: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            SingleChildScrollView(
              child: Stack(
                children: [
                  Container(
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
                    child: Padding(
                      padding: const EdgeInsets.all(20.0),
                      child:
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Text('Let’s find your\n best Services',style: TextStyle(fontSize: 25,fontWeight: FontWeight.w700,color: Colors.white),),
                                  GestureDetector(
                                    onTap: (){
                                      Navigator.push(context, MaterialPageRoute(builder: (context) => Chat1(),));
                                    },
                                    child: Container(
                                      height: 40,
                                      width: 40,
                                      decoration: BoxDecoration(
                                          borderRadius: BorderRadius.circular(8),
                                          border: Border.all(color: Colors.white)
                                      ),
                                      child: Icon(Icons.message,color: Colors.white,),
                                    ),
                                  ),
                                ],
                              ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 155,left: 20,right: 20),
                    child: TextField(
                        decoration: InputDecoration(
                            filled: true,
                            fillColor: Colors.white,
                            contentPadding: EdgeInsets.all(12),
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(8)
                            ),
                            hintText: 'Search anything....',
                            prefixIcon: Icon(Icons.search)
                        )
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
        automaticallyImplyLeading: false,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: SingleChildScrollView(
          child: SizedBox(
            width: double.infinity,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(height: 25,),
                  Text('Services',style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),
                SizedBox(height: 10,),
                _showProgress ? Center(
                  child: CircularProgressIndicator(
                    strokeWidth: 2,
                  ),
                ):
                ListView.builder(
                  physics: ScrollPhysics(),
                  shrinkWrap: true,
                  itemCount: 2,
                    itemBuilder: (context, index) {
                      return GestureDetector(
                        onTap: (){
                          Navigator.push(context, MaterialPageRoute(builder: (context) => Service_Details(),));
                        },
                        child: Container(
                          margin: EdgeInsets.only(bottom: 20),
                          height: 310,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            border: Border.all(color: Colors.grey)
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                               ListTile(
                                 leading: Image.asset('assets/ser.png'),
                                 title: Text('Work permit Application',style: TextStyle(fontWeight: FontWeight.bold),),
                                 subtitle: Text('Work permit',style: TextStyle(fontWeight: FontWeight.w500),),
                               ),
                                Divider(thickness: 1,color: Colors.grey,),
                                Text('  Visa Details'),
                                SizedBox(height: 5,),
                                Text('  Work Visa'),
                                SizedBox(height: 5,),
                                Text('  Residency Permit'),
                                SizedBox(height: 5,),
                                Text('  Other Documents'),
                                Divider(thickness: 1,color: Colors.grey,),
                                Text('Lorem ipsum dolor sit amet, consectetur adipiscing elit..'),
                                SizedBox(height: 15,),
                                Row(
                                  children: [
                                    Text('Price - ',style: TextStyle(fontSize: 16,fontWeight: FontWeight.bold),),
                                    Text('\$5,000',style: TextStyle(color: Appcolor.PrimaryColor,fontSize: 16,fontWeight: FontWeight.bold),)
                                  ],
                                )
                              ],
                            ),
                          ),
                        ),
                      );
                    },)
              ],
            ),
          ),
        ),
      ),
    ));
  }
}
