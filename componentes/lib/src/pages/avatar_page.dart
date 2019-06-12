import 'package:flutter/material.dart';

class AvatarPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Avatar Page'),
        actions: <Widget>[
          Container(
            padding: EdgeInsets.all(5),
            child: CircleAvatar(
              backgroundImage: NetworkImage(
                  'https://imgix.bustle.com/uploads/getty/2019/2/11/8a7cf626-b64b-4d45-b938-753464d7244f-getty-1128780865.jpg?w=1020&h=574&fit=crop&crop=faces&auto=format&q=70'),
              radius: 23.0,
            ),
          ),
          Container(
            margin: EdgeInsets.only(right: 10.0),
            child: CircleAvatar(
              child: Text('MC'),
              backgroundColor: Colors.deepPurpleAccent,
            ),
          )
        ],
      ),
      body: Center(
        child: FadeInImage(
          image: NetworkImage(
              'https://nyppagesix.files.wordpress.com/2019/03/miley-cyrus.jpg?quality=90&strip=all'),
          placeholder: AssetImage('assets/img/jar-loading.gif'),
          fadeInDuration: Duration(milliseconds: 200),
        ),
      ),
    );
  }
}
