import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'data/PostCover.dart';
import 'main.dart';

class PostListItem extends StatelessWidget {
  final List<Post> posts;

  PostListItem(this.posts);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: posts.length,
      itemBuilder: (BuildContext context, int index) {
        return InkWell(
            onTap: () => _onLocationTap(context, posts[index]),
            child: Padding(
                padding: EdgeInsets.all(10),
                child: Text.rich(
                  TextSpan(
                    text: "Here is the post:",
                    children: <TextSpan>[
                      TextSpan(
                        text: " ${posts[index].title}",
                        style: TextStyle(
                          color: Colors.deepOrange.withOpacity(0.8)
                        )
                      )
                    ]
              ),
            )
        )
        );
      },
    );
  }

  _onLocationTap(BuildContext context, Post post) {
    Navigator.pushNamed(context, DetailRoute,
        arguments: {"post": post});
  }
}
