import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:random_quotes_app/domain/state/jokeState.dart';
import '../implementation/joke_repo_impl.dart';
import '../provider/jokeprovider.dart';

class JokeNotifier extends StateNotifier<JokeState> {
  final JokeRepoImpl jokeRepoImpl;
  JokeNotifier(this.jokeRepoImpl) : super(JokeInitialState()) {
    getJoke();
  }

  Future<void> getJoke() async {
    state = JokeLoadingState();

    try {
      final joke = await jokeRepoImpl.getRandomQuotes();

      state = JokeLoadedState(joke);
    } catch (err) {
      state = JokeErrorState(err.toString());
    }
  }
}

final jokeNotifierProvider =
    StateNotifierProvider.autoDispose<JokeNotifier, JokeState>(
        (ref) => JokeNotifier(ref.watch(jokeProvider)));
