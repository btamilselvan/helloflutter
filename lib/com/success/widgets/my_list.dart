import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:wip/com/success/widgets/navigate_one.dart';
import 'package:wip/com/success/widgets/util.dart';

class MyList extends StatelessWidget {
  final List<String> items =
      List.generate(100, (index) => 'Dynamic Item ${index + 1}');

  List<Widget> getSilvers(BuildContext context) {
    return <Widget>[
      SliverAppBar(
          title: new Text('Hello scrollable List view'),
          floating: true,
          flexibleSpace: Placeholder()),
      SliverList(
          delegate: SliverChildBuilderDelegate((context, index) {
        return ListTile(
          title: Text('${items[index]}'),
          onTap: () {
            Navigator.push(context, MaterialPageRoute(builder: (context) {
              return ScreenThree(Data('${items[index]}'));
            }));
          },
        );
      }, childCount: items.length))
    ];
  }

  List<Widget> getSilversFromColumn(BuildContext context) {
    return <Widget>[
      SliverAppBar(
          title: new Text('Hello scrollable List view'),
          floating: true,
          flexibleSpace: Placeholder()),
      SliverList(
        delegate: SliverChildBuilderDelegate((context, index) {
          return Column(
            children: [
              ListView.builder(
                itemBuilder: (context, i) {
                  var item = items[index];
                  return ListTile(title: new Text('Item $item'));
                },
                itemCount: items.length,
              )
            ],
          );
        }),
      )
    ];
  }

  Widget buildScrollableListInsideColumn(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.vertical,
      child: Column(
        children: [
          ListView.builder(
            shrinkWrap: true,
            itemBuilder: (context, index) {
              var item = items[index];
              return ListTile(title: new Text('Item $item'));
            },
            itemCount: items.length,
          )
        ],
      ),
    );
  }

  Widget buildUsingColumnExpanded(BuildContext context) {
    return Column(
      children: [
        Expanded(
            child: ListView.builder(
          itemBuilder: (context, index) {
            var item = items[index];
            return ListTile(title: new Text('Item $item'));
          },
          itemCount: items.length,
        ))
      ],
    );
  }

  Widget buildCustomScrollView(BuildContext context) {
    return CustomScrollView(
      slivers: getSilvers(context),
    );
  }

  Widget buildCustomScrollViewUsingColumn(BuildContext context) {
    return CustomScrollView(
      slivers: getSilversFromColumn(context),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   title: Text('Welcome to list view'),
      // ),
      body: buildCustomScrollView(context),
      // body: buildCustomScrollViewUsingColumn(context),
      // body: buildScrollableListInsideColumn(context),
      // body: buildUsingColumnExpanded(context),
    );
  }
}

class FlexibleList extends StatelessWidget {
  final List<String> items =
      List.generate(100, (index) => 'Dynamic Item ${index + 1}');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('List View Test'),
      ),
      body: Container(
        child: Column(
          children: [
            Text('Row 1'),
            Row(
              children: [Text('Row 2, Item 1'), Text('Row 2, Item 2')],
            ),
            Flexible(child: ListView.builder(itemBuilder: (context, index) {
              return ListTile(
                title: Text('From List Item ${items[index]}'),
              );
            })),
            Row(
              children: [Text('Row 4, Item 1'), Text('Row 4, Item 2')],
            )
          ],
        ),
      ),
    );
  }
}
