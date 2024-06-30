import 'package:flutter/material.dart';
import 'package:nexus_news2/helper/newsHelper.dart';
import 'package:nexus_news2/model/categoriesModel.dart';
import 'package:nexus_news2/widgets/newsContent.dart';

class ChannelPage extends StatefulWidget {
   ChannelPage({super.key,required this.channel,required this.textTitle});
String channel;
String textTitle; 
  @override
  State<ChannelPage> createState() => _ChannelPageState();
}

class _ChannelPageState extends State<ChannelPage> {
    List<ArticleModel> articles = [];
   bool _isLoading = true;


getNews() async{
  
  ChannelsNews newsData = ChannelsNews();
  await newsData.getNews(widget.channel);
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
          title: Text(widget.textTitle,style: TextStyle(
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

        body:SingleChildScrollView(
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