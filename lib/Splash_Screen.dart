
import 'package:flutter/material.dart';
import 'package:ross/Appcolor.dart';
import 'package:ross/Login.dart';
import 'package:ross/UnbordingContent.dart';

class Splash_Screen extends StatefulWidget {
  const Splash_Screen({Key? key}) : super(key: key);

  @override
  State<Splash_Screen> createState() => _Splash_ScreenState();
}

class _Splash_ScreenState extends State<Splash_Screen> {

  int currentIndex = 0;
  late PageController _controller;

  @override
  void initState() {
    _controller = PageController(initialPage: 0);
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }



  @override
  Widget build(BuildContext context) {
  return Scaffold(
    backgroundColor: Colors.white,
    appBar: AppBar(
      backgroundColor: Colors.white,
      elevation: 0,
      actions: [
        TextButton(onPressed: (){
           Navigator.push(context, MaterialPageRoute(builder: (context) => Login(),));
        }, child: Text('Skip',style: TextStyle(color: Appcolor.PrimaryColor),))
      ],
    ),
    body: Padding(
      padding: const EdgeInsets.all(1),
          child: PageView.builder(
            controller: _controller,
            physics: ScrollPhysics(),
            onPageChanged: (int index){
              setState((){
               currentIndex = index;
              });
            },
            itemCount: contents.length,
              itemBuilder: (context, index) {
                return Column(
                //  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Image.asset(contents[index].image),
                    SizedBox(height: 30,),
                    Card(
                      clipBehavior:Clip.antiAlias,
                      elevation: 2,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.only(topLeft: Radius.circular(18),topRight: Radius.circular(18))),
                      child: Container(
                        height: 378,
                        width: double.infinity,
                        decoration: BoxDecoration(
                         // borderRadius: BorderRadius.only(topLeft: Radius.circular(30),topRight: Radius.circular(30)),
                          color: Colors.white
                        ),
                        child: Column(
                          children: [
                            SizedBox(height: 20,),
                            Container(
                              height: 10,
                              // decoration: BoxDecoration(
                              //   borderRadius: BorderRadius.circular(30),
                              //   color: Colors.yellow
                              // ),
                              child: ListView.builder(
                                scrollDirection: Axis.horizontal,
                                itemCount: contents.length,
                                // physics: ScrollPhysics(),
                                shrinkWrap: true,
                                itemBuilder: (context, index) {
                                  return Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Container(
                                        margin: EdgeInsets.symmetric(horizontal: 3.0),
                                        width: currentIndex==index?35: 8.0,
                                        height: 8,
                                        decoration: BoxDecoration(
                                            color: currentIndex==index? Appcolor.PrimaryColor:Appcolor.PrimaryColor5,
                                            borderRadius: BorderRadius.circular(10)
                                        ),
                                      )
                                    ],
                                  );
                                },),
                            ),
                            SizedBox(height: 50,),
                            Text(contents[index].title,
                              textAlign: TextAlign.center,

                              style:
                              TextStyle(fontSize: 27,fontWeight: FontWeight.bold,color: Appcolor.PrimaryColor),),
                            SizedBox(height: 10,),
                            Text(contents[index].discription,
                              textAlign: TextAlign.center,
                              style: TextStyle(fontSize: 15),),
                            InkWell(
                              // onTap: (){
                              //   if(index==contents.length-1){
                              //     Navigator.push(context, MaterialPageRoute(builder: (context) => Login(),));
                              //   }
                              //   _controller.nextPage(duration: Duration(milliseconds: 300), curve: Curves.bounceIn);
                              // },
                              child: Padding(
                                padding: const EdgeInsets.only(top: 50,left: 20,right: 20),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    if (index > 0)
                                      InkWell(
                                      onTap: () {
                                        if (index == 0) {
                                          Navigator.pop(context); // If it's the first page, go back to the previous screen
                                        } else {
                                          _controller.previousPage(
                                            duration: const Duration(milliseconds: 300),
                                            curve: Curves.bounceIn,
                                          ); // Navigate to the previous page
                                        }
                                      },
                                      child: Container(
                                        height:60,
                                        width: 60,
                                        decoration: BoxDecoration(
                                          border: Border.all(color: Colors.grey),
                                          shape: BoxShape.circle
                                        ),
                                        child: Icon(Icons.arrow_back,color: Colors.grey,),
                                      ),
                                    ),
                                    InkWell(
                                      onTap: (){
                                        if(index==contents.length-1){
                                          Navigator.push(context, MaterialPageRoute(builder: (context) => Login(),));
                                        }
                                        _controller.nextPage(duration: Duration(milliseconds: 300), curve: Curves.bounceIn);
                                      },
                                      child: CircleAvatar(
                                        radius: 30,
                                        backgroundColor: Appcolor.PrimaryColor,
                                        child: Icon(Icons.arrow_forward,color: Colors.white,),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            )

                          ],
                        ),
                      ),
                    ),
                  ],
                );
              },)
        ),
  );
  }
}
