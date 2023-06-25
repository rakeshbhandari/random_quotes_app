import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:random_quotes_app/ui/models/random.dart';
import 'package:random_quotes_app/ui/services/api_service.dart';

import '../services/dataState.dart';
import '../services/statenotifier.dart';

// final randomFutureProvider =
//     FutureProvider<RandomData>((ref) async {
//   final apiService = ref.watch(apiServiceProvider);
//   return apiService.getRandomQuotes();
// });

class FutureProviderPage extends ConsumerWidget {
  const FutureProviderPage({super.key, required this.color});

  final Color color;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // final state = ref.watch(dataNotifierProvider.notifier);
    final state = ref.watch(dataNotifierProvider);

    return Scaffold(
        appBar: AppBar(
          backgroundColor: color,
          title: const Text('Future Provider'),
        ),
        body: Center(
            child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              state is DataLoadedState
                  ? Column(
                      children: [
                        Text(state.data.content),
                        const SizedBox(height: 30),
                        Text(state.data.author),
                      ],
                    )
                  : state is DataErrorState
                      ? Text(state.message.toString())
                      : const CircularProgressIndicator(),
              const SizedBox(height: 30),
              ElevatedButton(
                onPressed: () {
                  ref.read(dataNotifierProvider.notifier).getJoke();
                },
                child: const Text('Get Random Quote'),
              ),
              const SizedBox(height: 100),
              Text(state is DataLoadingState ? 'Loading' : 'LOADED'),
              const SizedBox(height: 40),
              Icon(state is DataLoadingState
                  ? Icons.coronavirus
                  : Icons.health_and_safety),
              Card(
                  elevation: 5,
                  color: Colors.teal,
                  margin: const EdgeInsets.all(20),
                  child: Text(
                      (state is DataLoadingState ? 'Loadingggggg' : 'Loaded')))
            ],
          ),
        )));
  }
}
