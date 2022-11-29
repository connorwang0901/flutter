import 'dart:ffi';

import 'package:flutter/material.dart';

void main() {
  runApp(
    MyApp()
  );
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.teal,
        body: SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              CircleAvatar(
                radius: 35.0,
                backgroundImage: AssetImage('images/me.jpeg'),
              ),
              Text('Connor Wang',
                 style: TextStyle(
                   fontFamily: 'AlfaSlabOne',
                   fontSize: 32.0,
                   color: Colors.white,
                 ),
              ),
              Text('Software Engineer',
                style: TextStyle(
                  fontSize: 18.0,
                  color: Colors.teal[100],
                  letterSpacing: 2.0
                ),
              ),
              SizedBox(height: 20,width: 150,
              child: Divider(
                color: Colors.teal.shade100,
                thickness: 0.4,
              ),
              ),
              Card  (
                color: Colors.white,
                margin: EdgeInsets.symmetric(horizontal: 25.0, vertical: 7),
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 3, vertical: 0),
                  child: ListTile(
                    leading: Icon(Icons.email, color: Colors.teal,),
                    title: Text('connor.wang3@gmail.com', style: TextStyle(
                        fontSize: 14,
                        color: Colors.teal
                    ),
                  )
                ),
              ),
              ),
              Card(
                color: Colors.white,
                margin: EdgeInsets.symmetric(horizontal: 25.0, vertical: 7),
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 3, vertical: 0),
                  child: ListTile(
                    leading: Icon(Icons.account_tree, color: Colors.teal,),
                    title: Text('linkedin.com/in/pengwang2', style: TextStyle(
                        fontSize: 13.0,
                        color: Colors.teal
                    ),
                  )
                ),
              )
              )
            ]
          ),
        ),
      )
    );
  }
}

