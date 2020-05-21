// To parse this JSON data, do
//
//     final Post = PostFromJson(jsonString);

import 'dart:convert';

List<Post> postsFromJson(String str) => List<Post>.from(json.decode(str).map((x) => Post.fromJson(x)));

String postsToJson(List<Post> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

String postToJson(Post data) {
  //serialize post to string
  final dyn = data.toJson();
  return json.encode(dyn);
}

Post postFromJson(String str) {
  //deserialize string to Post object
  final jsonData = json.decode(str);
  return Post.fromJson(jsonData);
}

class Post {
  int userId;
  int id;
  String title;
  bool completed;

  Post({
    this.userId,
    this.id,
    this.title,
    this.completed,
  });

  factory Post.fromJson(Map<String, dynamic> json) => Post(
    userId: json["userId"],
    id: json["id"],
    title: json["title"],
    completed: json["completed"],
  );

  Map<String, dynamic> toJson() => {
    "userId": userId,
    "id": id,
    "title": title,
    "completed": completed,
  };
}
