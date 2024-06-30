import 'package:flutter/material.dart';
import 'package:nexus_news2/helper/newsHelper.dart';
import 'package:nexus_news2/model/categoriesModel.dart';

import 'package:nexus_news2/pages/categoryPart.dart';

import 'package:nexus_news2/pages/livePage.dart';

import 'package:nexus_news2/widgets/categoriesScrollbar.dart';
import 'package:nexus_news2/widgets/newsContent.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
   int _selectedIndex = 0;

void _onCategoryTap(int index) {
    setState(() {
      _selectedIndex = index;
    });
    
  }

List<ArticleModel> articles = [];
bool _isLoading = true;

getNews() async{
  News newsData = News();
  await newsData.getNews();
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
        final size = MediaQuery.of(context).size;


    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.red,
          toolbarHeight: size.width * 0.2,
          title: Image.asset(
            'lib/assets/images/Nexus News Logo.png',
            width: size.width * 0.4,
          ),
          centerTitle: true,
        ),

        body: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Column(
            children: [
             SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  CategoriesContainer(
                    width: size.width * 0.35,
                    height: size.height * 0.2,
                    text: 'Top News',
                    size: size.width * 0.05,
                    isSelected: _selectedIndex == 0,
                    ontap: () {
                      _onCategoryTap(0);
                       Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) =>  CategorySegments(category: 'sports', categoryTitle: 'Sports')));
                    },
                    widthOfBorder: size.width * 0.02,
                  ),
                  CategoriesContainer(
                    width: size.width * 0.35,
                    height: size.height * 0.2,
                    text: 'Sports',
                    size: size.width * 0.05,
                    isSelected: _selectedIndex == 1,
                    ontap: () {
                      _onCategoryTap(1);
                       Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) =>  CategorySegments(category: 'sports', categoryTitle: 'Sports')));
                    _onCategoryTap(0);
                    },
                    widthOfBorder: size.width * 0.02,
                  ),
                  CategoriesContainer(
                    width: size.width * 0.35,
                    height: size.height * 0.2,
                    text: 'Bussiness',
                    size: size.width * 0.05,
                    isSelected: _selectedIndex == 2,
                    ontap: () {
                       _onCategoryTap(2);
                        Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) =>  CategorySegments(category: 'business',categoryTitle: 'Bussiness',)));
                    _onCategoryTap(0);
                    },
                    widthOfBorder: size.width * 0.02,
                  ),
                  CategoriesContainer(
                    width: size.width * 0.35,
                    height: size.height * 0.2,
                    text: 'Entertainment',
                    size: size.width * 0.05,
                    isSelected: _selectedIndex == 3,
                    ontap: () {
                      _onCategoryTap(3);
                       Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) =>  CategorySegments(category: 'entertainment', categoryTitle: 'Entertainment')));
                        _onCategoryTap(0);

                    },
                    widthOfBorder: size.width * 0.02,
                  ),
                  CategoriesContainer(
                    width: size.width * 0.35,
                    height: size.height * 0.2,
                    text: 'Health',
                    size: size.width * 0.05,
                    isSelected: _selectedIndex == 4,
                    ontap: () {
                      _onCategoryTap(4);
                       Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) =>  CategorySegments(category: 'health', categoryTitle: 'Health')));
                        _onCategoryTap(0);

                    },
                    widthOfBorder: size.width * 0.02,
                  ),
                  CategoriesContainer(
                    width: size.width * 0.35,
                    height: size.height * 0.2,
                    text: 'Live',
                    size: size.width * 0.05,
                    isSelected: _selectedIndex == 5,
                    ontap: () {
                      _onCategoryTap(5);
                      Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) =>  LivePage()));
                        _onCategoryTap(0);

                    },
                    widthOfBorder: size.width * 0.02,
                  ),
                      
                ],
          
              ),
             ),
            SizedBox(
                height: size.height * 2, 
                child: _isLoading ? const Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Padding(
                      padding:  EdgeInsets.all(10.0),
                      child: CircularProgressIndicator(
                        color: Colors.red,
                        
                      ),
                    ),
                  ],
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
             
            ],
          ),
        )

      ));
  }
}
