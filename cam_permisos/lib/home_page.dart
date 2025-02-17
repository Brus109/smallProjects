import 'dart:io';

import 'package:cam_permisos/bloc/picture_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Material App Bar'),
        ),
        body: BlocBuilder<PictureBloc, PictureState>(
          builder: (context, state) {
            if(state is CambiarImagenState){
              return _defaultBody(state.newPicture, context);
            }else if(state is ProcesandoState){
              return Center(child: CircularProgressIndicator(),);
            }else{
              return _noImageBody(context);
            }
          },
        )
      );
  }
}

Widget _defaultBody(File img, BuildContext context){
  return Column(
    children: [
      Image.file(img),
      ElevatedButton(onPressed: () {
        BlocProvider.of<PictureBloc>(context).add(CambiarImagenEvent());
      }, child: Text("Cambiar foto"))
    ],
  );
}

Widget _noImageBody(BuildContext context){
  return Column(
    children: [
      ElevatedButton(onPressed: () {
        BlocProvider.of<PictureBloc>(context).add(CambiarImagenEvent());
      }, child: Text("Cambiar foto"))
    ],
  );
}