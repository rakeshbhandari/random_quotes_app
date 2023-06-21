import 'package:flutter/material.dart';
import 'package:random_quotes_app/ui/pages/future_provider.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home Page'),
      ),
      body: ElevatedButton( child:const Text ('Get quotes'),
        onPressed: () {
         Navigator.push(
          context,
            MaterialPageRoute(
              builder: (context)=> FutureProviderPage(
                color: Theme.of(context).colorScheme.primary)),
              );
      
        },
      
      ),




    );
  }
}
