import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class NewsContent extends StatelessWidget {
  const NewsContent({super.key,required this.width,required this.tite,required this.uploadedAt,required this.url,required this.urlimage,required this.description, required this.height});
final width;
final tite;
final description;
final urlimage;
final url;
final uploadedAt;
final height;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 5,left: 2,top: 8,right: 2),
      child: Container(
        padding:const EdgeInsets.all(6),
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
                          ClipRRect(
                            borderRadius: BorderRadius.circular(10),
                            child: Image.network(urlimage,width: width,height: height*0.3,fit: BoxFit.fill,)),

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
                           SizedBox(height: height*0.01 ,),
                          Text("Link to the full Article: \n$url",style: TextStyle(
                            fontWeight: FontWeight.w600,
                            fontSize: width*0.03,
                            color: Colors.blue
                            
                          ),),
                          SizedBox(height: height*0.01,),
                          Text("Posted At: $uploadedAt",style: TextStyle(
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