import 'package:flutter/material.dart';

class SideButton extends StatelessWidget {
  SideButton({Key key, this.direction = Direction.Left, @required this.child, @required this.onPressed}) : super(key: key);

  final VoidCallback onPressed;
  final Widget child;
  final Direction direction;

  @override
  Widget build(BuildContext context) {
    return SizedBox (
      width: 45,
      height: 30,
      child: FlatButton(
        onPressed: onPressed,
        child: child,
        color: Colors.orangeAccent,
        textColor: Colors.white,
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.horizontal(
              left: direction == Direction.Left ? Radius.circular(10) : Radius.zero,
              right: direction == Direction.Right ? Radius.circular(10) : Radius.zero,
            )
        ),
      ),
    );
  }
}

enum Direction {
  Left,
  Right
}