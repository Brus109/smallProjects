part of 'picture_bloc.dart';

sealed class PictureState extends Equatable{
  const PictureState();
  @override
  
  List<Object?> get props => [];
}

final class PictureInitial extends PictureState {}

final class PictureError extends PictureState {
  final String error;

  PictureError({required this.error});
  @override
  List<Object?> get props => [];
}

final class CambiarImagenState extends PictureState {
  final File newPicture;

  CambiarImagenState({required this.newPicture});
  @override
  List<Object?> get props => [];

}

final class ProcesandoState extends PictureState {}