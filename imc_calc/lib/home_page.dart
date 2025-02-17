import 'dart:ffi';

import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool? gender;
  var alturaController = TextEditingController();
  var pesoController = TextEditingController();
  final String _mj = ''' 
Tabla del IMC para mujeres
Edad      IMC ideal 
16-17     19-24 
18-18     19-24   
19-24     19-24 
25-34     20-25 
35-44     21-26 
45-54     22-27 
55-64     23-28 
65-90     25-30
  ''';
  final String _hb = ''' 
Tabla del IMC para hombres
Edad      IMC ideal 
16-16     19-24   
17-17     20-25   
18-18     20-25   
19-24     21-26 
25-34     22-27 
35-54     23-38 
55-64     24-29 
65-90     25-30
  ''';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Calcular IMC'),
          actions: [
            IconButton(
              onPressed: () {
                _resetAll();
                setState(() {});
              },
              icon: Icon(Icons.delete),
              tooltip: "Borrar todo",
            )
          ],
        ),
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              Text("Ingrese sus datos para calcular el IMC"),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  IconButton(onPressed: () {
                    gender = false;
                    setState(() {
                      
                    });
                  }, icon: Icon(Icons.male), color: gender==false ? Colors.indigo:Colors.black,),
                  IconButton(onPressed: () {
                    gender = true;
                    setState(() {
                      
                    });
                  }, icon: Icon(Icons.female), color: gender==true ? Colors.indigo:Colors.black,)
                ],
              ),
              TextField(
                controller: alturaController,
                decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    label: Text("Ingrese altura (metros)"),
                    prefixIcon: Icon(Icons.medical_services_rounded)),
              ),
              SizedBox(
                height: 24,
              ),
              TextField(
                controller: pesoController,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  label: Text("Ingrese peso (KG)"),
                  prefixIcon: Icon(Icons.monitor_weight_rounded),
                ),
              ),
              MaterialButton(
                onPressed: () {
                  _showResult();
                },
                child: Text("Calcular"),
              )
            ],
          ),
        ));
  }

  void _resetAll() {
    gender = null;
    alturaController.clear();
    pesoController.clear();
  }

  double _imc() {
    double peso = double.parse(pesoController.text);
    double altura = double.parse(alturaController.text);
    return peso / (altura * altura);
  }

  void _showResult() {
    showDialog(context: context, builder: (context){
      return AlertDialog(
        title: Text('Tu IMC: ${_imc()}'),
        content: Text("${gender?? true ?_mj:_hb}"),
      );
    });
  }
}
