import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:random_quotes_app/ui/pages/future_provider.dart';
import 'package:random_quotes_app/ui/services/statenotifier.dart';

class HomePage extends ConsumerStatefulWidget {
  const HomePage({super.key});

  @override
  ConsumerState<HomePage> createState() => _HomePageState();
}

class _HomePageState extends ConsumerState<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home Page'),
      ),
      body: ElevatedButton(
        child: const Text('Get quotes'),
        onPressed: () {
          ref.read(dataNotifierProvider.notifier).getJoke();
          Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => FutureProviderPage(
                    color: Theme.of(context).colorScheme.primary)),
          );
        },
      ),
    );
  }
}
