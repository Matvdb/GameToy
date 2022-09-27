import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class GridButton extends StatelessWidget {
  Function click;
  var text;
  GridButton(this.click, this.text, Null Function() param2, [param3]);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(onPressed: click(), child: Text(text));
  }
}
