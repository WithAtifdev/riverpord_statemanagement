import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpord_management/streamprovider/streamprovider.dart';

class StockScreen extends ConsumerWidget {

  const StockScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    

    return Scaffold(
      body: Consumer(
        builder: (context, ref, child){
final stockPrice = ref.watch(stockPriceProvider);
     return Center(
          child: stockPrice.when(
            skipLoadingOnRefresh: false,
            data: (price) => Text(
             price.toStringAsFixed(2),
            ),
            loading: () => const CircularProgressIndicator(),
            error: (error, stack) =>
            TextButton(
              onPressed: () {
                ref.invalidate(stockPriceProvider);
              },
              child: Text('Error: $error'),
          ),
        ),
     );
        }
        
      ),
    );
  }
}