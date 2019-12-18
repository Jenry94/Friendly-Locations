import 'package:firebase_auth/firebase_auth.dart';
import 'package:fireoze/Constants.dart';
import 'package:flutter/material.dart';

class MyHomePage extends StatefulWidget {
  MyHomePage(this.user);

  final FirebaseUser user;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Theme.of(context).primaryColor,
        appBar: AppBar(
          centerTitle: true,
          elevation: 0,
          title: Text(APP_NAME, style: new TextStyle(color: Colors.white),),
          actions: <Widget>[
            new IconButton(
              icon: new CircleAvatar(
                radius: 15,
                backgroundImage: widget.user.photoUrl != null ? NetworkImage(widget.user.photoUrl) : AssetImage("assets/images/profile.png"),
              ),
              onPressed:(){
                
              },
            )
          ],
        ),
        body: content());
  }

  Widget content() {
    return Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: new Column(mainAxisSize: MainAxisSize.min, children: <Widget>[
          header(),
          body(),
        ]));
  }

  Widget header() {
    return Container(
        color: Theme.of(context).primaryColor,
        child: new Padding(
            padding: EdgeInsets.all(20),
            child: new Center(
                child: new Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                  new Padding(
                    padding: EdgeInsets.only(right: 5),
                    child: new Text("Jenry",
                        style: new TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: Colors.white)),
                  ),
                  new Padding(
                    padding: EdgeInsets.only(right: 5),
                    child: new Text("Gordillo",
                        style:
                            new TextStyle(fontSize: 20, color: Colors.white)),
                  )
                ]))));
  }

  Widget body() {
    return Flexible(
      flex: 1,
      child: new Container(
        child: new Column(
          children: <Widget>[
            new Expanded(
              child: new ListView.builder(
                itemCount: 13,
                itemBuilder: (BuildContext context, int index) {
                  return Padding(
                    padding: EdgeInsets.only(left: 20, right: 20),
                    child: new ListTile(
                      leading: new Image(image: new NetworkImage("https://upload.wikimedia.org/wikipedia/commons/thumb/c/cb/Google_Assistant_logo.svg/1200px-Google_Assistant_logo.svg.png", scale: 50)),
                      title: widget.user.displayName !=null ? new Text(widget.user.displayName+" "+ (index+1).toString()) : new Text(widget.user.email+" "+ (index+1).toString()),
                      subtitle: new Text(widget.user.email),
                      trailing: new Icon(Icons.chevron_right),
                    )
                  );
                }
              )
            )
          ]
        ),
        decoration: new BoxDecoration(
          color: Colors.white,
          borderRadius:new BorderRadius.only(topLeft: new Radius.circular(65))
        ),
      )
    );
  }
}
