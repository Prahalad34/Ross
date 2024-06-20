import 'package:flutter/material.dart';
import 'package:ross/Appcolor.dart';
class Change_Password extends StatefulWidget {
  const Change_Password({Key? key}) : super(key: key);

  @override
  State<Change_Password> createState() => _Change_PasswordState();
}

class _Change_PasswordState extends State<Change_Password> {

  bool passwordVisible=false;

  @override
  void initState(){
    super.initState();
    passwordVisible=true;
  }

  bool passwordVisible1=false;

  @override
  void initState1(){
    super.initState();
    passwordVisible1=true;
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(child: Scaffold(
      appBar: AppBar(
        title: Text('Change Password',style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold)),
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
                SizedBox(height: 25,),
                   Text('Current Password',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 16),),
                SizedBox(height: 10,),
                TextField(
                  obscureText: passwordVisible,
                  decoration: InputDecoration(
                    contentPadding: EdgeInsets.all(12),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8)
                    ),
                    hintText: '●●●●●●●●●●●●●●',
                    suffixIcon: IconButton(
                      icon: Icon(passwordVisible
                          ? Icons.visibility
                          : Icons.visibility_off),
                      onPressed: () {
                        setState(
                              () {
                            passwordVisible = !passwordVisible;
                          },
                        );
                      },
                    ),
                    alignLabelWithHint: false,
                    filled: true,
                  ),
                  keyboardType: TextInputType.visiblePassword,
                  textInputAction: TextInputAction.done,
                ),
                SizedBox(height: 20,),
                Text('New Password',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 16),),
                SizedBox(height: 10,),
                TextField(
                  obscureText: passwordVisible1,
                  decoration: InputDecoration(
                    contentPadding: EdgeInsets.all(12),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8)
                    ),
                    hintText: '●●●●●●●●●●●●●●',
                    suffixIcon: IconButton(
                      icon: Icon(passwordVisible1
                          ? Icons.visibility
                          : Icons.visibility_off),
                      onPressed: () {
                        setState(
                              () {
                            passwordVisible1 = !passwordVisible1;
                          },
                        );
                      },
                    ),
                    alignLabelWithHint: false,
                    filled: true,
                  ),
                  keyboardType: TextInputType.visiblePassword,
                  textInputAction: TextInputAction.done,
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
