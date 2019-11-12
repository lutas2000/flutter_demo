import 'package:flutter/material.dart';
import 'package:flutter_app/components/side_button.dart';

class Counter extends StatefulWidget {
  @override
  _CounterState createState() => _CounterState();
}

class _CounterState extends State<Counter> {
  int _count = 0;

  void _addCount() {
    setState(() {
      _count++;
    });
  }

  void _subCount() {
    setState(() {
      _count--;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        SideButton(
          direction: Direction.Left,
          child: Text('-'),
          onPressed: _subCount,
        ),
        Text('$_count'),
        SideButton(
          direction: Direction.Right,
          child: Text('+'),
          onPressed: _addCount,
        ),
      ],
    );
  }
}