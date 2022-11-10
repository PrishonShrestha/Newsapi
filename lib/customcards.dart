import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import 'model/newsapi.dart';
class VerticalListCard extends StatelessWidget {
  Articles articles;
  VerticalListCard(this.articles, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 1,
      child: Container(
        height: 100,
        child: Row(
          children: [
            Column(
              children: [
                Stack(
                  children: [
                    CachedNetworkImage(
                      imageUrl: articles.urlToImage!,
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
                        color: Colors.white, size: 30,),
                    ),
                  ],
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(10),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children:  [
                  Text(articles.title!,
                    style: const TextStyle(color: Colors.black, fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                  Row(
                    //mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      //button
                      Container(
                        height:30,
                        width: 100,
                        decoration: BoxDecoration(
                          color: Colors.red,
                          borderRadius: BorderRadius.circular(15),
                        ),
                        child: Center(
                          child: Text(articles.url!, style: const TextStyle(color: Colors.black, fontSize: 16, fontWeight: FontWeight.bold,),
                          ),
                        ),
                      ),
                      Text(articles.publishedAt!,
                        style: const TextStyle(color: Colors.black, fontSize: 16, fontWeight: FontWeight.bold),
                      ),
                      //Date
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

