import 'package:flutter/material.dart';

class ChannelsContainer extends StatelessWidget {
  const ChannelsContainer({super.key,required this.width,required this.height,required this.text,required this.ontap});
final width;
final height;
final text;
final ontap;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: ontap,
      child: Container(
                padding: EdgeInsets.all(10),
                margin: EdgeInsets.only(top: 10,bottom: 10),
                width: width,
                height: height*0.2,
      
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: const Color.fromARGB(255, 44, 43, 43),
                  boxShadow: [BoxShadow(
                    color: Colors.black,
                    offset: Offset(0, 3),
                    blurRadius: 4
                  )],
                  
                ),
                child: Text(text,style: TextStyle(
                  fontWeight: FontWeight.w600,
                  fontSize: width*0.05,
                  color: Colors.white
                ),),
              ),
    );
  }
}