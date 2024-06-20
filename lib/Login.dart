import 'package:flutter/material.dart';
import 'package:intl_phone_field/intl_phone_field.dart';
import 'package:ross/Appcolor.dart';
import 'package:ross/Otp.dart';
class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(child: Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: SingleChildScrollView(
          child: SizedBox(
            width: double.infinity,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 35,),
                Center(child: Text('Login',style: TextStyle(color: Appcolor.PrimaryColor,fontSize: 25,fontWeight: FontWeight.bold),)),
                SizedBox(height: 15,),
                Center(child: Text('Welcome back to the app',textAlign: TextAlign.center,style: TextStyle(color: Colors.grey,fontSize: 16),)),
                SizedBox(height: 35,),
                Text('Phone Number',style: TextStyle(fontSize: 18,fontWeight: FontWeight.w700),),
                SizedBox(height: 15,),
                Container(
                    height: 80,
                    decoration:BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: IntlPhoneField(
                      flagsButtonPadding: const EdgeInsets.all(8),
                      dropdownIconPosition: IconPosition.trailing,
                      decoration: const InputDecoration(
                        contentPadding: EdgeInsets.all(12),
                        hintText: 'Phone Number',
                        border: OutlineInputBorder(
                          // borderSide: BorderSide(),
                        ),
                      ),
                      initialCountryCode: 'IN',

                      onChanged: (phone) {
                        print(phone.completeNumber);
                      },
                    )
                ),
                SizedBox(height: 70,),
                GestureDetector(
                  onTap: (){
                    Navigator.push(context, MaterialPageRoute(builder: (context) => Otp(),));
                  },
                  child: Container(
                    height: 50,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      gradient:LinearGradient(
                        colors: [
                          Appcolor.PrimaryColor1,
                          Appcolor.PrimaryColor2

                        ],
                      ),
                    ),
                    child: Center(child: Text('Get Otp',style: TextStyle(color: Colors.white),)),
                  ),
                ),
                // SizedBox(height: 10,),
                // Table(
                //     border: TableBorder.all(), // Allows to add a border decoration around your table
                //     children: [
                //       TableRow(children :[
                //         Text('Year'),
                //         Text('Lang'),
                //         Text('Author'),
                //       ]),
                //       TableRow(children :[
                //         Text('2011',),
                //         Text('Dart'),
                //         Text('Lars Bak'),
                //       ]),
                //       TableRow(children :[
                //         Text('1996'),
                //         Text('Java'),
                //         Text('James Gosling'),
                //       ]),
                //     ]
                // ),
              ],
            ),
          ),
        ),
      ),
    ));
  }
}
