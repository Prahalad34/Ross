import 'package:flutter/material.dart';
import 'package:ross/Appcolor.dart';
class Personal_Details extends StatefulWidget {
  const Personal_Details({Key? key}) : super(key: key);

  @override
  State<Personal_Details> createState() => _Personal_DetailsState();
}

class _Personal_DetailsState extends State<Personal_Details> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(child: Scaffold(
      appBar: AppBar(
        title: Text('Personal Details',style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold)),
        leading: IconButton(onPressed: () { Navigator.pop(context); }, icon: Container(
            height: 40,
            width:40,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(4),
              border: Border.all(color: Colors.grey),
            ),
            child: Icon(Icons.arrow_back_ios_rounded,color: Colors.grey,size: 20,)),
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
                  Center(
                    child: Stack(
                      alignment: Alignment.center,
                      children: [
                        Image.asset('assets/woman.png'),
                        Padding(
                          padding: const EdgeInsets.all(15.0),
                          child: Icon(Icons.cloud_upload_outlined,color: Colors.white,size: 25,),
                        )
                      ],
                    ),
                  ),
                SizedBox(height: 20,),
                Text('Name',style: TextStyle(fontSize: 16,fontWeight: FontWeight.bold),),
                SizedBox(height: 10,),
                TextField(
                  decoration: InputDecoration(
                      contentPadding: EdgeInsets.all(12),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8)
                      ),
                      hintText: 'Arianna Deo'
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
                Text('Address',style: TextStyle(fontSize: 16,fontWeight: FontWeight.bold),),
                SizedBox(height: 10,),
                TextField(
                  decoration: InputDecoration(
                      contentPadding: EdgeInsets.all(12),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8)
                      ),
                      hintText: 'XYZ Main Street, City, State',
                    suffixIcon: Icon(Icons.location_on)
                  ),
                ),
                SizedBox(height: 150,),
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
                  child: Center(child: Text('Save',style: TextStyle(color: Colors.white),)),
                ),

              ],
            ),
          ),
        ),
      ),
    ));
  }
}
