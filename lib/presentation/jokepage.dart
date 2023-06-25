import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../domain/state/jokeState.dart';
import '../data/notifier/statenotifier.dart';

class FutureProviderPage extends ConsumerWidget {
  const FutureProviderPage({super.key, required this.color});

  final Color color;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(jokeNotifierProvider);

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
              state is JokeLoadedState
                  ? Column(
                      children: [
                        Text(state.joke.content),
                        const SizedBox(height: 30),
                        Text(state.joke.author),
                      ],
                    )
                  : state is JokeErrorState
                      ? Text(state.message.toString())
                      : const CircularProgressIndicator(),
              const SizedBox(height: 30),
              ElevatedButton(
                onPressed: () {
                  ref.read(jokeNotifierProvider.notifier).getJoke();
                },
                child: const Text('Get Random Quote'),
              ),
            ],
          ),
        )));
  }
}
