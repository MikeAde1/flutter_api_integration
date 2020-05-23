import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'data/PostCover.dart';
import 'package:fluttertoast/fluttertoast.dart';

class PageDetail extends StatelessWidget{
  final Post post;
  var textController = new TextEditingController();
  var idController = new TextEditingController();

  PageDetail(this.post);

  @override
  Widget build(BuildContext context) {
    textController.text = post.title;
    idController.text = post.id.toString();
    return Scaffold(
      appBar: AppBar(
        title: Text("Post Detail",)
      ),
     body: Padding(
        padding: EdgeInsets.all(10),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          mainAxisSize: MainAxisSize.max,
          children: <Widget>[
            new TextField(readOnly: true, controller: idController,),
            new Wrap(children: <TextField>[
              new TextField(controller: textController, maxLines: 2,)
            ]),
            new RaisedButton(
                child: Text("Show detail"),
                onPressed: (){
                  Fluttertoast.showToast(msg: textController.text);
                }
                )
          ],
        ),
      )
    );
  }
}