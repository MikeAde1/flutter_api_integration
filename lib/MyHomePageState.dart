import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'api/services.dart';
import 'package:async_loader/async_loader.dart';
import 'data/PostCover.dart';
import 'package:flutterapiintegration/PostListItem.dart';

class HomePage extends StatelessWidget {

  callAPI(){
    Post post = Post(
        title: 'This is a test',
        userId: 1,
        id: 101,
        completed: false
    );
    createPost(post).then((response){
      if(response.statusCode > 200)
        print(response.body);
      else
        print(response.statusCode);
    }).catchError((error){
      print('error : $error');
    });
  }

  final GlobalKey<AsyncLoaderState> asyncLoaderState = new GlobalKey<AsyncLoaderState>();

  @override
  Widget build(BuildContext context) {
    var _asyncLoader = new AsyncLoader(
      key: asyncLoaderState,
      initState: () async => await getAllPosts(),
      renderLoad: () => Center(child: new CircularProgressIndicator()),
      renderError: ([error]) => getNoConnectionWidget(),
      renderSuccess: ({data}) => getListView(data),
    );

    return Scaffold(
      appBar: AppBar(
        // Here we take the value from the HomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text("Api With Async"),
        centerTitle: true,
      ),
      body: new Center(child: _asyncLoader)
    );
  }

  Widget getNoConnectionWidget(){
    return Column(
      mainAxisSize: MainAxisSize.max,
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        SizedBox(
          height: 60.0,
          child: new Container(
            decoration: new BoxDecoration(
              image: new DecorationImage(
                image: new AssetImage('assets/no-wifi.png'),
                fit: BoxFit.contain,
              ),
            ),
          ),
        ),

        new Text("No Internet Connection"),
        new FlatButton(
            color: Colors.red,
            child: new Text("Retry", style: TextStyle(color: Colors.white),),
            onPressed: () => asyncLoaderState.currentState.reloadState())
      ],
    );
  }

  Widget getListView(List<Post> posts){
    //build list view
    return new PostListItem(posts);
  }
}
