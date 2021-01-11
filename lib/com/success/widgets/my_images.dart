import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:carousel_slider/carousel_options.dart';

class MyImage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text('Images Testing'),
      ),
      body: Center(
        child: Image(
          image: AssetImage('images/paella_express.jpg'),
        ),
      ),
    );
  }
}

class MyCarouselImage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Carousel of images')),
      body: Center(
        child: CarouselSlider(
          options: CarouselOptions(autoPlay: true),
          items: List.generate(10, (index) => 'images/paella_express.jpg')
              .map((e) => Image(image: AssetImage(e)))
              .toList(),
        ),
      ),
    );
  }
}
