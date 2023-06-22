import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:random_quotes_app/ui/services/api_service.dart';
import 'package:random_quotes_app/ui/services/dataState.dart';

class DataNotifier extends StateNotifier<DataState> {
  DataNotifier() : super(DataInitialState()) {
    getJoke();
  }

  Future<void> getJoke() async {
    state = DataLoadingState();

    try {
      final joke = await ApiService().getRandomQuotes();
      state = DataLoadedState(joke);
    } catch (err) {
      state = DataErrorState(err.toString());
    }
  }
}

// make provider for datanotifier
final dataNotifierProvider =
    StateNotifierProvider<DataNotifier, DataState>((ref) => DataNotifier());
