import 'dart:ui';

import 'package:dotted_border/dotted_border.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:ross/Appcolor.dart';
class Online_Service extends StatefulWidget {
  const Online_Service({Key? key}) : super(key: key);

  @override
  State<Online_Service> createState() => _Online_ServiceState();
}

class _Online_ServiceState extends State<Online_Service> {



  String? _filePath;

  Future<void> _openFilePicker() async {
    try {
      FilePickerResult? result = await FilePicker.platform.pickFiles();

      if (result != null) {
        setState(() {
          _filePath = result.files.single.path!;
        });
      }
    } catch (e) {
      print("Error picking file: $e");
    }
  }

  TextEditingController dateinput = TextEditingController();
  //text editing controller for text field

  @override
  void initState() {
    dateinput.text = ""; //set the initial value of text field
    super.initState();
  }

  TextEditingController timeinput = TextEditingController();
  //text editing controller for text field

  @override
  void initState1() {
    timeinput.text = ""; //set the initial value of text field
    super.initState();
  }


  @override
  Widget build(BuildContext context) {
    return SafeArea(child: Scaffold(
      appBar: AppBar(
        title: Text('Online Service',style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold)),
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
                SizedBox(height: 15,),
                  Text('Title',style: TextStyle(fontSize: 16,fontWeight: FontWeight.bold),),
                SizedBox(height: 10,),
                TextField(
                  decoration: InputDecoration(
                    contentPadding: EdgeInsets.all(12),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8)
                    ),
                    hintText: 'Residency applications'
                  ),
                ),
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
                Text('Date of Birth',style: TextStyle(fontSize: 16,fontWeight: FontWeight.bold),),
                SizedBox(height: 10,),
                TextField(
                  controller: dateinput,
                  decoration: InputDecoration(
                      contentPadding: EdgeInsets.all(12),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8)
                      ),
                      hintText: "08.03.2024",
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
                Text('Time',style: TextStyle(fontSize: 16,fontWeight: FontWeight.bold),),
                SizedBox(height: 10,),
            TextField(
              controller: timeinput,
              decoration: InputDecoration(
                contentPadding: EdgeInsets.all(12),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
                hintText: '08:00 AM',
                suffixIcon: Icon(Icons.access_time_sharp),
              ),
              readOnly: true,
              onTap: () async {
                TimeOfDay? pickedTime = await showTimePicker(
                  initialTime: TimeOfDay.now(),
                  context: context,
                );

                if (pickedTime != null) {
                  print(pickedTime.format(context)); // Output: 10:51 PM
                  DateTime parsedTime =
                  DateFormat.jm().parse(pickedTime.format(context).toString());
                  print(parsedTime); // Output: 1970-01-01 22:53:00.000
                  String formattedTime = DateFormat('hh:mm a').format(parsedTime);
                  print(formattedTime); // Output: 10:53 PM

                  setState(() {
                    timeinput.text = formattedTime;
                  });
                } else {
                  print("Time is not selected");
                }
              },
            ),

            SizedBox(height: 15,),
                Text('Date ',style: TextStyle(fontSize: 16,fontWeight: FontWeight.bold),),
                SizedBox(height: 10,),
                TextField(
                  controller: dateinput,
                  decoration: InputDecoration(
                      contentPadding: EdgeInsets.all(12),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8)
                      ),
                      hintText: "08.03.2024",
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
                Text('Description',style: TextStyle(fontSize: 16,fontWeight: FontWeight.bold),),
                SizedBox(height: 10,),
                TextField(
                  maxLines: 5,
                  decoration: InputDecoration(
                      contentPadding: EdgeInsets.all(12),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8)
                      ),
                      hintText: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam'
                  ),
                ),
                SizedBox(height: 15,),
                Text('Upload Document',style: TextStyle(fontSize: 16,fontWeight: FontWeight.bold),),
                SizedBox(height: 10,),
                Container(
                  height: 150,
                  child: DottedBorder(
                    dashPattern: [5],
                    strokeWidth: 2,
                    child: InkWell(
                      onTap: _openFilePicker,
                      child: Column(
                        children: [
                          SizedBox(height: 20,),
                          Center(child: Image.asset('assets/pdf.png')),
                          Row(
                            mainAxisAlignment:MainAxisAlignment.center,
                            children: [
                              Text('Choose',style: TextStyle(color: Appcolor.PrimaryColor),),
                              Text(' file to upload')
                            ],
                          ),
                          Text('Please select your document type & upload\n an image of your document below:')


                        ],
                      ),
                    ),
                    borderType: BorderType.RRect,
                    radius: Radius.circular(12),
                   // dashPattern: [10,5,10,5,10,5],
                  ),
                ),
                SizedBox(height: 15,),
                InkWell(
                  onTap:_openFilePicker,
                  child: Container(
                    height: 30,
                    width: 130,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5),
                      border: Border.all(color: Appcolor.PrimaryColor)
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          height: 16,
                          width: 16,
                          decoration: BoxDecoration(
                            border: Border.all(color: Appcolor.PrimaryColor),
                            shape: BoxShape.circle
                          ),
                          child: Icon(Icons.add,size: 15,color: Appcolor.PrimaryColor,),
                          ),
                        SizedBox(width: 2,),
                        Text('Add Document',style: TextStyle(color: Appcolor.PrimaryColor),),
                      ],
                    ),
                  ),
                ),
                SizedBox(height: 15,),
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

