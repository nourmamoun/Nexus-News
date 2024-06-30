import 'package:flutter/material.dart';
import 'package:nexus_news2/pages/channelPage.dart';
import 'package:nexus_news2/widgets/ChannelsContainer.dart';

class LivePage extends StatelessWidget {
  const LivePage({super.key});

  @override
  Widget build(BuildContext context) {
     var size = MediaQuery.of(context).size;

    return Scaffold(
       appBar: AppBar(
          backgroundColor: Colors.red,
          toolbarHeight: size.width * 0.2,
          title: Text('Channels',style: TextStyle(
            fontSize: size.width*0.07,
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
          child: Column(
            children: [
              ChannelsContainer(
                width: size.width, 
                height: size.height,
                text: 'BBC News',
                ontap: (){
                   Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) =>  ChannelPage(channel: 'bbc-news', textTitle: 'BBC News')));

                },),
              ChannelsContainer(
                width: size.width, 
                height: size.height,
                text: 'ABC News',
                ontap: (){
                  Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) =>  ChannelPage(channel: 'Abc-news', textTitle: 'ABC News')));

                }),
              ChannelsContainer(
               width: size.width, 
                height: size.height, 
              text: 'CBS News'
              ,ontap: (){
                    Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) =>  ChannelPage(channel: 'cbs-news', textTitle: 'CBS News')));


              }),
                 ChannelsContainer(
                width: size.width, 
                height: size.height,
                 text: 'NBC News',
                 ontap: (){
                  Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) =>  ChannelPage(channel: 'NBC-news', textTitle: 'NBC News')));
                 }),
                  ChannelsContainer(
                width: size.width, 
                height: size.height,
                 text: 'USA Today',
                 ontap: (){
                  Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) =>  ChannelPage(channel: 'usa-today', textTitle: 'USA Today')));
                 }),
                 ChannelsContainer(
                width: size.width, 
                height: size.height,
                 text: 'Ars Technica',
                 ontap: (){
                  Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) =>  ChannelPage(channel: 'ars-technica', textTitle: 'Ars Technica')));
                 }),
            ],
          ),
        ),
    );
  }
}
//ars-technica"