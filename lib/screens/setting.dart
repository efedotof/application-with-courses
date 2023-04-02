import 'package:flutter/material.dart';
import 'package:cursis/screens/widgets/line_widgets.dart';

class settings extends StatefulWidget {
  const settings({super.key});

  @override
  State<settings> createState() => _settingsState();
}

Widget _station_carcs(BuildContext context) {
  return ListView(
    padding: EdgeInsets.zero,
    children: [],
  );
}

Widget setting_screen(BuildContext context) {
  return Scaffold(
    appBar: AppBar(
      backgroundColor: Colors.white,
      iconTheme: IconThemeData(color: Colors.grey),
    ),
    body: _station_carcs(context),
  );
}

class _settingsState extends State<settings> {
  @override
  Widget build(BuildContext context) {
    return setting_screen(context);
  }
}
