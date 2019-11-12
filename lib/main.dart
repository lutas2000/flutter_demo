import 'package:flutter/material.dart';
import 'package:flutter_app/routes/web.dart';

import 'routes/home.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: '/web',
      routes: {
        '/' : (context) => HomePage(),
        '/web' : (context) => WebPage()
      },
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
    );
  }
}
