import 'package:flutter/material.dart';

class EntertainmentPage extends StatelessWidget {
  const EntertainmentPage({super.key});

  @override
  Widget build(BuildContext context) {
        var size = MediaQuery.of(context).size;

    return Scaffold(
       appBar: AppBar(
          backgroundColor: Colors.red,
          toolbarHeight: size.width * 0.2,
          title: Text('Entertainment',style: TextStyle(
            fontSize: size.width*0.05,
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