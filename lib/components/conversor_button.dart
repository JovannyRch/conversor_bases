import 'package:conversor_bases/const/const.dart';
import 'package:flutter/material.dart';

class Button extends StatelessWidget {
  Size _size;
  final String content;
  Color bgColor;
  bool disable;
  double width;
  Button({this.content, this.bgColor, this.disable = false, this.width = 0.20});

  @override
  Widget build(BuildContext context) {
    if (this.bgColor == null) {
      this.bgColor = GREY;
    }
    _size = MediaQuery.of(context).size;
    return GestureDetector(
      child: Container(
        decoration: BoxDecoration(
          color: !disable ? bgColor : GREY_DISABLE,
        ),
        width: _size.width * width,
        height: _size.height * 0.12,
        child: Center(
          child: Text(
            content,
            style: TextStyle(
              color: Colors.white,
              fontSize: 20.0,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    );
  }
}
