import 'package:flutter/material.dart';

class NetworkImageTest extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => NetworkImageState();
}

class NetworkImageState extends State<NetworkImageTest> {
  // NetworkImage networkImage;

  ImageProvider loadNetworkImage(imageUrl) {
    // String imageUrl =
    //     'https://devstatic.reciperm.com/webp/Nonecategory.webp';
    print(imageUrl);
    String prefix = imageUrl.substring(0, imageUrl.lastIndexOf('/') + 1);

    var ni = NetworkImage(imageUrl);
    ni
        .resolve(ImageConfiguration.empty)
        .addListener(new ImageStreamListener((image, status) {
          print('loaded successfully ' + imageUrl);
          print(status);
        }, onError: (obj, st) {
          print('error occurred ' + imageUrl);
          // setState(() {
          //   ni = NetworkImage(prefix + 'Nonerecipe.webp');
          // });
        }));
    return ni;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Test'),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              constraints: BoxConstraints(minHeight: 500, minWidth: 500),
              child: Text('image1'),
              decoration: BoxDecoration(
                  image: DecorationImage(
                      image: loadNetworkImage(
                          'https://devstatic.reciperm.com/webp/Nonecategory.webp'),
                      onError: (_, __) {
                        WidgetsBinding.instance.addPostFrameCallback((_) {
                          setState(() {});
                        });
                      })),
            ),
            Container(
              constraints: BoxConstraints(minHeight: 500, minWidth: 500),
              child: Text('image2'),
              decoration: BoxDecoration(
                  image: DecorationImage(
                      image: loadNetworkImage(
                          'https://devstatic.reciperm.com/webp/volcan-de-chocolate.webp'))),
            )
          ],
        ),
      ),
    );
  }
}
