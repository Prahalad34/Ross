import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:ross/Appcolor.dart';
import 'package:ross/Home.dart';
import 'package:ross/Home1.dart';
class Sign_up extends StatefulWidget {
  const Sign_up({Key? key}) : super(key: key);

  @override
  State<Sign_up> createState() => _Sign_upState();
}

class _Sign_upState extends State<Sign_up> {

  GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  final _Namecontroller = TextEditingController();
  final _Emailcontroller = TextEditingController();
  final _Numbercontroller = TextEditingController();
  final _Addresscontroller = TextEditingController();
  bool _validate = false;
  bool _isLoading = false;

  @override
  void dispose() {
    _Namecontroller.dispose();
    _Emailcontroller.dispose();
    _Numbercontroller.dispose();
    _Addresscontroller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(child: Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: SingleChildScrollView(
          child: SizedBox(
            width: double.infinity,
            child:Form(
              key: _formKey,
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: 35,),
                    Center(child: Text('Sign up',style: TextStyle(color: Appcolor.PrimaryColor,fontSize: 25,fontWeight: FontWeight.bold),)),
                    SizedBox(height: 15,),
                    Center(child: Text('Kindly input the required details to complete the\n registration process.',textAlign: TextAlign.center,style: TextStyle(color: Colors.grey,fontSize: 16),)),
                    SizedBox(height: 35,),
                    Text('Name',style: TextStyle(fontSize: 18,fontWeight: FontWeight.w700),),
                    SizedBox(height: 5,),
                    TextFormField(
                      controller: _Namecontroller,
                      decoration: InputDecoration(
                        contentPadding: EdgeInsets.all(8),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                        hintText: 'Enter your name',
                        errorText: _validate ? "Enter a valid name" : null,
                      ),
                      onSaved: (val) {
                        //  phone = val;
                      },
                      autovalidateMode: AutovalidateMode.onUserInteraction,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter your name';
                        }
                        return null;
                      },
                    ),
                    SizedBox(height: 10,),
                    Text('Email Address',style: TextStyle(fontSize: 18,fontWeight: FontWeight.w700),),
                    SizedBox(height: 5,),
                    TextFormField(
                      controller: _Emailcontroller,
                      decoration: InputDecoration(
                        contentPadding: EdgeInsets.all(8),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                        hintText: 'Enter your email',
                        errorText: _validate ? "Enter a valid email" : null,
                      ),
                        onSaved: (val) {
                          //  phone = val;
                        },
                        autovalidateMode: AutovalidateMode.onUserInteraction,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter a email';
                          }
                          final emailRegex = RegExp(r'^[^@]+@[^@]+\.[^@]+');
                          if (!emailRegex.hasMatch(value)) {
                            return 'Please enter a valid email';
                          }
                          return null;
                        }
                    ),
                    SizedBox(height: 10,),
                    Text('Phone Number',style: TextStyle(fontSize: 18,fontWeight: FontWeight.w700),),
                    SizedBox(height: 5,),
                    TextFormField(
                      controller: _Numbercontroller,
                      inputFormatters: [
                        LengthLimitingTextInputFormatter(10), // Restrict input to 10 characters
                        FilteringTextInputFormatter.digitsOnly, // Allow only digits
                      ],
                      decoration: InputDecoration(
                        contentPadding: EdgeInsets.all(8),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                        hintText: 'Enter the number',
                        errorText: _validate ? "Enter a valid 10-digit number" : null,
                      ),
                      onSaved: (val) {
                        //  phone = val;
                      },
                      autovalidateMode: AutovalidateMode.onUserInteraction,
                      keyboardType: TextInputType.number,
                      validator: (value) {
                        if (value == null || value.isEmpty || value.length != 10) {
                          return 'Enter a valid 10-digit number';
                        }
                        return null;
                      },
                    ),
                    SizedBox(height: 10,),
                    Text('Address',style: TextStyle(fontSize: 18,fontWeight: FontWeight.w700),),
                    SizedBox(height: 5,),
                    TextFormField(
                      controller: _Addresscontroller,
                      decoration: InputDecoration(
                        contentPadding: EdgeInsets.all(8),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                        hintText: 'Enter your Details',
                        suffixIcon: Icon(Icons.location_on),
                        errorText: _validate ? "Enter a valid address" : null,
                      ),
                      onSaved: (val) {
                        //  phone = val;
                      },
                      autovalidateMode: AutovalidateMode.onUserInteraction,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter your address';
                        }
                        return null;
                      },
                    ),
                    SizedBox(height: 25,),
                    TextButton(
                      onPressed: () {
                        if (_formKey.currentState!.validate()) {
                          setState(() {
                            _isLoading = true; // Start loading
                          });
                          // Simulate a delay for loading
                          Future.delayed(Duration(seconds: 2), () {
                            setState(() {
                              _isLoading = false; // Stop loading
                            });
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) => Home1()),
                            );
                          });
                        }
                      },
                      child: Container(
                        height: 50,
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
                          child: _isLoading
                              ? CircularProgressIndicator(color: Colors.white)
                              : Text(
                            'Continue',
                            style: TextStyle(color: Colors.white),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: 10,),
                    Row(
                      children: [
                        Text('By continuing, you agree to our  '),
                        Text('Terms of Service',style: TextStyle(color: Appcolor.PrimaryColor,decoration: TextDecoration.underline),)
                      ],
                    ),
                  ],
                ),
            ),
            ),
          ),
        ),
      ),
    );
  }
}
