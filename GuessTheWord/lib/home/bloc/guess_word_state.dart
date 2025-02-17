part of 'guess_word_bloc.dart';

sealed class GuessWordState extends Equatable {
  const GuessWordState();

  @override
  List<Object> get props => [];
}

final class GuessWordInitial extends GuessWordState {}
// define necessary states here. Remember states as results to events
class GameNotStartedState extends GuessWordState{}

class GameInProgressState extends GuessWordState{
  final String currentWord;
  final String score;

  GameInProgressState({required this.currentWord, required this.score});
  @override
  //props es la lista de datos que usara equatable para comparar
  List<Object> get props => [currentWord, score];
}

class ShowScoreState extends GuessWordState{
  final String finalScore;

  ShowScoreState({required this.finalScore});

  @override
  List<Object> get props => [finalScore];
}