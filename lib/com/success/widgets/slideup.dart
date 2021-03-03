import 'package:flutter/material.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';

class Slideup extends StatefulWidget {
  @override
  createState() => SlideupState();
}

class SlideupState extends State<Slideup> {
  Widget build(context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.add), label: ''),
          BottomNavigationBarItem(icon: Icon(Icons.search), label: ''),
          BottomNavigationBarItem(icon: Icon(Icons.refresh), label: '')
        ],
      ),
      appBar: AppBar(
        title: Text('Title'),
      ),
      bottomSheet: DraggableScrollableSheet(
        initialChildSize: 0.05,
        minChildSize: 0.05,
        maxChildSize: 0.5,
        expand: false,
        builder: (BuildContext context, myscrollController) {
          return Container(
            color: Colors.tealAccent[200],
            child: ListView.builder(
              controller: myscrollController,
              itemCount: 25,
              itemBuilder: (BuildContext context, int index) {
                return ListTile(
                    title: Text(
                  'Dish11 $index',
                  style: TextStyle(color: Colors.black54),
                ));
              },
            ),
          );
        },
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            ExpansionTile(
              initiallyExpanded: true,
              title: Text('Options'),
              children: [options()],
            ),
            ExpansionTile(
              initiallyExpanded: true,
              title: Text('Stocks'),
              children: [stocks()],
            )
          ],
        ),
      ),
    );
  }

  // @override
  Widget build4(BuildContext context) {
    return MaterialApp(
      darkTheme: ThemeData.dark(),
      theme: ThemeData(brightness: Brightness.dark),
      home: Scaffold(
        bottomNavigationBar: BottomNavigationBar(
          items: [
            BottomNavigationBarItem(icon: Icon(Icons.add), label: ''),
            BottomNavigationBarItem(icon: Icon(Icons.search), label: ''),
            BottomNavigationBarItem(icon: Icon(Icons.refresh), label: '')
          ],
        ),
        appBar: AppBar(
          title: const Text('DraggableScrollableSheet'),
        ),
        body: SlidingUpPanel(
          body: Column(
            children: [
              ExpansionTile(
                initiallyExpanded: true,
                title: Text('Options'),
                children: [options()],
              )
            ],
          ),
          panel: Center(
            child: Text("This is the sliding Widget"),
          ),
        ),
      ),
    );
  }

  Widget build2(BuildContext context) {
    return MaterialApp(
      darkTheme: ThemeData.dark(),
      theme: ThemeData(brightness: Brightness.dark),
      home: Scaffold(
        bottomNavigationBar: BottomNavigationBar(
          items: [
            BottomNavigationBarItem(icon: Icon(Icons.add), label: ''),
            BottomNavigationBarItem(icon: Icon(Icons.search), label: ''),
            BottomNavigationBarItem(icon: Icon(Icons.refresh), label: '')
          ],
        ),
        appBar: AppBar(
          title: const Text('DraggableScrollableSheet'),
        ),
        body: SlidingUpPanel(
          body: ListView.builder(
            itemBuilder: (_, index) {
              return Container(
                  padding: EdgeInsets.all(10.0),
                  child: ListTile(
                    title: Text('Testin ging $index'),
                  ));
            },
            itemCount: 50,
          ),
          panel: Center(
            child: Text("This is the sliding Widget"),
          ),
        ),
        // body: Container(
        //   child: DraggableScrollableSheet(
        //     initialChildSize: 0.3,
        //     minChildSize: 0.1,
        //     maxChildSize: 0.5,
        //     builder: (BuildContext context, myscrollController) {
        //       return Container(
        //         color: Colors.tealAccent[200],
        //         child: ListView.builder(
        //           controller: myscrollController,
        //           itemCount: 25,
        //           itemBuilder: (BuildContext context, int index) {
        //             return ListTile(
        //                 title: Text(
        //               'Dish $index',
        //               style: TextStyle(color: Colors.black54),
        //             ));
        //           },
        //         ),
        //       );
        //     },
        //   ),
        // ),
      ),
    );
  }

  Widget stocks() {
    return ListView.builder(
        shrinkWrap: true,
        physics: NeverScrollableScrollPhysics(),
        itemCount: 20,
        itemBuilder: (_, index) {
          return Container(
            padding: EdgeInsets.all(10),
            child: ListTile(
              title: Text('Stock $index'),
            ),
          );
        });
  }

  Widget options() {
    return ListView.builder(
        physics: NeverScrollableScrollPhysics(),
        scrollDirection: Axis.vertical,
        shrinkWrap: true,
        itemCount: 20,
        itemBuilder: (_, index) {
          return Container(
            color: Colors.green,
            padding: EdgeInsets.all(10),
            child: Text('Option $index'),
          );
        });
  }

  Widget build1(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Hello'),
      ),
      // body: Center(
      //   child: Text('Hello world...'),
      // ),
      body: Container(
        child: DraggableScrollableSheet(
          initialChildSize: 0.8,
          minChildSize: 0.3,
          maxChildSize: 1,
          builder: (_, __) {
            return Container(
              color: Colors.black38,
              child: ListView.builder(
                  itemCount: 25,
                  itemBuilder: (_, index) {
                    return ListTile(
                      title: Text('Helllo $index'),
                    );
                  }),
            );
          },
        ),
      ),
    );
  }

  Widget build5(context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Test'),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            ExpansionTile(
              title: Text('Options'),
              children: [options()],
            ),
            Container(
              child: DraggableScrollableSheet(
                initialChildSize: 0.3,
                minChildSize: 0.1,
                maxChildSize: 0.5,
                builder: (BuildContext context, myscrollController) {
                  return Container(
                    color: Colors.tealAccent[200],
                    child: ListView.builder(
                      controller: myscrollController,
                      itemCount: 25,
                      itemBuilder: (BuildContext context, int index) {
                        return ListTile(
                            title: Text(
                          'Dish $index',
                          style: TextStyle(color: Colors.black54),
                        ));
                      },
                    ),
                  );
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}
