import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class LogoWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Container(
      width: 150.0,
      height: 150.0,
      decoration: new BoxDecoration(
        color: Colors.grey.withOpacity(0.2),
        borderRadius: new BorderRadius.all(new Radius.circular(100.0)),
      ),
      child: Icon(
        Icons.book,
        size: 100.0,
        color: Colors.grey.withOpacity(0.5),
      ),
    );
  }
}
