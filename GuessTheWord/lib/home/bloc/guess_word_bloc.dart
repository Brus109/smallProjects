import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'guess_word_event.dart';
part 'guess_word_state.dart';

class GuessWordBloc extends Bloc<GuessWordEvent, GuessWordState> {
  List<String> _wordsList = ["Ayuda", "Esto", "No", "Es", "Un", "Meme"];
  int _score = 0;
  int get getScore => _score;
  int _currentIndex = 0;

  GuessWordBloc() : super(GuessWordInitial()) {
    on<StartGameEvent>(_startGame);
    on<SkipWordEvent>(_skipGame);
    on<GotItEvent>(_gotItGame);
    on<EndGameEvent>(_endGame);
    on<ResetGameEvent>(_resetGame);
  }

  FutureOr<void> _startGame(GuessWordEvent event, Emitter emit) {
    emit(
      GameInProgressState(currentWord: _wordsList[_currentIndex], score: _score.toString())
    );
  }
  
  FutureOr<void> _skipGame(GuessWordEvent event, Emitter emit) {
    if(_currentIndex == _wordsList.length-1){
      emit(ShowScoreState(finalScore: _score.toString()));
    }else{
      _currentIndex++;
      emit(
        GameInProgressState(currentWord: _wordsList[_currentIndex], score: _score.toString())
      );
    }
  }

  FutureOr<void> _gotItGame(GuessWordEvent event, Emitter emit) {
    _score++;
    if(_currentIndex == _wordsList.length-1){
      emit(ShowScoreState(finalScore: _score.toString()));
    }else{
      _currentIndex++;
      emit(
        GameInProgressState(currentWord: _wordsList[_currentIndex], score: _score.toString())
      );
    }
  }

  FutureOr<void> _endGame(GuessWordEvent event, Emitter emit) {
    emit(ShowScoreState(finalScore: _score.toString()));
  }

  FutureOr<void> _resetGame(GuessWordEvent event, Emitter emit) {
    _currentIndex = 0;
    _score = 0;
    emit(GameNotStartedState());
  }
}
