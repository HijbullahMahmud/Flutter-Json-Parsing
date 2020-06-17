import 'package:flutter/material.dart';
import 'package:flutter/services.dart' show rootBundle;
import 'dart:async';
import 'dart:convert';

void main() {
   runApp(MaterialApp(
     title: "Json Parsing",
     home: HomePage()
   ));
}

class HomePage extends StatefulWidget {
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List data;
  Future<String> loadJsonData() async{
    var jsonText = await rootBundle.loadString('assets/data.json');
    setState(() {
      data = json.decode(jsonText);
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    this.loadJsonData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Json parsing demo"),
      ),
      body: ListView.builder(
        itemCount: data.length,
        itemBuilder: (BuildContext context, int index){
          return Column(
            children: <Widget>[
              ListTile(
                leading: CircleAvatar(
                  child: Text(data[index]['name'][0]),),
                title: Text(data[index]["name"]),
                subtitle: Text(data[index]['email']),
              )
            ],
          );
        }
      )
    );
  }

}






