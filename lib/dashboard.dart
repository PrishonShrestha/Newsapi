import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
class Dashboard extends StatefulWidget {
  const Dashboard({Key? key}) : super(key: key);

  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  @override
  String url = "";
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
            //Horizontal listview
            Container(
              height: size.height/5,
              child: ListView.builder(
                primary: true,
                  physics: ClampingScrollPhysics(),
                  itemCount: 5,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (BuildContext context, int index)
                  => Card(
                    elevation: 1,
                    child: Container(
                      child: Stack(
                        children: [
                          CachedNetworkImage(
                            imageUrl: "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRqG_IrW41OWowRakdludbu-8KSLJLrXifvvyW3djZd&s",
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
                              children: const [
                                Text("Title",
                                  style: TextStyle(color: Colors.blue,
                                  fontSize: 16),),
                                Text("Date",
                                  style: TextStyle(color: Colors.blue,
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
                  itemCount: 5,
                  scrollDirection: Axis.vertical,
                  itemBuilder: (BuildContext context, int index)
                  => Card(
                    elevation: 1,
                    child: Container(
                      child: Row(
                        children: [
                          Stack(
                            children: [
                              CachedNetworkImage(
                                imageUrl: "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRqG_IrW41OWowRakdludbu-8KSLJLrXifvvyW3djZd&s",
                                fit: BoxFit.cover,
                                width: 130,
                                height: 100,
                                errorWidget: (context, url, error)=> const Icon(Icons.do_not_disturb_alt, color: Colors.red,),
                                placeholder: (context, url)=>const CircularProgressIndicator(),
                              ),
                              const Positioned(
                                left: 50,
                                top: 40,
                                child: Icon(Icons.play_circle,
                              color: Colors.white, size: 30,),)
                            ],
                          )
                        ],
                      ),
                    ),
                  )
              ),
            )
          ],
        ),
      ),
    );
  }
}
