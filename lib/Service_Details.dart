import 'dart:ui';

import 'package:dotted_border/dotted_border.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:ross/Appcolor.dart';
import 'package:ross/Chat1.dart';
class Service_Details extends StatefulWidget {
  const Service_Details({Key? key}) : super(key: key);

  @override
  State<Service_Details> createState() => _Service_DetailsState();
}

class _Service_DetailsState extends State<Service_Details> {

  TextEditingController dateinput = TextEditingController();
  //text editing controller for text field

  @override
  void initState() {
    dateinput.text = ""; //set the initial value of text field
    super.initState();
  }

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


  @override
  Widget build(BuildContext context) {
    return SafeArea(child: Scaffold(
      appBar: AppBar(
        toolbarHeight: 220, // Set this height
        flexibleSpace: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
                Container(
                  height: 220,
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
                    padding: const EdgeInsets.all(25.0),
                    child: Column(
                      children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                IconButton(onPressed: () { Navigator.pop(context); }, icon: Container(
                                    height: 30,
                                    width:30,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(4),
                                      border: Border.all(color: Colors.white),
                                    ),
                                    child: Icon(Icons.arrow_back_ios_rounded,color: Colors.white,size: 15,)),
                                ),
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
                                )
                              ],
                            ),
                        ListTile(
                          leading: Image.asset('assets/ser.png'),
                          title: Text('Work permit Application',style: TextStyle(color: Colors.white),),
                          subtitle: Text('Select Your Date & Time',style: TextStyle(color: Colors.white)),
                        ),
                        SizedBox(height: 10,),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Container(
                              height: 26,
                              width: 110,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(4),
                                color: Appcolor.PrimaryColor
                              ),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Icon(Icons.date_range,color: Colors.white,),
                                  SizedBox(width: 5,),
                                  Text('08.03.2024',style: TextStyle(color: Colors.white),)
                                ],
                              ),
                            ),
                            Container(
                              height: 26,
                              width: 96,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(4),
                                  color: Appcolor.PrimaryColor
                              ),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Icon(Icons.access_time_sharp,color: Colors.white,),
                                  SizedBox(width: 5,),
                                  Text('08:00 AM',style: TextStyle(color: Colors.white),)
                                ],
                              ),
                            ),
                            Container(
                              height: 26,
                              width: 64,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(4),
                                  color: Appcolor.PrimaryColor
                              ),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Icon(Icons.euro,color: Colors.white,),
                                  SizedBox(width: 5,),
                                  Text('100',style: TextStyle(color: Colors.white),)
                                ],
                              ),
                            )
                          ],
                        )

                      ],
                    ),
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
              children: [

                Container(
                  height: 190,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(color: Colors.grey)
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('Documents Required',style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),
                        Divider(thickness: 2,color: Colors.grey,),
                        Text('  Visa Details'),
                        SizedBox(height: 5,),
                        Text('  Work Visa'),
                        SizedBox(height: 5,),
                        Text('  Residency Permit'),
                        SizedBox(height: 5,),
                        Text('  Other Documents'),
                      ],
                    ),
                  ),
                ),
                SizedBox(height: 25,),
                Container(
                  height: 250,
                  width: double.infinity,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(color: Colors.grey)
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('Description',style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),
                        Divider(thickness: 2,color: Colors.grey,),
                        Text('  Lorem ipsum dolor sit amet, consectetur\n  adipiscing elit, sed do eiusmod tempor\n  incididunt ut labore et dolore magna\n  aliqua. Ut enim ad minim veniam'),
                        SizedBox(height: 10,),
                        Text('  Lorem ipsum dolor sit amet, consectetur \n  adipiscing elit, sed do eiusmod tempor\n  incididunt ut labore et dolore magna\n  aliqua. Ut enim ad minim veniam'),
                        


                      ],
                    ),
                  ),
                ),
                SizedBox(height: 10,),
                Text('Personal Details',style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold)),
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
                  onTap: _openFilePicker,
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
                      child: Center(child: Text('Book Appointment',style: TextStyle(color: Colors.white,))),
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


