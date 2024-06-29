import 'package:flutter/material.dart';

class CategoriesContainer extends StatelessWidget {
  const CategoriesContainer({super.key,required this.width,this.height,required this.text, required this.ontap,required this.size,required this.isSelected,required this.widthOfBorder});
final width;
final height;
final text;
final ontap;
final size;
final bool isSelected;
final widthOfBorder;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: ontap,
      child: Container(
                      width: width,
                      height: height,
                      decoration:  BoxDecoration(
                        color: Colors.black,
                        shape: BoxShape.rectangle,
                        border: Border(left: const BorderSide(color: Colors.grey,width: 0.4), bottom: BorderSide(color: isSelected? Colors.red : Colors.transparent, width: widthOfBorder ))
                        
                        
                    
                      ),
                      child: Center(
                        child: Text(text,style:  TextStyle(
                          color: Colors.white,
                          fontSize: size,
                        ),),
                      ),
                    ),
    );
  }
}