import 'dart:convert';

import 'package:http/http.dart';
import 'package:nexus_news2/model/categoriesModel.dart';

class News{

List<ArticleModel> datatobeSavedIn =[];

Future<void> getNews() async {
  var response = await get(Uri.parse('http://newsapi.org/v2/top-headlines?country=us&apiKey=64ebecb1e44b48489fb4b4d356062aac'));
  var jsonData = jsonDecode(response.body);


  if (jsonData['status'] == 'ok') {
      jsonData['articles'].forEach((element) {
        if(element['urlToImage']!= null && element['description']!= null){
          ArticleModel articleModel = ArticleModel(
            title: element['title'],
            urlToImage: element['urlToImage'],
            description: element['description'],
            url: element['url'],
            publishedAt: element['publishedAt']
          );

          datatobeSavedIn.add(articleModel);
        }
      });

}
}}


class CategoryNews{

List<ArticleModel> datatobeSavedIn =[];

Future<void> getNews(String category) async {
  var response = await get(Uri.parse('https://newsapi.org/v2/top-headlines?country=us&category=$category&apiKey=64ebecb1e44b48489fb4b4d356062aac'));
  var jsonData = jsonDecode(response.body);


  if (jsonData['status'] == 'ok') {
      jsonData['articles'].forEach((element) {
        if(element['urlToImage']!= null && element['description']!= null){
          ArticleModel articleModel = ArticleModel(
            title: element['title'],
            urlToImage: element['urlToImage'],
            description: element['description'],
            url: element['url'],
            publishedAt: element['publishedAt']
          );

          datatobeSavedIn.add(articleModel);
        }
      });

  

}



}}