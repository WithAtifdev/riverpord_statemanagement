import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:riverpord_management/futureprovider/Api/model/postModel.dart';

Future<List<postModel>> getPosts() async {
  try {
    final response = await http.get(
    Uri.parse('https://jsonplaceholder.typicode.com/posts'),
  );


  if (response.statusCode == 200) {
    final List<dynamic> data = jsonDecode(response.body);
    List<postModel> postList = data.map((json) => postModel.fromJson(json)).toList();
    return postList;
  } else {
    throw Exception('Failed to load posts');
  }

  }
  on SocketException {
    throw Exception('No Internet connection');
  }
  catch (e) {
    // rethrow;
    throw Exception('Failed to load posts: $e');
  }
}