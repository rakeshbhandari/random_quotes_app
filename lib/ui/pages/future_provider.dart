import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:random_quotes_app/ui/models/random.dart';
import 'package:random_quotes_app/ui/services/api_service.dart';

final randomFutureProvider = FutureProvider.autoDispose<Random>((ref) async {
  final apiService = ref.watch(apiServiceProvider);
  return apiService.getRandomQuotes();
});


class FutureProviderPage extends ConsumerWidget {
  const FutureProviderPage({super.key, required this.color});

  final Color color;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final randomRef = ref.watch(randomFutureProvider);
    return Scaffold(
        appBar: AppBar(
          backgroundColor: color,
          title: const Text('Future Provider'),
        ),
        body: Center(
          child: randomRef.when(data: (data) {
            return Column(
              children: [
                Text(data.content,
                    style: Theme.of(context).textTheme.headlineMedium),
                Text(data.author,
                    style: Theme.of(context).textTheme.headlineSmall),
                const SizedBox(height: 100),
                ElevatedButton(
                  onPressed: () {
                    // ref.refresh(randomFutureProvider);
                    ref.read(apiServiceProvider).getRandomQuotes();
                  },
                  child: const Text('Next'),
                )
              ],
            );
          }, error: (error, _) {
            return Text(error.toString());
          }, loading: () {
            return const CircularProgressIndicator();
          }),
        ));
  }
}
