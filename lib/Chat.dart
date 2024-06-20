import 'dart:async';

import 'package:flutter/material.dart';
class Chat extends StatefulWidget {
  const Chat({Key? key}) : super(key: key);

  @override
  State<Chat> createState() => _ChatState();
}

class _ChatState extends State<Chat> {

  bool _showProgress = true;

  @override
  void initState() {
    super.initState();
    // Set the timer to hide the CircularProgressIndicator after 5 seconds
    Timer(Duration(seconds: 3), () {
      setState(() {
        _showProgress = false;
      });
    });
  }


  @override
  Widget build(BuildContext context) {
    return SafeArea(child: Scaffold(
      appBar: AppBar(
        title: Text('Notification',style: TextStyle(fontWeight: FontWeight.bold),),
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
                // Text('Notification',style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),
                SizedBox(height: 10,),
                _showProgress ? Center(
                  child: CircularProgressIndicator(
                    strokeWidth: 2,
                  ),
                ):
                ListView.builder(
                  physics: ScrollPhysics(),
                  shrinkWrap: true,
                  itemCount: 10,
                  itemBuilder: (BuildContext context, int index) {
                    return Padding(
                      padding: const EdgeInsets.only(bottom: 20),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                           // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Image.asset('assets/woman.png'),
                              SizedBox(width: 10,),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text('New User Discount',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 16),),
                                      SizedBox(width: 70,),
                                      Text('19 m ago',style: TextStyle(color: Colors.grey)),
                                    ],
                                  ),
                                  Text('Special for new user You will get 40% off\n discount in every places.',style: TextStyle(color: Colors.grey),),
                                ],
                              )
                            ],
                          ),
                          // ListTile(
                          //   leading:  Image.asset('assets/woman.png'),
                          //   title:  Text('New User Discount',style: TextStyle(fontWeight: FontWeight.bold),),
                          //   subtitle:  Text('Special for new user You will get 40% off discount in every places.',style: TextStyle(fontSize: 10),),
                          //   trailing: Text('19 m ago'),
                          // ),
                          SizedBox(height: 10,),
                          Divider(color: Colors.grey,)
                        ],
                      ),
                    );
                  },

                )
              ],
            ),
          ),
        ),
      ),
    ));
  }
}
