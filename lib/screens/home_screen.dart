import 'package:conversor_bases/components/base_display.dart';
import 'package:conversor_bases/components/conversor_button.dart';
import 'package:conversor_bases/const/bases.dart';
import 'package:conversor_bases/const/const.dart';
import 'package:flutter/material.dart';
import 'package:baseconvert/baseconvert.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  String base = Base.DEC;
  String valDec = "0";
  String valBin = "0";
  String valHex = "0";
  String valOct = "0";

  void handleOnChangeDisplay(String value) {
    setState(() {
      this.base = value;
    });
  }

  String getCurrentValue() {
    if (base == Base.BIN) return valBin;
    if (base == Base.DEC) return valDec;
    if (base == Base.HEX) return valHex;
    if (base == Base.OCT) return valOct;
    return "";
  }

  void handleOnTapButton(String value) {
    String current = getCurrentValue();
    if (value == "0" && current == "0") {
      return;
    }

    setState(() {
      if (base == Base.BIN) {
        if (current == "0") {
          valBin = value;
        } else {
          valBin = valBin + value;
        }
      } else if (base == Base.DEC) {
        if (current == "0") {
          valDec = value;
        } else {
          valDec = valDec + value;
        }
      } else if (base == Base.HEX) {
        if (current == "0") {
          valHex = value;
        } else {
          valHex = valHex + value;
        }
      } else if (base == Base.OCT) {
        if (current == "0") {
          valOct = value;
        } else {
          valOct = valOct + value;
        }
      }
    });

    convert();
  }

  void removeLastLetter() {
    String current = getCurrentValue();
    if (current == "0") {
      return;
    }

    if (current.length == 1) {
      resetValues();
      return;
    }

    if (base == Base.BIN) {
      valBin = valBin.replaceAll(RegExp(r'.$'), "");
    } else if (base == Base.DEC) {
      valDec = valDec.replaceAll(RegExp(r'.$'), "");
    } else if (base == Base.OCT) {
      valOct = valOct.replaceAll(RegExp(r'.$'), "");
    } else if (base == Base.HEX) {
      valHex = valHex.replaceAll(RegExp(r'.$'), "");
    }
    setState(() {});
  }

  void convert() {
    if (base == Base.BIN) {
      BaseConverter oct = BaseConverter(inBase: 2, outBase: 8);
      BaseConverter dec = BaseConverter(inBase: 2, outBase: 10);
      BaseConverter hex = BaseConverter(inBase: 2, outBase: 16);
      valOct = listToString(oct.convert(valBin));
      valDec = listToString(dec.convert(valBin));
      valHex = listToString(hex.convert(valBin));
    } else if (base == Base.DEC) {
      BaseConverter oct = BaseConverter(inBase: 10, outBase: 8);
      BaseConverter bin = BaseConverter(inBase: 10, outBase: 2);
      BaseConverter hex = BaseConverter(inBase: 10, outBase: 16);
      valOct = listToString(oct.convert(valDec));
      valBin = listToString(bin.convert(valDec));
      valHex = listToString(hex.convert(valDec));
    } else if (base == Base.OCT) {
      BaseConverter hex = BaseConverter(inBase: 8, outBase: 16);
      BaseConverter bin = BaseConverter(inBase: 8, outBase: 2);
      BaseConverter dec = BaseConverter(inBase: 8, outBase: 10);
      valHex = listToString(hex.convert(valOct));
      valBin = listToString(bin.convert(valOct));
      valDec = listToString(dec.convert(valOct));
    } else if (base == Base.HEX) {
      BaseConverter oct = BaseConverter(inBase: 16, outBase: 8);
      BaseConverter bin = BaseConverter(inBase: 16, outBase: 2);
      BaseConverter dec = BaseConverter(inBase: 16, outBase: 10);
      valOct = listToString(oct.convert(valHex));
      valBin = listToString(bin.convert(valHex));
      valDec = listToString(dec.convert(valHex));
    }

    setState(() {});
  }

  String listToString(List list) {
    String res = "";
    for (int i = 0; i < list.length; i++) {
      res += list[i].toString();
    }
    return res;
  }

  void resetValues() {
    setState(() {
      valDec = "0";
      valBin = "0";
      valHex = "0";
      valOct = "0";
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
              val: valDec,
              onChange: () => handleOnChangeDisplay(Base.DEC),
            ),
            BaseDisplay(
              isActive: base == Base.BIN,
              name: Base.BIN,
              val: valBin,
              onChange: () => handleOnChangeDisplay(Base.BIN),
            ),
            BaseDisplay(
              isActive: base == Base.HEX,
              name: Base.HEX,
              val: valHex,
              onChange: () => handleOnChangeDisplay(Base.HEX),
            ),
            BaseDisplay(
              isActive: base == Base.OCT,
              name: Base.OCT,
              val: valOct,
              onChange: () => handleOnChangeDisplay(Base.OCT),
            ),
            Row(
              children: [
                Button(
                    content: "7",
                    disable: base == Base.BIN,
                    onTap: () => handleOnTapButton("7")),
                Button(
                    content: "8",
                    disable: base == Base.OCT || base == Base.BIN,
                    onTap: () => handleOnTapButton("8")),
                Button(
                    content: "9",
                    disable: base == Base.OCT || base == Base.BIN,
                    onTap: () => handleOnTapButton("9")),
                Button(
                    content: "DEL",
                    bgColor: RED,
                    onTap: () => removeLastLetter()),
                Button(content: "AC", bgColor: RED, onTap: () => resetValues()),
              ],
            ),
            Row(children: [
              Button(
                  content: "4",
                  disable: base == Base.BIN,
                  onTap: () => handleOnTapButton("4")),
              Button(
                  content: "5",
                  disable: base == Base.BIN,
                  onTap: () => handleOnTapButton("5")),
              Button(
                  content: "6",
                  disable: base == Base.BIN,
                  onTap: () => handleOnTapButton("6")),
              Button(
                  content: "A",
                  disable: base != Base.HEX,
                  onTap: () => handleOnTapButton("A")),
              Button(
                  content: "C",
                  disable: base != Base.HEX,
                  onTap: () => handleOnTapButton("C")),
            ]),
            Row(children: [
              Button(content: "1", onTap: () => handleOnTapButton("1")),
              Button(
                  content: "2",
                  disable: base == Base.BIN,
                  onTap: () => handleOnTapButton("2")),
              Button(
                  content: "3",
                  disable: base == Base.BIN,
                  onTap: () => handleOnTapButton("3")),
              Button(
                  content: "C",
                  disable: base != Base.HEX,
                  onTap: () => handleOnTapButton("C")),
              Button(
                  content: "D",
                  disable: base != Base.HEX,
                  onTap: () => handleOnTapButton("D")),
            ]),
            Row(children: [
              Button(
                  content: "0",
                  width: 0.60,
                  onTap: () => handleOnTapButton("0")),
              Button(
                  content: "E",
                  disable: base != Base.HEX,
                  onTap: () => handleOnTapButton("E")),
              Button(
                  content: "F",
                  disable: base != Base.HEX,
                  onTap: () => handleOnTapButton("F")),
            ]),
          ],
        ),
      ),
    );
  }
}
