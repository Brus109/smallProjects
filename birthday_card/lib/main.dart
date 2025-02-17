import 'package:flutter/material.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Material App',
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Birthday Card'),
        ),
        body: /*Container(
          child: Row(
            //mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Column(
                children: [
                  Icon(Icons.abc_rounded),
                  Text("1"),
                ],
              ),
              Column(
                children: [
                  Icon(Icons.air),
                  Text("2"),
                ],
              ),
              Column( //ctrl + . para abrir mas opciones, por ejemplo por ner el cursor el columna y hacerlo
                children: [
                  Icon(Icons.abc_rounded),
                  Text("3"),
                ],
              ),
              Column(
                children: [
                  Icon(Icons.abc_rounded),
                  Text("4"),
                ],
              ),
              Column(
                children: [
                  Icon(Icons.abc_rounded),
                  Text("5"),
                ],
              )
            ]
          ),
        )*/
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              "Happy birthday Frank!",
              style: TextStyle(fontSize: 36),  
            ),
            Image.network("https://i.pinimg.com/originals/62/e3/51/62e35118cf79f98da62cf05927943844.jpg"),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text("From Mike"),
                ),
              ],
            ),
          ],
        )
      ),
    );
  }
}