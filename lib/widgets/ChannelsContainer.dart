import 'package:flutter/material.dart';

class ChannelsContainer extends StatelessWidget {
  const ChannelsContainer({super.key,required this.size,required this.text,required this.ontap});
final size;
final text;
final ontap;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: ontap,
      child: Container(
                padding: EdgeInsets.all(10),
                margin: EdgeInsets.only(top: 10,bottom: 10),
                width: size.width,
                height: size.height*0.07,
      
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Colors.red,
                  boxShadow: [BoxShadow(
                    color: Colors.black,
                    offset: Offset(0, 3),
                    blurRadius: 4
                  )],
                  
                ),
                child: Text(text,style: TextStyle(
                  fontWeight: FontWeight.w600,
                  fontSize: size.width*0.05,
                  color: Colors.white
                ),),
              ),
    );
  }
}