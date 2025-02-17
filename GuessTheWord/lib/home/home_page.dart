import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:guess_the_word/home/bloc/guess_word_bloc.dart';

class HomePage extends StatelessWidget {
  HomePage({
    super.key,
  });

  //Add the BLoC builder/consumer
  //implement logic to return different states
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Guess the word!'),
      ),
      body: BlocBuilder<GuessWordBloc, GuessWordState>(
        builder: (context, state) {
          if(state is GameNotStartedState){
            return _startGame(context);
          }else if(state is ShowScoreState){
            return _showScores(state.finalScore, context);
          }else if(state is GameInProgressState){
            return _inProgressGame(state.currentWord, state.score, context);
          }
          return _startGame(context);
        },
      )
    );
  }

  //create widgets to return on different states
  Widget _startGame(BuildContext context) {
    // should recieve a bloc reference
    return Column(
      children: [
        Expanded(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text("Get ready to"),
              Text("Guess the word!", style: TextStyle(fontSize: 28)),
            ],
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            MaterialButton(
              child: Text("Play", style: TextStyle(color: Colors.white)),
              color: Colors.green,
              onPressed: () {
                //add play method here
                BlocProvider.of<GuessWordBloc>(context).add(StartGameEvent());
              },
            ),
          ],
        ),
      ],
    );
  }

  Widget _inProgressGame(String word, String score, BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text("The word is"),
              Text("$word"),
            ],
          ),
        ),
        Text("$score"),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            MaterialButton(
              child: Text("Skip", style: TextStyle(color: Colors.white)),
              color: Colors.indigo,
              onPressed: () {
                BlocProvider.of<GuessWordBloc>(context).add(SkipWordEvent());
              },
            ),
            MaterialButton(
              child: Text("Got it", style: TextStyle(color: Colors.white)),
              color: Colors.green,
              onPressed: () {
                BlocProvider.of<GuessWordBloc>(context).add(GotItEvent());
              },
            ),
            MaterialButton(
              child: Text("End Game", style: TextStyle(color: Colors.white)),
              color: Colors.indigo,
              onPressed: () {
                BlocProvider.of<GuessWordBloc>(context).add(EndGameEvent());
              },
            ),
          ],
        ),
      ],
    );
  }

  Widget _showScores(String score, BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text("Score!!!"),
              Text("$score", style: TextStyle(fontSize: 28)),
            ],
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            MaterialButton(
              child: Text("Play again", style: TextStyle(color: Colors.white)),
              color: Colors.green,
              onPressed: () {
                BlocProvider.of<GuessWordBloc>(context).add(ResetGameEvent());
              },
            ),
          ],
        ),
      ],
    );
  }
}
