part of 'guess_word_bloc.dart';

sealed class GuessWordEvent extends Equatable {
  const GuessWordEvent();

  @override
  List<Object> get props => [];
}

class StartGameEvent extends GuessWordEvent{ }

class SkipWordEvent extends GuessWordEvent{ }

class GotItEvent extends GuessWordEvent{ }

class EndGameEvent extends GuessWordEvent{ }

class ResetGameEvent extends GuessWordEvent{ }