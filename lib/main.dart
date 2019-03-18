import 'package:flutter/material.dart';
import 'package:flutterapp_vs/UpdateText.dart';
import 'package:flutterapp_vs/RandomWords.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Startup Name Generator',
      theme: new ThemeData(          // Add the 3 lines from here... 
        primaryColor: Colors.white,
      ),     
      home: MainDemoList(),
    );
  }
}

class MainDemoList extends StatelessWidget {
  final List<String> _list = ["UpdateText","RandomWords"];
  final List<Widget> _listWidget  = [UpdateText(),RandomWords()];
  final _biggerFont = const TextStyle(fontSize: 18.0);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: new AppBar(
        title: Text("DemoList"),

      ),
      body: _buildDemoList(),
    );
  }

  Widget _buildDemoList() {
    return ListView.builder(
        padding: const EdgeInsets.all(16.0),
        itemBuilder: (context, i) {
          return _buildRow(_list[i],context,i);
        },
        itemCount: _list.length,
      );
  }

  Widget _buildRow(String pair,BuildContext context,int i) {
    return new ListTile(
      title: new Text(
        pair,
        style: _biggerFont,
      ),
      onTap: (){
        push(context,i);
      },
                       
    );
  }
  
  void push(BuildContext context,int i){
    Navigator.of(context).push(
      MaterialPageRoute(builder: (context) => _listWidget[i]),
    );
  }
}
