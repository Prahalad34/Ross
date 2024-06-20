import 'package:flutter/material.dart';
class Help_Support extends StatefulWidget {
  const Help_Support({Key? key}) : super(key: key);

  @override
  State<Help_Support> createState() => _Help_SupportState();
}

class _Help_SupportState extends State<Help_Support> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(child: Scaffold(
      appBar: AppBar(
        title: Text('Help & Support',style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),
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
              children: [
                    Text('Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Suspendisse faucibus interdum posuere lorem. Sit amet justo donec enim diam vulputate. Iaculis at erat pellentesque adipiscing.'),
                   SizedBox(height: 20,),
                   Text('Feugiat vivamus at augue eget arcu dictum. Consectetur purus ut faucibus pulvinar elementum integer enim neque volutpat. Nunc non blandit massa enim nec dui nunc mattis. A condimentum vitae sapien pellentesque habitant. Ipsum dolor sit amet consectetur adipiscing elit.'),
                   SizedBox(height: 20,),
                   Text('At auctor urna nunc id cursus metus aliquam eleifend. Bibendum neque egestas congue quisque egestas diam in. Volutpat est velit egestas dui id. Malesuada fames ac turpis egestas. Augue eget arcu dictum varius duis at consectetur lorem donec.'),
                   SizedBox(height: 20,),
                   Text('Aenean sed adipiscing diam donec. Diam sollicitudin tempor id eu nisl nunc mi ipsum faucibus. Purus sit amet volutpat consequat mauris. Adipiscing elit ut aliquam purus sit amet luctus. Augue ut lectus arcu bibendum.')
              ],
            ),
          ),
        ),
      ),
    ));
  }
}
