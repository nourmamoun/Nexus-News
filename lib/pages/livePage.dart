import 'package:flutter/material.dart';

class LivePage extends StatelessWidget {
  const LivePage({super.key});

  @override
  Widget build(BuildContext context) {
     var size = MediaQuery.of(context).size;

    return Scaffold(
       appBar: AppBar(
          backgroundColor: Colors.red,
          toolbarHeight: size.width * 0.2,
          title: Text('Live News',style: TextStyle(
            fontSize: size.width*0.07,
            fontWeight: FontWeight.w500,
            
          ),),
           iconTheme: IconThemeData(
          size: size.width * 0.09, 
          color: Colors.white,
         ),
          centerTitle: true,
          titleTextStyle:const TextStyle(
            fontWeight: FontWeight.w400,
            letterSpacing: 2
          ),
        ),
    );
  }
}