// ignore_for_file: public_member_api_docs, lines_longer_than_80_chars
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    const MyApp(),
  );
}

// -----------------------------------------------------

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: MyHomePage(),
    );
  }
}

// -----------------------------------------------------

class MyHomePage extends StatelessWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => Counter()),
      ],
      child: MyHomePageView(),
    );
  }
}

class MyHomePageView extends StatelessWidget {
  const MyHomePageView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Exemplo'),
      ),
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Aumenta'),
            Text('${context.watch<Counter>().counts}'),
            SizedBox(height: 30),
            TextButton(
                onPressed: () => context.read<Counter>().decrement(),
                child: Text("Diminui"))
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => context.read<Counter>().increment(),
        tooltip: 'Acrescentar',
        child: const Icon(Icons.add),
      ),
    );
  }
}

// -----------------------------------------------------

class Counter with ChangeNotifier {
  int counts = 0;
  void increment() {
    counts++;
    notifyListeners();
  }

  void decrement() {
    if (counts == 0) {
    } else {
      counts--;
      notifyListeners();
    }
  }
}
