import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_riverpod/legacy.dart';


final counterProvider = StateProvider<int>((ref) {
  return 0;
});


class  CounterApp extends ConsumerWidget {
  const CounterApp({super.key});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("StateProvider Example"),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Consumer(
            builder: (context, ref, child) {
              final counter = ref.watch(counterProvider);
              return Center(
                child: Text(
                  "$counter",
                  style: const TextStyle(fontSize: 40),
                ),
              );
            },
          ),
          SizedBox(height: 30),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              ElevatedButton(
                onPressed: () {
                  ref.read(counterProvider.notifier).state--;
                },
                child: const Icon(Icons.remove),
              ),
              const SizedBox(width: 20),
              ElevatedButton(
                onPressed: () {
                  ref.read(counterProvider.notifier).state++;
                },
                child: const Icon(Icons.add),
              )
            ],
          ),
        ],
      ),
    );
  }
}