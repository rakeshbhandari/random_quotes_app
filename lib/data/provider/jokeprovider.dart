// provides data from joke repository

import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../implementation/joke_repo_impl.dart';

final jokeProvider = Provider<JokeRepoImpl>((ref) => JokeRepoImpl());
