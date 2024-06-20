import 'package:flutter/material.dart';
import 'package:ross/Appcolor.dart';
class Chat1 extends StatefulWidget {
  const Chat1({Key? key}) : super(key: key);

  @override
  State<Chat1> createState() => _Chat1State();
}

class _Chat1State extends State<Chat1> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(child: Scaffold(
      appBar: AppBar(
       // automaticallyImplyLeading: false,
        toolbarHeight: 180, // Set this height
        flexibleSpace: Container(
          height: 180,
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
            padding: const EdgeInsets.only(left: 5),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ListTile(
                  leading: Image.asset('assets/chat.png'),
                  title: Text('Eliza beth',style: TextStyle(color: Colors.white),),
                  subtitle: Row(
                    children: [
                      Icon(Icons.circle,color: Colors.white,size: 8,),
                      SizedBox(width: 5,),
                      Text('Online',style: TextStyle(color: Colors.white)),
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
        // leading: IconButton(icon: Icon(Icons.arrow_back_ios,color: Colors.white,), onPressed: () {
        //   Navigator.pop(context);
        // },),
         automaticallyImplyLeading: false,
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
                   children: [
                     TextField(
                       decoration: InputDecoration(
                         contentPadding: EdgeInsets.all(12),
                         border: OutlineInputBorder(
                           borderRadius: BorderRadius.circular(12)
                         ),
                         hintText: 'Write your message here',
                         suffixIcon: Icon(Icons.link_rounded)
                       ),
                     ),
                     CircleAvatar(
                       radius: 25,
                       backgroundColor: Appcolor.PrimaryColor,
                       child: Icon(Icons.send,color: Colors.white,),
                     )
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
