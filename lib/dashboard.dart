import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:newsapi/api/get.dart';
import 'package:newsapi/customcards.dart';

import 'model/newsapi.dart';
class Dashboard extends StatefulWidget {
  const Dashboard({Key? key}) : super(key: key);

  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  //String url = "";
  late Future<newsapi?> futurenews;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    futurenews = GetApi.getnewsdata(context) as Future<newsapi>;
  }
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: const Color(0xFF004794),
        centerTitle: true,
        title: const Text("Dashboard",
        style: TextStyle(color: Colors.white, fontWeight:FontWeight.bold, fontSize: 20),
        ),
        elevation: 1,
        actions: const [
          Padding(
            padding: EdgeInsets.all(15.0),
            child: Icon(Icons.manage_search_rounded, color: Colors.grey,size: 30,),
          )
        ],

      ),
      body: Container(
        width: size.width,
        child: Column(
          children: [
            FutureBuilder(future: futurenews,
                builder: (BuildContext context, AsyncSnapshot snapshot){
                  switch(snapshot.connectionState){
                    case ConnectionState.none:
                      return Container(
                        child: Text("Try loading again"),
                      );
                    case ConnectionState.active:
                    case ConnectionState.waiting:
                      return Container(
                        child: const CircularProgressIndicator(),
                      );
                    case ConnectionState.done:
                      if(!snapshot.hasData){
                        //no data
                        return Container(
                          child: const Text("No news data available"),
                        );
                      }else{
                        return Column(
                          children: [
                            //Horizontal listview
                            Container(
                              height: size.height/5,
                              child: ListView.builder(
                                  primary: true,
                                  physics: ClampingScrollPhysics(),
                                  itemCount: snapshot.data.articles.length,
                                  scrollDirection: Axis.horizontal,
                                  itemBuilder: (BuildContext context, int index)
                                  => Card(
                                    elevation: 1,
                                    child: Container(
                                      child: Stack(
                                        children: [
                                          CachedNetworkImage(
                                            imageUrl: snapshot.data.articles[index].urlToImage,
                                            fit: BoxFit.cover,
                                            width: size.width/1.6,
                                            height: size.height/5,
                                            errorWidget: (context, url, error)=> const Icon(Icons.do_not_disturb_alt, color: Colors.red,),
                                            placeholder: (context, url)=>const CircularProgressIndicator(),
                                          ),
                                          Positioned(
                                            bottom: 10,
                                            left: 10,
                                            child: Column(
                                              children: [
                                                Text(snapshot.data.articles[index].title,
                                                  style: const TextStyle(color: Colors.blue,
                                                      fontSize: 16),),
                                                Text(snapshot.data.articles[index].publishedAt,
                                                  style: const TextStyle(color: Colors.blue,
                                                      fontSize: 16),),
                                              ],
                                            ),
                                          ),

                                          const Positioned(
                                              bottom: 10,
                                              right: 10,
                                              child: Icon(Icons.play_circle, color: Colors.blue,size: 30,)),

                                        ],
                                      ),
                                    ),
                                  )
                              ),
                            ),
                            //vertical List view
                            Container(
                              height: size.height/1.5,
                              width: size.width,
                              child: ListView.builder(
                                primary: true,
                                physics: ClampingScrollPhysics(),
                                itemCount: snapshot.data.articles.length,
                                scrollDirection: Axis.vertical,
                                itemBuilder: (BuildContext context, int index)
                                => VerticalListCard(snapshot.data.articles[index]),
                              ),
                            ),
                          ],
                        );
                        //has data
                      }
                  }
                }),

          ],
        ),
      ),
    );
  }
}
