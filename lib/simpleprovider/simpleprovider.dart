import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final nameProvider = Provider<String>((ref) {
  return "yahya and ajlal";
});

final ageProvider = Provider<int>((ref) {
  return 23;
});

class Simpleprovider extends ConsumerWidget {
  const Simpleprovider({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {

    final name = ref.watch(nameProvider);
    final age = ref.watch(ageProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text("Riverpod Management"),
      ),

      body: Center(
        child: Text("Welcome $name, you are $age years old."),
      ),
    );
  }
}