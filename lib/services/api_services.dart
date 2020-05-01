import 'dart:convert';

import 'package:wallpro/data/api_link.dart';
import 'package:wallpro/models/blog.dart';
import 'package:http/http.dart' as http;

Future<List<Blog>> getBlogPosts() async {
  final response = await http.get(url);
  if (response.statusCode == 200) {
    List<dynamic> jsonBlog = json.decode(response.body);
    return jsonBlog.map((blog) => Blog.fromJson(blog)).toList();
  } else {
    throw Exception(
        'Kei Exception Aayo and ma FutureBuilder le teslai catch gare');
  }
}
