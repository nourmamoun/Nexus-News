import 'package:flutter/material.dart';
import 'package:nexus_news2/helper/newsHelper.dart';
import 'package:nexus_news2/model/categoriesModel.dart';
import 'package:nexus_news2/pages/bussinessPage.dart';
import 'package:nexus_news2/pages/entertainmentPage.dart';
import 'package:nexus_news2/pages/livePage.dart';
import 'package:nexus_news2/pages/sportsPage.dart';
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

getNews() async{
  News newsData = News();
  await newsData.getNews();
  articles=newsData.datatobeSavedIn;
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
                    height: size.height * 0.1,
                    text: 'Sports',
                    size: size.width * 0.05,
                    isSelected: _selectedIndex == 0,
                    ontap: () {
                      _onCategoryTap(0);
                       Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) =>  SportsPage()));
                    },
                    widthOfBorder: size.width * 0.02,
                  ),
                  CategoriesContainer(
                    width: size.width * 0.35,
                    height: size.height * 0.1,
                    text: 'Bussiness',
                    size: size.width * 0.05,
                    isSelected: _selectedIndex == 1,
                    ontap: () {
                       _onCategoryTap(1);
                        Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) =>  BussinessPage()));
                    },
                    widthOfBorder: size.width * 0.02,
                  ),
                  CategoriesContainer(
                    width: size.width * 0.35,
                    height: size.height * 0.1,
                    text: 'Entertainment',
                    size: size.width * 0.05,
                    isSelected: _selectedIndex == 2,
                    ontap: () {
                      _onCategoryTap(2);
                       Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) =>  EntertainmentPage()));
                    },
                    widthOfBorder: size.width * 0.02,
                  ),
                  CategoriesContainer(
                    width: size.width * 0.35,
                    height: size.height * 0.1,
                    text: 'Live',
                    size: size.width * 0.05,
                    isSelected: _selectedIndex == 3,
                    ontap: () {
                      _onCategoryTap(3);
                      Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) =>  LivePage()));
                    },
                    widthOfBorder: size.width * 0.02,
                  ),
                      
                ],
          
              ),
             ),
            Container(
                height: size.height * 2, // Set a fixed height for the list
                child: articles.isEmpty
                    ? Center(child: CircularProgressIndicator(
                      color: Colors.red,
                    ))
                    : ListView.builder(
                        itemCount: articles.length,
                        itemBuilder: (context, index) {
                          return NewsContent(
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
