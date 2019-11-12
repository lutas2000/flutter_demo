import 'package:flutter/material.dart';
import 'package:flutter_app/components/counter.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Home Page'),
      ),
      body: Center(
          child: Counter()
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}