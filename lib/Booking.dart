import 'dart:async';

import 'package:flutter/material.dart';
import 'package:ross/Details.dart';
class Booking extends StatefulWidget {
  const Booking({Key? key}) : super(key: key);

  @override
  State<Booking> createState() => _BookingState();
}

class _BookingState extends State<Booking> {


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
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Text('My Appointment',style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: SingleChildScrollView(
          child: SizedBox(
            width: double.infinity,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 15,),
                _showProgress ? Center(
                  child: CircularProgressIndicator(
                    strokeWidth: 2,
                  ),
                ):
                // Text('Services',style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),
                // SizedBox(height: 10,),
                ListView.builder(
                  physics: ScrollPhysics(),
                  shrinkWrap: true,
                  itemCount: 2,
                  itemBuilder: (context, index) {
                    return GestureDetector(
                      onTap: (){
                        Navigator.push(context, MaterialPageRoute(builder: (context) => Details(),));
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
                              // Row(
                              //   children: [
                              //     Text('Price - ',style: TextStyle(fontSize: 16,fontWeight: FontWeight.bold),),
                              //     Text('\$5,000',style: TextStyle(color: Appcolor.PrimaryColor,fontSize: 16,fontWeight: FontWeight.bold),)
                              //   ],
                              // )
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
