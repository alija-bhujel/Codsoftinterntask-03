import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

class Sliderr extends StatelessWidget {
  const Sliderr({super.key});

  @override
  Widget build(BuildContext context) {
    List<Widget> selecteditems = [
      Container(
        decoration: BoxDecoration(
          image: DecorationImage(
              image: AssetImage(
                'images/music.jpg',
              ),
              fit: BoxFit.cover),
          borderRadius: BorderRadius.circular(20),
          color: Colors.grey,
        ),
        child: Row(
          children: [
            Expanded(
                child: Column(
              children: [],
            ))
          ],
        ),
      )
    ];
    return CarouselSlider(
        items: selecteditems,
        options: CarouselOptions(
          height: 240,
          aspectRatio: 16 / 9,
          viewportFraction: 1,
          initialPage: 0,
          enableInfiniteScroll: true,
          reverse: false,
          autoPlay: true,
          autoPlayInterval: Duration(seconds: 3),
          autoPlayAnimationDuration: Duration(milliseconds: 800),
          autoPlayCurve: Curves.fastOutSlowIn,
          enlargeCenterPage: true,
          enlargeFactor: 0.3,
          onPageChanged: (index, value) {},
          scrollDirection: Axis.horizontal,
        ));
  }
}
