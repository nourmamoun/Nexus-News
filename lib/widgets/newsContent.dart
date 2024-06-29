import 'package:flutter/material.dart';

class NewsContent extends StatelessWidget {
  const NewsContent({super.key,required this.width,required this.tite,required this.uploadedAt,required this.url,required this.urlimage,required this.description});
final width;
final tite;
final description;
final urlimage;
final url;
final uploadedAt;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 5,left: 2,top: 8,right: 2),
      child: Container(
                      decoration:const BoxDecoration(
                        color: Colors.white,
                        boxShadow: [BoxShadow(
                          color: Colors.black,
                          offset: Offset(0, 3),
                          blurRadius: 4
      
                        )]
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Image.network(urlimage,width: width*0.9,),

                          Text(tite,style: TextStyle(
                            fontWeight: FontWeight.w600,
                            fontSize:width*0.06,
                            wordSpacing: 1
                            
                          ),),
                         const SizedBox(height: 5,),
                          Text(description,style: TextStyle(
                            fontWeight: FontWeight.w600,
                            fontSize: width*0.035,
                            wordSpacing: 1
                            
                          ),),
                          const SizedBox(height: 5,),
                          Text(url,style: TextStyle(
                            fontWeight: FontWeight.w600,
                            fontSize: width*0.03,
                            color: Colors.blue
                            
                          ),),
                          Text(uploadedAt,style: TextStyle(
                            fontWeight: FontWeight.w700,
                            fontSize: width*0.03,
                            color: Colors.grey
                            
                          ),),
                        ],
                      ),
                    ),
    );
  }
}