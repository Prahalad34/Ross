import 'dart:ui';

import 'package:dotted_border/dotted_border.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:ross/Appcolor.dart';
class Details extends StatefulWidget {
  const Details({Key? key}) : super(key: key);

  @override
  State<Details> createState() => _DetailsState();
}

class _DetailsState extends State<Details> {


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

  int isVAlue =0;
  int isActive =0;

  @override
  Widget build(BuildContext context) {
    return SafeArea(child: Scaffold(
      appBar: AppBar(
        title: Text('Residency applications',style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),
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
              children: [
                SizedBox(height: 15,),
                 Row(
                   mainAxisAlignment: MainAxisAlignment.spaceAround,
                   children: [
                     InkWell(
                       onTap: (){
                         setState((){
                           isVAlue =0;
                           isActive =0;
                         });
                       },
                         child: Text('Your Details',style: TextStyle(fontSize: 16,fontWeight: FontWeight.bold,
                             color: isVAlue==0? Colors.black:Colors.grey),)),
                     InkWell(
                         onTap: (){
                           setState((){
                             isVAlue =1;
                             isActive =1;
                           });
                         },
                         child: Text('Admin Update',style: TextStyle(fontSize: 16,fontWeight: FontWeight.bold,
                             color: isVAlue==1? Colors.black:Colors.grey )))
                   ],
                 ),
                Divider(thickness: 1,color: Colors.grey,),
                SizedBox(height: 25,),
                isActive ==0?
                    YourDetails():
                    AdminUpdate()
              ],
            ),
          ),
        ),
      ),
    ));
  }

  Widget YourDetails()=> Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Container(
        height: 350,
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
              Text('Details',style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),
              Divider(thickness: 2,color: Colors.grey,),
              SizedBox(height: 10,),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('Title',style: TextStyle(color: Colors.grey,fontSize: 16),),
                  Text('Residency applications',style: TextStyle(fontSize: 16,fontWeight: FontWeight.bold))
                ],
              ),
              SizedBox(height: 10,),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('Name',style: TextStyle(color: Colors.grey,fontSize: 16),),
                  Text('Arianna Deo',style: TextStyle(fontSize: 16,fontWeight: FontWeight.bold))
                ],
              ),
              SizedBox(height: 10,),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('Email',style: TextStyle(color: Colors.grey,fontSize: 16),),
                  Text('arianna@gmail.com',style: TextStyle(fontSize: 16,fontWeight: FontWeight.bold))
                ],
              ),
              SizedBox(height: 10,),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('Phone',style: TextStyle(color: Colors.grey,fontSize: 16),),
                  Text('9999999999',style: TextStyle(fontSize: 16,fontWeight: FontWeight.bold))
                ],
              ),
              SizedBox(height: 10,),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('Date of Birth',style: TextStyle(color: Colors.grey,fontSize: 16),),
                  Text('08.03.2024',style: TextStyle(fontSize: 16,fontWeight: FontWeight.bold))
                ],
              ),
              SizedBox(height: 10,),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('Date of Birth',style: TextStyle(color: Colors.grey,fontSize: 16),),
                  Text('08.03.2024',style: TextStyle(fontSize: 16,fontWeight: FontWeight.bold))
                ],
              ),
              SizedBox(height: 10,),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('Time',style: TextStyle(color: Colors.grey,fontSize: 16),),
                  Text('08:00 AM',style: TextStyle(fontSize: 16,fontWeight: FontWeight.bold))
                ],
              ),
              SizedBox(height: 10,),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('Date',style: TextStyle(color: Colors.grey,fontSize: 16),),
                  Text('05.05.2024',style: TextStyle(fontSize: 16,fontWeight: FontWeight.bold))
                ],
              ),
            ],
          ),
        ),
      ),
      SizedBox(height: 15,),
      Container(
        height: 170,
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
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('Description',style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),
                 Container(
                   height: 30,
                   width: 30,
                   decoration: BoxDecoration(
                     borderRadius: BorderRadius.circular(6),
                     color: Appcolor.PrimaryColor5
                   ),
                   child: Icon(Icons.edit,color: Appcolor.PrimaryColor,size: 15,),
                 )
                ],
              ),
              Divider(thickness: 2,color: Colors.grey,),
              Text('  Lorem ipsum dolor sit amet, consectetur\n  adipiscing elit, sed do eiusmod tempor\n  incididunt ut labore et dolore magna\n  aliqua. Ut enim ad minim veniam'),
              SizedBox(height: 10,),
             // Text('  Lorem ipsum dolor sit amet, consectetur \n  adipiscing elit, sed do eiusmod tempor\n  incididunt ut labore et dolore magna\n  aliqua. Ut enim ad minim veniam'),



            ],
          ),
        ),
      ),
      SizedBox(height: 10,),
      Text('Uploaded 4 files',style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),
      SizedBox(height: 10,),
      ListView.builder(
        physics: ScrollPhysics(),
        shrinkWrap: true,
        itemCount: 4,
        itemBuilder: (context, index) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              margin: EdgeInsets.only(bottom: 20),
              child: ListTile(
                leading: Container(
                  height: 60,
                  width: 60,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                 //   border: Border.all(color: Colors.grey)
                  ),
                  child: Image.asset('assets/pdf1.png',height: 100,width: 100,),
                ),
                title: Text('Residency Permit.pdf'),
                subtitle: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('2.5 MB'),
                    Text('09.05.2024')
                  ],
                ),
                trailing: Container(
                  height: 30,
                  width: 30,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(6),
                      color: Appcolor.PrimaryColor5
                  ),
                  child: Icon(Icons.delete,color: Appcolor.PrimaryColor,size: 15,),
                )
              ),
            ),
          ],
        );
      },),
      SizedBox(height: 10,),
      Container(
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
    ],
  );


  Widget AdminUpdate()=> Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Container(
        height: 170,
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
              //Text('  Lorem ipsum dolor sit amet, consectetur \n  adipiscing elit, sed do eiusmod tempor\n  incididunt ut labore et dolore magna\n  aliqua. Ut enim ad minim veniam'),


            ],
          ),
        ),
      ),
      SizedBox(height: 10,),
      Text('Uploaded 4 files',style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),
      SizedBox(height: 10,),
      ListView.builder(
        physics: ScrollPhysics(),
        shrinkWrap: true,
        itemCount: 4,
        itemBuilder: (context, index) {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                margin: EdgeInsets.only(bottom: 20),
                child: ListTile(
                    leading: Container(
                      height: 60,
                      width: 60,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                        //   border: Border.all(color: Colors.grey)
                      ),
                      child: Image.asset('assets/pdf1.png',height: 100,width: 100,),
                    ),
                    title: Text('Residency Permit.pdf'),
                    subtitle: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('2.5 MB'),
                        Text('09.05.2024')
                      ],
                    ),
                    trailing: IconButton(
                      icon: Container(
                        height: 30,
                        width: 30,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(6),
                            color: Appcolor.PrimaryColor5
                        ),
                        child: Icon(Icons.download,color: Appcolor.PrimaryColor,size: 15,),
                      ), onPressed: () {
                      showAlertDialog(context);
                    },
                    )
                ),
              ),
            ],
          );
        },),
    ],
  );

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
          onTap: ()
  {
    Navigator.push(
        context, MaterialPageRoute(builder: (context) => Details(),));
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
                child: Text('Submit', style: TextStyle(color: Colors.white),)),
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
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
               Text('Upload Document'),
                SizedBox(height: 10,),
                Container(
                  height: 150,
                  child: DottedBorder(
                    dashPattern: [5],
                    strokeWidth: 2,
                    child: Column(
                      children: [
                        SizedBox(height: 20,),
                        Center(child: Image.asset('assets/pdf.png')),
                        Row(
                          mainAxisAlignment:MainAxisAlignment.center,
                          children: [
                            Text('Choose',style: TextStyle(color: Appcolor.PrimaryColor,fontSize: 12),),
                            Text(' file to upload',style: TextStyle(fontSize: 12))
                          ],
                        ),
                        Text('Please select your document type & upload\n an image of your document below:',style: TextStyle(fontSize: 10),)


                      ],
                    ),
                    borderType: BorderType.RRect,
                    radius: Radius.circular(12),
                    // dashPattern: [10,5,10,5,10,5],
                  ),
                ),
              ],
            ),
            // content: Text(
            //   "Are you sure you want to logout?",
            //   style: TextStyle(color: Colors.grey),
            // ),
            actions: [
              okButton,
            ],
          ),
        ],
      );
    },

  );
}

class YourDetailsTab extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text('Your Details Tab Content'),
    );
  }
}

class AdminUpdateTab extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text('Admin Update Tab Content'),
    );
  }
}

