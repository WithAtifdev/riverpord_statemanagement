import 'dart:async';
import 'dart:math';

import 'package:flutter_riverpod/flutter_riverpod.dart';

final stockPriceProvider = StreamProvider<double>((ref) {
  return Stream.periodic(
    const Duration(seconds: 1),
    (_) => 100 + Random().nextDouble() * 10,
  );
});