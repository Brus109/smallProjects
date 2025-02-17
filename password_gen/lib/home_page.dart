import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class HomePage extends StatefulWidget {
  HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

String _generatePass(int charNumber){
  return String.fromCharCodes(
    List.generate(charNumber, (index) => Random().nextInt(48)+60),
  );
}

class _HomePageState extends State<HomePage> {
  String _pass1 = "_";
  String _pass2 = "_";
  String _pass3 = "_";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Generar contraseñas'),
        ),
        body: Column(
          children: [
            Expanded(
              child: ListView(
                children: [
                  Text("32 caracteres", style: TextStyle(fontSize: 17),),
                  Row(
                    children: [
                      Expanded(child: Text('$_pass1')),
                      IconButton(
                        onPressed: () {
                          _pass1=_generatePass(32);
                          setState(() {
                            
                          });
                        },
                        icon: Icon(Icons.refresh),
                      ),
                      IconButton(onPressed: () {
                        Clipboard.setData(new ClipboardData(text: _pass1));
                        ScaffoldMessenger.of(context)..hideCurrentSnackBar()..showSnackBar(SnackBar(content: Text("Copiado en el porta papeles")));
                      }, icon: Icon(Icons.copy))
                    ],
                  ),
                  Text("32 caracteres", style: TextStyle(fontSize: 17),),
                  Row(
                    children: [
                      Expanded(child: Text('$_pass2')),
                      IconButton(
                        onPressed: () {
                          _pass2=_generatePass(32);
                          setState(() {
                            
                          });
                        },
                        icon: Icon(Icons.refresh),
                      ),
                      IconButton(onPressed: () {
                        Clipboard.setData(new ClipboardData(text: _pass2));
                        ScaffoldMessenger.of(context)..hideCurrentSnackBar()..showSnackBar(SnackBar(content: Text("Copiado en el porta papeles")));
                      }, icon: Icon(Icons.copy))
                    ],
                  ),
                  Text("32 caracteres", style: TextStyle(fontSize: 17),),
                  Row(
                    children: [
                      Expanded(child: Text('$_pass3')),
                      IconButton(
                        onPressed: () {
                          _pass3=_generatePass(32);
                          setState(() {
                            
                          });
                        },
                        icon: Icon(Icons.refresh),
                      ),
                      IconButton(onPressed: () {
                        Clipboard.setData(new ClipboardData(text: _pass3));
                        ScaffoldMessenger.of(context)..hideCurrentSnackBar()..showSnackBar(SnackBar(content: Text("Copiado en el porta papeles")));
                      }, icon: Icon(Icons.copy))
                    ],
                  )
                ],
              ),
            ),
            MaterialButton(
                child: Text("Generar contraseña",
                    style: TextStyle(color: Colors.white)),
                color: Colors.blue,
                onPressed: () {
                  _pass1=_generatePass(32);
                  ScaffoldMessenger.of(context)..hideCurrentSnackBar()..showSnackBar(SnackBar(content: Text("Contraseña generada")));
                  setState(() {
                    
                  });
                }),
            MaterialButton(
                child: Text(
                  "Borrar contraseña",
                  style: TextStyle(color: Colors.black),
                ),
                color: Colors.grey,
                onPressed: () {
                  _pass1="_";
                  ScaffoldMessenger.of(context)..hideCurrentSnackBar()..showSnackBar(SnackBar(content: Text("Contraseña borrada")));
                  setState(() {
                    
                  });
                })
          ],
        ));
  }
}
