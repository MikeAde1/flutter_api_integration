import 'package:flutterapiintegration/data/PostCover.dart';
import 'package:http/http.dart' as http;
import 'dart:async';
import 'dart:io';

String url = "https://jsonplaceholder.typicode.com/posts";

Future<List<Post>> getAllPosts() async {
  //make api get request
  final response = await http.get(url); //returns response as string
  print(response.body);
  return postsFromJson(response.body);
}

Future<http.Response> createPost(Post post) async{
  //make api post request
  final response = await http.post('$url',
      headers: {
        HttpHeaders.contentTypeHeader: 'application/json',
        HttpHeaders.authorizationHeader : ''
      },
      body: postToJson(post) //convert post object to json to send as request
  );
  return response;
}