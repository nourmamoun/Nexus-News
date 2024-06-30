//import 'dart:js';

import 'package:flutter/material.dart';
import 'package:nexus_news2/helper/newsHelper.dart';
import 'package:nexus_news2/model/categoriesModel.dart';
import 'package:nexus_news2/widgets/newsContent.dart';

class CategorySegments extends StatefulWidget {
   CategorySegments({super.key,required this.category, required this.categoryTitle});
  String category;
  String categoryTitle;
  @override
  State<CategorySegments> createState() => _CategorySegmentsState();
}

class _CategorySegmentsState extends State<CategorySegments> {
  List<ArticleModel> articles = [];
   bool _isLoading = true;


getNews() async{
  
  CategoryNews newsData = CategoryNews();
  await newsData.getNews(widget.category);
 setState(() {
      articles = newsData.datatobeSavedIn;
      _isLoading = false; 
    });

}

@override
void initState(){
  super.initState();
  getNews();
}
  @override
  Widget build(BuildContext context) {
     var size = MediaQuery.of(context).size;

    return Scaffold(
          appBar: AppBar(
          backgroundColor: Colors.red,
          toolbarHeight: size.width * 0.2,
          title: Text(widget.categoryTitle,style: TextStyle(
            fontSize: size.width*0.06,
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
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: SizedBox(
                  height: size.height * 2, 
                  child: _isLoading ? const Center(
                    child:  Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Padding(
                          padding:  EdgeInsets.all(10.0),
                          child: CircularProgressIndicator(
                            color: Colors.red,
                            
                          ),
                        ),
                      ],
                    ),
                  )
                      
                      : ListView.builder(
                        
                          itemCount: articles.length,
                          itemBuilder: (context, index) {
                            return NewsContent(
                              height: size.height,
                              width: size.width,
                              tite: articles[index].title,
                              uploadedAt: articles[index].publishedAt,
                              url: articles[index].url,
                              urlimage: articles[index].urlToImage,
                              description: articles[index].description,
                            );
                          },
                        ),
                ),
              
      ),
    );
  }
}