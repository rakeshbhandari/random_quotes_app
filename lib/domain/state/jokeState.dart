import 'package:random_quotes_app/domain/model/jokemodel.dart';

abstract class JokeState {
  JokeState();
}

class JokeInitialState extends JokeState {
  JokeInitialState();
}

class JokeLoadingState extends JokeState {
  JokeLoadingState();
}

class JokeLoadedState extends JokeState {
  final JokeModel joke;
  JokeLoadedState(this.joke);
}

class JokeErrorState extends JokeState {
  final String? message;
  JokeErrorState(
    String tr, {
    this.message,
  });
}
