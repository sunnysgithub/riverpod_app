import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final greetingProvider = Provider((ref) => 'Hello!');

void main() {
  runApp(
    ProviderScope(
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: Scaffold(
          body: Center(
            child: Consumer(
              builder: (context, watch, child) {
                final incrementNotifier = watch(incrementProvider);
                return Text(incrementNotifier.value.toString());
              },
            ),
          ),
          floatingActionButton: FloatingActionButton(
            onPressed: () {
              context.read(incrementProvider).increment();
            },
            child: Icon(Icons.add),
          ),
        ));
  }
}

class IncrementNotifier extends ChangeNotifier {
  int _value = 0;
  int get value => _value;

  void increment() {
    _value += 1;
    notifyListeners();
  }
}

final incrementProvider = ChangeNotifierProvider((ref) => IncrementNotifier());
