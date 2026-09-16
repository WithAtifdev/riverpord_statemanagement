


import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpord_management/futureprovider/future_provider.dart';

class MyWidget extends ConsumerWidget {
  const new({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final provider = ref.watch(futureProvider);
    return Scaffold(
      appBar: AppBar(
        title: Text("Future provider"),
      ),
      floatingActionButton: FloatingActionButton(onPressed: (){
        ref.invalidate(futureProvider);
      }),
      body: Center(
        child: provider.when(
          skipLoadingOnRefresh: false,
          data: (value) => ListView.builder(
            itemCount: value.length,
            itemBuilder: (context, index) {
            return Text(value[index].toString());
          }), 
           error: (error, stack) => Text(error.toString()),
          loading: () => CircularProgressIndicator()
      )

        
      ),
    );
  }
}