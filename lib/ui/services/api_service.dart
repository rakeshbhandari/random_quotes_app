import 'package:dio/dio.dart';
// ignore: depend_on_referenced_packages
import 'package:riverpod/riverpod.dart';

import '../models/random.dart';

final apiServiceProvider = Provider<ApiService>((ref) => ApiService());

class ApiService {
  Future<Random> getRandomQuotes() async {
    try {
      final res = await Dio().get('https://api.quotable.io/random');
      return Random.fromJson(res.data);
    } catch (e) {
      throw Exception('Error getting quotes');
    }
  }
}
