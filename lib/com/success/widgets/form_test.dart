import 'package:flutter/material.dart';
import 'package:wip/com/success/widgets/util.dart';

class MySimpleForm extends StatefulWidget {
  static const screenName = '/form-test';

  @override
  createState() => MyFormState();
}

class MyFormState extends State<MySimpleForm> {
  final myFormKey = GlobalKey<FormState>();

  final textEditingController = new TextEditingController();
  FocusNode focusNode;

  List<String> myList;

  @override
  void initState() {
    super.initState();
    textEditingController.addListener(() => printValues());
    myList = List.generate(10, (index) => 'Item ${index + 1}');
    focusNode = new FocusNode();
  }

  @override
  void dispose() {
    textEditingController.dispose();
    focusNode.dispose();
    super.dispose();
  }

  void printValues() {
    print('second text field value is ${textEditingController.text}');
  }

  void login() {
    print('clicked....');
    print(myFormKey.currentState);
    myFormKey.currentState.validate();
  }

  String validate(String value) {
    if (value.isEmpty) {
      return 'Password required';
    }
    return null;
  }

  Widget buildListView() {
    return ListView(children: [
      ListTile(title: new Text('Map'), leading: Icon(Icons.map)),
      ListTile(title: new Text('Print'), leading: Icon(Icons.print))
    ], shrinkWrap: true);
  }

  Widget buildListViewUsingBuilder(BuildContext context) {
    return ListView.builder(
        itemCount: myList.length,
        shrinkWrap: true,
        itemBuilder: (context, index) {
          var item = myList[index];
          return ListTile(title: new Text('Item $item'));
        });
    // return ListView(
    //     children: [
    //       ListTile(title: new Text('Map'), leading: Icon(Icons.map)),
    //       ListTile(title: new Text('Print'), leading: Icon(Icons.print))
    //     ],
    //     shrinkWrap: true
    // );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: new Text('Form Test')),
      body: buildForm(context),
    );
  }

  Widget buildForm(BuildContext context) {

    final ScreenArguments arguments = ModalRoute.of(context).settings.arguments;

    textEditingController.text = arguments.value;

    return new Form(
        key: myFormKey,
        child: new Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              new Padding(
                padding: new EdgeInsets.all(10.0),
                child: new TextFormField(
                  decoration: InputDecoration(hintText: 'Enter your email'),
                  initialValue: arguments.value,
                  validator: (value) {
                    if (value.isEmpty) {
                      focusNode.requestFocus();
                      return 'email required';
                    }
                    return null;
                  },
                  onChanged: (text) {
                    print('first text is $text');
                  },
                  autofocus: true,
                  focusNode: focusNode,
                ),
              ),
              new Padding(
                padding: new EdgeInsets.all(10.0),
                child: new TextFormField(
                  decoration: InputDecoration(hintText: 'Enter your password'),
                  obscureText: true,
                  validator: (value) {
                    return validate(value);
                  },
                  controller: textEditingController,
                ),
              ),
              Padding(
                padding: EdgeInsets.all(10.0),
                child:
                    ElevatedButton(onPressed: login, child: new Text('Login')),
              ),
              new Row(
                children: [
                  Padding(
                    padding: EdgeInsets.all(10.0),
                    child: ElevatedButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        child: new Text('Go Back')),
                  ),
                  Padding(
                      padding: EdgeInsets.all(10.0),
                      child: ElevatedButton(
                        child: new Text('Show popup'),
                        onPressed: () {
                          showDialog(
                              context: context,
                              builder: (context) {
                                return AlertDialog(
                                  title: Text('I am an alert dialog'),
                                  content: Text(
                                      ' Your password is ${textEditingController.text}'),
                                );
                              });
                          // return showDialog(context: context);
                        },
                      )),
                  Padding(
                    padding: EdgeInsets.all(10.0),
                    child: ElevatedButton(
                      child: new Text('Show snack bar'),
                      onPressed: () {
                        ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(content: new Text('Hello, How are you')));
                      },
                    ),
                  )
                ],
              ),
              buildListView(),
            ]));
  }
}
