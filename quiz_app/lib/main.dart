import 'package:flutter/material.dart';
import './question.dart';
import './answer.dart';
// import 'package:flutter/services.dart'; //to import pakage

void main() {
  runApp(MyApp()); //inbuilt function to run app
}

// void main()=>runApp(MyApp());            // arrow function , same as above function only valid in one line

class MyApp extends StatefulWidget {
  //this can be recreated

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    // throw UnimplementedError();
    return MyAppState();
  }
}

class MyAppState extends State<MyApp> {
  //this is persistant
  var count = 0;

  void _press() {
    //_ means function is used in other files
    setState(() {
      count = count + 1;
    }); //setState: to rerun the build method set state function is used
    print(count);
  }

  @override //not required means that that we are overriding build method (considered a good practice)
  Widget build(BuildContext context) //class presentin material dart pakage
  {
    var question = //List of map of string:string and string:List
        [
      {
        'questionText': 'Where do you live?',
        'answer': ['Ghaziabad', 'Delhi', 'Noida']
      },
      {
        'questionText': 'What\'s your annual income?',
        'answer': ['7 lac', '8 lac', '10 lac']
      },
      {
        'questionText': "what\'s your relationship status",
        'answer': ['Single', 'Married', 'Engaged']
      }
    ];

    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text("Shrijit App"),
        ),
        body: Column(children: <Widget>[
          Question(
            question[count]['questionText'],
          ), //runs build method in question file

          ...(question[count]['answer'] as List<String>)
          .map((answer) {
            return Answer(_press, answer);
          }).toList()
        ],
        ), // to create list of widgets
      ),
    ); //present in material app,takes named aurgements
    //scaffold gives all the funtionality of basic apps
    //material app is a class which has a parametrized constructor to it
  }
}

//convention : only widget per file