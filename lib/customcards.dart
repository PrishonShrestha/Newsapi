import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
class VerticalListCard extends StatelessWidget {
  const VerticalListCard({Key? key}) : super(key: key);

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
                        color: Colors.white, size: 30,),
                    ),
                  ],
                ),
              ],
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children:  [
                const Text("Recently,",
                  style: TextStyle(color: Colors.black, fontSize: 16, fontWeight: FontWeight.bold),
                ),
                Row(
                  children: [
                    //button
                    Container(
                      height:30,
                      width: 100,
                      decoration: BoxDecoration(
                        color: Colors.red,
                        borderRadius: BorderRadius.circular(15),
                      ),
                      child: const Center(
                        child: Text("xyz", style: TextStyle(color: Colors.black, fontSize: 16, fontWeight: FontWeight.bold,),
                        ),
                      ),
                    ),
                    const Text("Date",
                      style: TextStyle(color: Colors.black, fontSize: 16, fontWeight: FontWeight.bold),
                    ),
                    //Date
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

