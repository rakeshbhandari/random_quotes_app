import 'dart:math';

import 'package:random_quotes_app/ui/models/random.dart';

abstract class DataState {
  DataState();
}

class DataInitialState extends DataState {
  DataInitialState();
}

class DataLoadingState extends DataState {
  DataLoadingState();
}

class DataLoadedState extends DataState {
  final RandomData data;
  DataLoadedState(this.data);
}

class DataErrorState extends DataState {
  final String? message;
  DataErrorState(
    String tr, {
    this.message,
  });
}
