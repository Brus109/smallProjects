import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:image_picker/image_picker.dart';
import 'package:meta/meta.dart';
import 'package:provider/provider.dart';

part 'picture_event.dart';
part 'picture_state.dart';

class PictureBloc extends Bloc<PictureEvent, PictureState> {
  File? _chosenImage;
  PictureBloc() : super(PictureInitial()) {
    on<CambiarImagenEvent>((event, emit) async{
      emit(ProcesandoState());
      await _getImage();
      if(_chosenImage == null){
        emit(PictureError(error: "No se cambio la imagen"));
      }else{
        emit(CambiarImagenState(newPicture: _chosenImage!));
      }
    });
  }
  Future<void> _getImage() async{
  final picker = ImagePicker();
  final XFile? pickedImage = await picker.pickImage(
    source: ImageSource.camera,
    imageQuality: 85,
    maxHeight: 720,
    maxWidth: 720
    );
    if(pickedImage != null){
      _chosenImage = File(pickedImage.path);
    }else{
      _chosenImage = null;
    }
}
}


