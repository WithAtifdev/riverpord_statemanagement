
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpord_management/futureprovider/Api/model/postModel.dart';
import 'package:riverpord_management/futureprovider/Api/service/api_service.dart';

final postProvider = FutureProvider<List<postModel>>((ref) {
  return getPosts();
});