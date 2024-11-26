import 'package:flutter/material.dart';

class ChatPage extends StatefulWidget {
  const ChatPage({super.key});

  @override
  State<ChatPage> createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff553370),
      body: Container(
        margin: EdgeInsets.only(top: 60.0, left: 20.0, right: 20.0),
        child: Column(children: [
        Row(children: [Icon(Icons.arrow_back_ios_new_outlined, color: Color(0xffc199cd),
        ),
        SizedBox(width: 30.0,), 
        Text("Savindu Nethsara",
        style: TextStyle(
          color: Color(0xffc199cd),
          fontSize: 30.0,
          fontWeight: FontWeight.w500
        ),
        ) ,
        
        
        ],
        ),
        SizedBox(height: 10.0,),
        Container(
          width: MediaQuery.of(context).size.width/0.15,
          height: MediaQuery.of(context).size.height/ 1.15,
          decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.only(topLeft: Radius.circular(20),topRight: Radius.circular(20))),
          child: Column(children: [
             Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
             ClipRRect(
              borderRadius: BorderRadius.circular(60),
               child: Image.asset(
                             'assets/profile01.jpeg',
                          height: 150,
                          width: 150,
                          fit: BoxFit.cover,
                        ),),
             ],),
             SizedBox(width: 200.0,),
          Text ("Savindu Nethsara",style: TextStyle(color: Colors.black, fontSize: 20.0, fontWeight: FontWeight.w500),),


          ],),
        
        )
        
      ],),
      ),
    );
  }
}