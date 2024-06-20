import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:ross/Appcolor.dart';
import 'map_picker_page.dart'; // Import the MapPickerPage
class Travel_Booking extends StatefulWidget {
  const Travel_Booking({Key? key}) : super(key: key);

  @override
  State<Travel_Booking> createState() => _Travel_BookingState();
}

class _Travel_BookingState extends State<Travel_Booking> {

  TextEditingController dateinput = TextEditingController();
  //text editing controller for text field

  @override
  void initState() {
    dateinput.text = ""; //set the initial value of text field
    super.initState();
  }


  @override
  Widget build(BuildContext context) {
    return SafeArea(child: Scaffold(
      appBar: AppBar(
        title: Text('Travel Booking',style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold)),
        leading: IconButton(onPressed: () { Navigator.pop(context); }, icon: Container(
            height: 30,
            width:30,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(4),
              border: Border.all(color: Colors.grey),
            ),
            child: Icon(Icons.arrow_back_ios_rounded,color: Colors.grey,size: 15,)),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: SingleChildScrollView(
          child: SizedBox(
            width: double.infinity,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Passenger Info',style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold)),
                SizedBox(height: 15,),
                Text('First Name',style: TextStyle(fontSize: 16,fontWeight: FontWeight.bold),),
                SizedBox(height: 10,),
                TextField(
                  decoration: InputDecoration(
                      contentPadding: EdgeInsets.all(12),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8)
                      ),
                      hintText: 'Arianna'
                  ),
                ),
                SizedBox(height: 15,),
                Text('Last Name',style: TextStyle(fontSize: 16,fontWeight: FontWeight.bold),),
                SizedBox(height: 10,),
                TextField(
                  decoration: InputDecoration(
                      contentPadding: EdgeInsets.all(12),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8)
                      ),
                      hintText: 'Deo'
                  ),
                ),
                SizedBox(height: 15,),
                Text('Email Address',style: TextStyle(fontSize: 16,fontWeight: FontWeight.bold),),
                SizedBox(height: 10,),
                TextField(
                  decoration: InputDecoration(
                      contentPadding: EdgeInsets.all(12),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8)
                      ),
                      hintText: 'arianna@gmail.com'
                  ),
                ),
                SizedBox(height: 15,),
                Text('Phone Number',style: TextStyle(fontSize: 16,fontWeight: FontWeight.bold),),
                SizedBox(height: 10,),
                TextField(
                  decoration: InputDecoration(
                      contentPadding: EdgeInsets.all(12),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8)
                      ),
                      hintText: '9999999999'
                  ),
                  keyboardType: TextInputType.phone,
                ),
                SizedBox(height: 15,),
                Text('Total Number of Adults',style: TextStyle(fontSize: 16,fontWeight: FontWeight.bold),),
                SizedBox(height: 10,),
                TextField(
                  decoration: InputDecoration(
                      contentPadding: EdgeInsets.all(12),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8)
                      ),
                      hintText: 'Enter number'
                  ),
                  keyboardType: TextInputType.number,
                ),
                SizedBox(height: 15,),
                Text('Total Number of Children',style: TextStyle(fontSize: 16,fontWeight: FontWeight.bold),),
                SizedBox(height: 10,),
                TextField(
                  decoration: InputDecoration(
                      contentPadding: EdgeInsets.all(12),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8)
                      ),
                      hintText: 'Enter number'
                  ),
                  keyboardType: TextInputType.number,
                ),
                SizedBox(height: 15,),
                Text('Destination',style: TextStyle(fontSize: 16,fontWeight: FontWeight.bold),),
                SizedBox(height: 10,),
                TextField(
                  decoration: InputDecoration(
                    contentPadding: EdgeInsets.all(12),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                    hintText: 'Enter destination',
                    suffixIcon: Icon(Icons.location_on),
                  ),
                ),
                SizedBox(height: 15,),
                Text('Travel Date',style: TextStyle(fontSize: 16,fontWeight: FontWeight.bold),),
                SizedBox(height: 10,),
                TextField(
                  controller: dateinput,
                  decoration: InputDecoration(
                      contentPadding: EdgeInsets.all(12),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8)
                      ),
                      hintText: "Select",
                      suffixIcon: Icon(Icons.date_range)
                  ),
                  readOnly: true,  //set it true, so that user will not able to edit text
                  onTap: () async {
                    DateTime? pickedDate = await showDatePicker(
                        context: context, initialDate: DateTime.now(),
                        firstDate: DateTime(2000), //DateTime.now() - not to allow to choose before today.
                        lastDate: DateTime(2101)
                    );

                    if(pickedDate != null ){
                      print(pickedDate);  //pickedDate output format => 2021-03-10 00:00:00.000
                      String formattedDate = DateFormat('yyyy-MM-dd').format(pickedDate);
                      print(formattedDate); //formatted date output using intl package =>  2021-03-16
                      //you can implement different kind of Date Format here according to your requirement

                      setState(() {
                        dateinput.text = formattedDate; //set output date to TextField value.
                      });
                    }else{
                      print("Date is not selected");
                    }
                  },
                ),
                SizedBox(height: 15,),
                Text('Desired Trip Amount',style: TextStyle(fontSize: 16,fontWeight: FontWeight.bold),),
                SizedBox(height: 10,),
                TextField(
                  decoration: InputDecoration(
                      contentPadding: EdgeInsets.all(12),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8)
                      ),
                      hintText: 'Enter Amount'
                  ),
                  keyboardType: TextInputType.number,
                ),
                SizedBox(height: 25,),
                Container(
                    height: 50,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      gradient:LinearGradient(
                        colors: [
                          Appcolor.PrimaryColor1,
                          Appcolor.PrimaryColor2
                          //add more colors for gradient
                        ],
                      ),
                    ),
                    child: TextButton(
                      child: Center(child: Text('Submit Request',style: TextStyle(color: Colors.white,))),
                      onPressed: () {
                        showAlertDialog(context);
                      },
                    )
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
        // InkWell(
        //   onTap: () {
        //     Navigator.pop(context);
        //   },
        //   child:
        //   Container(
        //     height: 50,
        //     width: 100,
        //     decoration: BoxDecoration(
        //         borderRadius: BorderRadius.circular(8),
        //         border: Border.all(color: Colors.grey)
        //     ),
        //     child: Center(
        //         child: Text('Cancel', style: TextStyle(color: Colors.grey),)),
        //   ),
        // ),
        // InkWell(
        //   onTap: () {
        //     // Navigator.push(
        //     //     context, MaterialPageRoute(builder: (context) => Login(),));
        //   },
        //   child: Container(
        //     height: 50,
        //     width: 100,
        //     decoration: BoxDecoration(
        //       borderRadius: BorderRadius.circular(8),
        //       gradient: LinearGradient(
        //         colors: [
        //           Appcolor.PrimaryColor1,
        //           Appcolor.PrimaryColor2
        //           //add more colors for gradient
        //         ],
        //       ),
        //     ),
        //     child: Center(
        //         child: Text('Logout', style: TextStyle(color: Colors.white),)),
        //   ),
        // )
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
                Image.asset('assets/bo.png'),
                SizedBox(height: 10,),
                Text(
                  'Booking Successful',
                  style: TextStyle(color: Colors.black, fontSize: 20,fontWeight: FontWeight.bold),
                )
              ],
            ),
            content: Text(
              "Your appointment request has been successfully submitted. We'll contact you soon.",
              textAlign: TextAlign.center,
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



