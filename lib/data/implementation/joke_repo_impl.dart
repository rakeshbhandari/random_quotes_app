import '../../domain/model/jokemodel.dart';
import '../../domain/interface/joke_repository.dart';
import 'package:dio/dio.dart';

class JokeRepoImpl extends JokeRepository {
  @override
  Future<JokeModel> getRandomQuotes() async {
    final response = await Dio().get('https://api.quotable.io/random');

    if (response.statusCode == 200) {
      return JokeModel.fromJson(response.data);
    } else {
      throw Exception('Failed to load data');
    }
  }
}
