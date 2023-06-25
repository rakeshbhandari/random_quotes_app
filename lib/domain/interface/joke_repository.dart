import '../model/jokemodel.dart';

abstract class JokeRepository {
  Future<JokeModel> getRandomQuotes();
}
