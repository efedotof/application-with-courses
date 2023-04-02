import 'package:flutter/material.dart';
import 'package:flutter_profile_picture/flutter_profile_picture.dart';
import 'package:cursis/screens/arrsc.dart';
import 'package:cursis/screens/curs_page.dart';
import 'dart:math';

var array_top_ten = [];
// Рандомный выбор топ - 10
void random_operation_bold() {
  //curs_array

  for (int i = 0; i < 10; i++) {
    var x = Random().nextInt(curs_array.length);
    array_top_ten.add(x);
  }
}

Future simpleDialog(BuildContext context, text) {
  return showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        actions: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  OutlinedButton(
                    child: Text('Добавить в "Смотрю"'),
                    onPressed: () {
                      extractedChildren.add(card_profile(context, text));
                      Navigator.of(context).pop();
                    },
                  ),
                  OutlinedButton(
                    child: Text('Добавить в "Посмотрю позже"'),
                    onPressed: () {
                      extractedChildren2.add(card_profile(context, text));
                      Navigator.of(context).pop();
                    },
                  ),
                  OutlinedButton(
                    child: Text('Начать смотреть'),
                    onPressed: () {
                      extractedChildren.add(card_profile(context, text));
                      Navigator.of(context).pop();
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const Curs_page()),
                      );
                    },
                  ),
                ],
              ),
            ],
          ),
        ],
      );
    },
  );
}

Widget card(BuildContext context, text) {
  return Padding(
    padding: EdgeInsets.only(top: 10),
    child: Container(
      height: 300,
      child: Card(
        child: Container(
          decoration: BoxDecoration(
              gradient: LinearGradient(colors: [
            Color.fromARGB(255, 169, 184, 207),
            Color.fromARGB(255, 197, 214, 240),
          ])),
          child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Align(
                    alignment: Alignment.topRight,
                    child: IconButton(
                        onPressed: () {
                          simpleDialog(context, text);
                        },
                        icon: Icon(Icons.more_vert, color: Colors.white))),
                Align(
                  alignment: Alignment.centerLeft,
                  child: Padding(
                    padding: EdgeInsets.only(top: 40, left: 10),
                    child: Text(
                      "$text",
                      style: TextStyle(color: Colors.white, fontSize: 19),
                    ),
                  ),
                ),
                Align(
                  alignment: Alignment.bottomCenter,
                  child: OutlinedButton(
                    onPressed: () {},
                    child: Text(
                      'Подробнее',
                      style: TextStyle(color: Colors.grey),
                    ),
                    style: OutlinedButton.styleFrom(
                      side: BorderSide(
                        color: Colors.transparent,
                      ),
                    ),
                  ),
                ),
              ]),
        ),
      ),
    ),
  );
}

Widget card_profile(BuildContext context, text) {
  return Padding(
    padding: EdgeInsets.only(top: 10),
    child: Container(
      height: 300,
      child: Card(
        child: Container(
          decoration: BoxDecoration(
              gradient: LinearGradient(colors: [
            Color.fromARGB(255, 169, 184, 207),
            Color.fromARGB(255, 197, 214, 240),
          ])),
          child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Align(
                    alignment: Alignment.topRight,
                    child: IconButton(
                        onPressed: () {},
                        icon: Icon(Icons.more_vert, color: Colors.white))),
                Align(
                  alignment: Alignment.centerLeft,
                  child: Padding(
                    padding: EdgeInsets.only(top: 40, left: 10),
                    child: Text(
                      "$text",
                      style: TextStyle(color: Colors.white, fontSize: 19),
                    ),
                  ),
                ),
                Align(
                  alignment: Alignment.bottomCenter,
                  child: OutlinedButton(
                    onPressed: () {},
                    child: Text(
                      'Подробнее',
                      style: TextStyle(color: Colors.grey),
                    ),
                    style: OutlinedButton.styleFrom(
                      side: BorderSide(
                        color: Colors.transparent,
                      ),
                    ),
                  ),
                ),
              ]),
        ),
      ),
    ),
  );
}

Widget row_curses(BuildContext context, text) {
  return Padding(
    padding: EdgeInsets.only(bottom: 10, left: 10, right: 10),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Card(
          shape: RoundedRectangleBorder(
            side: BorderSide(
              color: Colors.grey,
            ),
            borderRadius: BorderRadius.circular(20.0), //<-- SEE HERE
          ),
          child: Container(
            width: 100,
            padding: EdgeInsets.all(12),
            child: Text(
              '$text',
              style: TextStyle(fontSize: 13, fontWeight: FontWeight.bold),
            ),
          ),
        ),
        Card(
          shape: RoundedRectangleBorder(
            side: BorderSide(
              color: Colors.grey,
            ),
            borderRadius: BorderRadius.circular(20.0), //<-- SEE HERE
          ),
          child: Container(
            width: 100,
            padding: EdgeInsets.all(12),
            child: Text(
              '$text',
              style: TextStyle(fontSize: 13, fontWeight: FontWeight.bold),
            ),
          ),
        ),
        Card(
          shape: RoundedRectangleBorder(
            side: BorderSide(
              color: Colors.grey,
            ),
            borderRadius: BorderRadius.circular(20.0), //<-- SEE HERE
          ),
          child: Container(
            width: 100,
            padding: EdgeInsets.all(12),
            child: Text(
              '$text',
              style: TextStyle(fontSize: 13, fontWeight: FontWeight.bold),
            ),
          ),
        ),
      ],
    ),
  );
}

Widget one_page_widget_cls(BuildContext context, text) {
  return Card(
    child: Container(
      width: 300,
      decoration: BoxDecoration(
          gradient: LinearGradient(colors: [
        Color.fromARGB(255, 169, 184, 207),
        Color.fromARGB(255, 197, 214, 240),
      ])),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Align(
              alignment: Alignment.topRight,
              child: IconButton(
                icon: Icon(Icons.more_vert, color: Colors.white),
                onPressed: () {
                  simpleDialog(context, text);
                },
              )),
          Align(
            alignment: Alignment.centerLeft,
            child: Padding(
              padding: EdgeInsets.only(top: 40, left: 10),
              child: Text(
                "$text",
                style: TextStyle(color: Colors.white, fontSize: 15),
              ),
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: OutlinedButton(
              onPressed: () {},
              child: Text(
                'Подробнее',
                style: TextStyle(color: Colors.grey),
              ),
              style: OutlinedButton.styleFrom(
                side: BorderSide(
                  color: Colors.transparent,
                ),
              ),
            ),
          ),
        ],
      ),
    ),
  );
}

Widget profiles(BuildContext context, name) {
  return ProfilePicture(
    name: '$name',
    radius: 60,
    fontsize: 31,
    random: true,
  );
}
