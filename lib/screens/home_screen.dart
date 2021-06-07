import 'package:conversor_bases/components/base_display.dart';
import 'package:conversor_bases/components/conversor_button.dart';
import 'package:conversor_bases/const/bases.dart';
import 'package:conversor_bases/const/const.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  String base = Base.DEC;

  void handleOnChange(String value) {
    setState(() {
      this.base = value;
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.black,
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            BaseDisplay(
              isActive: base == Base.DEC,
              name: Base.DEC,
              val: "0",
              onChange: () => handleOnChange(Base.DEC),
            ),
            BaseDisplay(
              isActive: base == Base.BIN,
              name: Base.BIN,
              val: "0",
              onChange: () => handleOnChange(Base.BIN),
            ),
            BaseDisplay(
              isActive: base == Base.HEX,
              name: Base.HEX,
              val: "0",
              onChange: () => handleOnChange(Base.HEX),
            ),
            BaseDisplay(
              isActive: base == Base.OCT,
              name: Base.OCT,
              val: "0",
              onChange: () => handleOnChange(Base.OCT),
            ),
            Row(
              children: [
                Button(content: "7"),
                Button(content: "8"),
                Button(content: "9"),
                Button(content: "DEL", bgColor: RED),
                Button(content: "AC", bgColor: RED),
              ],
            ),
            Row(children: [
              Button(content: "4"),
              Button(content: "5"),
              Button(content: "6"),
              Button(content: "A", disable: true),
              Button(content: "C", disable: true),
            ]),
            Row(children: [
              Button(content: "1"),
              Button(content: "2"),
              Button(content: "3"),
              Button(content: "C", disable: true),
              Button(content: "D", disable: true),
            ]),
            Row(children: [
              Button(content: "0", width: 0.60),
              Button(content: "C", disable: true),
              Button(content: "D", disable: true),
            ]),
          ],
        ),
      ),
    );
  }
}
