import 'package:flutter/material.dart';

class MyWidget extends StatefulWidget {
  const MyWidget({super.key});

  @override
  State<MyWidget> createState() => _MyWidgetState();
}

class _MyWidgetState extends State<MyWidget> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Praktikum 4'),
        backgroundColor: Colors.blueAccent[700],
      ),
      body: GridView.count(
        crossAxisCount: 2,
        mainAxisSpacing: 10,
        crossAxisSpacing: 10,
        padding: EdgeInsets.all(12),
        children: [
          Container(
            padding: EdgeInsets.all(10),
            child: Column(
              children: [
                Icon(Icons.add),
                Text('gridView 1'),
              ],
            ),
            color: Colors.amberAccent,
          ),
          Container(
            padding: EdgeInsets.all(10),
            child: Text('gridView 2'),
            color: Colors.greenAccent,
          ),
          Container(
            padding: EdgeInsets.all(10),
            child: Text('gridView 3'),
            color: Colors.redAccent,
          ),
          Container(
            padding: EdgeInsets.all(10),
            child: Text('gridView 4'),
            color: Colors.blueAccent,
          ),
          Container(
            padding: EdgeInsets.all(10),
            child: Text('gridView 5'),
            color: Colors.yellowAccent,
          ),
          Container(
            padding: EdgeInsets.all(10),
            child: Text('gridView 6'),
            color: Colors.purpleAccent,
          ),
        ],
     ),
);
}
}
