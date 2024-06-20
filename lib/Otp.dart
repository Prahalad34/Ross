import 'package:flutter/material.dart';
import 'package:pin_code_text_field/pin_code_text_field.dart';
import 'package:ross/Appcolor.dart';
import 'package:ross/Sign_up.dart';
class Otp extends StatefulWidget {
  const Otp({Key? key}) : super(key: key);

  @override
  State<Otp> createState() => _OtpState();
}

class _OtpState extends State<Otp> {


  TextEditingController controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SafeArea(child: Scaffold(
      appBar: AppBar(
        title: Text(""),
        leading: IconButton(onPressed: () { Navigator.pop(context); }, icon: Container(
          height: 40,
            width: 40,
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
                SizedBox(height: 35,),
                Center(child: Text('Verification Code',style: TextStyle(color: Appcolor.PrimaryColor,fontSize: 25,fontWeight: FontWeight.bold),)),
                SizedBox(height: 15,),
                Center(child: Text('Enter the 4-digit code sent to you at\n 99999-99999',textAlign: TextAlign.center,style: TextStyle(color: Colors.grey,fontSize: 16),)),
                SizedBox(height: 25,),
                Center(
                  child: PinCodeTextField(
                    controller: controller,
                    maxLength: 4, // Set the length of the OTP
                    autofocus: true,
                    wrapAlignment: WrapAlignment.spaceAround,
                    pinBoxWidth: 50,
                    pinBoxHeight: 50,
                    pinBoxRadius: 10,
                    pinBoxBorderWidth: 1,
                    pinBoxOuterPadding: EdgeInsets.symmetric(horizontal: 12),
                    onDone: (text) {
                      // This callback is triggered when the user enters the complete OTP
                      // print("OTP Entered: $text");
                    },
                  ),

                ),
                SizedBox(height: 70,),
                GestureDetector(
                  onTap: (){
                    Navigator.push(context, MaterialPageRoute(builder: (context) => Sign_up(),));
                  },
                  child: Container(
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
                    child: Center(child: Text('Continue',style: TextStyle(color: Colors.white),)),
                  ),
                ),
                SizedBox(height: 10,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text('Time Remaining 01:45 '),
                    Text(' Resend OTP',style: TextStyle(color: Appcolor.PrimaryColor),)
                  ],
                )

              ],
            ),
          ),
        ),
      ),
    ));
  }
}
