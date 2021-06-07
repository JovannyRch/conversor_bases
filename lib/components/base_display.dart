import 'package:conversor_bases/const/const.dart';
import 'package:flutter/material.dart';

class BaseDisplay extends StatelessWidget {
  final bool isActive;
  final String name;
  final String val;
  final double height = 0.11;
  final Function onChange;
  BaseDisplay({this.isActive, this.name, this.val, this.onChange});

  Size _size;

  @override
  Widget build(BuildContext context) {
    _size = MediaQuery.of(context).size;
    return Container(
      height: _size.height * height,
      child: Row(
        children: [
          GestureDetector(
            onTap: onChange,
            child: Container(
              decoration: BoxDecoration(color: isActive ? GREEN : GREY),
              height: _size.height * height,
              width: _size.width * 0.20,
              child: Center(
                child: Text(
                  name,
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ),
          Container(
            padding: EdgeInsets.only(right: 5.0),
            decoration: BoxDecoration(
              color: Colors.black,
            ),
            height: _size.height * height,
            width: _size.width * 0.80,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  val,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 23.0,
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
