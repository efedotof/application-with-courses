import 'package:flutter/material.dart';
import 'package:cursis/screens/widgets/line_widgets.dart';

class helps_screen extends StatefulWidget {
  const helps_screen({super.key});

  @override
  State<helps_screen> createState() => _helps_screenState();
}

Widget _station_carcs(BuildContext context) {
  return ListView(
    padding: EdgeInsets.zero,
    children: [],
  );
}

Widget help_screen(BuildContext context) {
  return Scaffold(
    appBar: AppBar(
      backgroundColor: Colors.white,
      iconTheme: IconThemeData(color: Colors.grey),
    ),
    body: _station_carcs(context),
  );
}

class _helps_screenState extends State<helps_screen> {
  @override
  Widget build(BuildContext context) {
    return help_screen(context);
  }
}
