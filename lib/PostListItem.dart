import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'data/PostCover.dart';

class PostListItem extends StatelessWidget {
  final List<Post> posts;

  PostListItem(this.posts);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: posts.length,
      itemBuilder: (BuildContext context, int index) {
        return Padding(
          padding: EdgeInsets.all(10),
          child: new Text(
              "Here is the post: ${posts[index].title}",
              style: TextStyle(color: Colors.deepOrange)),
        );
      },
    );
  }
}
