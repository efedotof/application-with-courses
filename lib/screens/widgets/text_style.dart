import 'package:flutter/material.dart';

Widget text_style(BuildContext context, text) {
  return Text(
    '$text',
    style: TextStyle(
      color: Colors.grey,
      fontSize: 18,
    ),
  );
}

Widget text_style2(BuildContext context, text) {
  return Text(
    '$text'.toUpperCase(),
    style: TextStyle(
      color: Colors.grey,
      fontSize: 20,
    ),
  );
}
