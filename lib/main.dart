import 'package:flutter/material.dart';
import 'package:flutter_app/routes/video_page.dart';
import 'package:flutter_app/routes/web.dart';

import 'routes/home.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: '/video',
      routes: {
        '/' : (context) => HomePage(),
        '/web' : (context) => WebPage(),
        '/video' : (context) => VideoPage()
      },
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
    );
  }
}
