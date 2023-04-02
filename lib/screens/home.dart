import 'package:flutter/material.dart';
import 'package:animated_search_bar/animated_search_bar.dart';
import 'package:flutter_profile_picture/flutter_profile_picture.dart';
import 'package:cursis/screens/widgets.dart';
import 'package:flutter/cupertino.dart';
import 'package:cursis/screens/arrsc.dart';
import 'package:cursis/screens/setting.dart';
import 'package:cursis/screens/help.dart';

import 'dart:math' as math;

class Home_page extends StatefulWidget {
  const Home_page({super.key});

  @override
  State<Home_page> createState() => _Home_pageState();
}

class _Home_pageState extends State<Home_page> {
  int _currentIndex = 0;
  PageController pageController = PageController();
  String searchText = "";
  TextEditingController _controller =
      TextEditingController(text: "Initial Text");

  TextEditingController textController = TextEditingController();

  static const TextStyle optionStyle =
      TextStyle(fontSize: 30, fontWeight: FontWeight.w500);
  final List<Widget> _children = [
    Text(
      "Home",
      style: optionStyle,
    ),
    Text(
      "Messages",
      style: optionStyle,
    ),
    Text(
      "Profile",
      style: optionStyle,
    )
  ];

  void onTabTapped(int index) {
    setState(() {
      _currentIndex = index;
    });
    pageController.animateToPage(
      index,
      duration: Duration(milliseconds: 500),
      curve: Curves.easeIn,
    );
  }

  Widget out_buts(
    BuildContext context,
    text,
    indexs,
  ) {
    return OutlinedButton(
      onPressed: () {
        setState(() {
          if (indexs == 1) {
            onTabTapped(2);
          }
          if (indexs == 2) {
            onTabTapped(0);
          }
          if (indexs == 3) {
            onTabTapped(2);
          }
          if (indexs == 4) {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const settings()),
            );
          }
          if (indexs == 5) {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const helps_screen()),
            );
          }
          if (indexs == 6) {
            onTabTapped(indexs);
          }
        });
      },
      child: Text(
        '$text',
        style: TextStyle(color: Colors.grey),
      ),
      style: OutlinedButton.styleFrom(
        side: BorderSide(
          color: Colors.transparent,
        ),
      ),
    );
  }

// первая страница

  Widget page_one(BuildContext context) {
    random_operation_bold();
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        iconTheme: IconThemeData(color: Colors.grey),
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            const DrawerHeader(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Column(
                    children: [
                      ProfilePicture(
                        name: 'Rajat Plankar',
                        radius: 60,
                        fontsize: 31,
                        random: true,
                      ),
                      Padding(
                        padding: EdgeInsets.only(top: 3),
                        child: Text('Rajat Plankar'),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            for (int i = 0; i < array_numbers.length; i++)
              ListTile(
                title: out_buts(context, array_numbers[i], indexs_array[i]),
              ),
          ],
        ),
      ),
      body: ListView(
        padding: const EdgeInsets.all(8),
        children: <Widget>[
          Padding(
            padding: EdgeInsets.only(top: 20, bottom: 5),
            child: Text('Топ 10 курсов'),
          ),
          Container(
            height: 200,
            child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: 10,
                itemBuilder: (context, index) {
                  var s = array_top_ten[index];
                  return one_page_widget_cls(context, curs_array[s]);
                }),
          ),
          Padding(
            padding: EdgeInsets.only(top: 20, bottom: 5),
            child: Text('Все курсы'),
          ),
          for (int i = 0; i < curs_array.length; i++)
            card(context, curs_array[i]),
        ],
      ),
    );
  }

// Вторая страница

  Widget page_2(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: AnimatedSearchBar(
            label: "Поиск",
            controller: _controller,
            searchIcon: const Icon(
              Icons.search,
              color: Colors.grey,
            ),
            labelStyle: TextStyle(fontSize: 16, color: Colors.grey),
            closeIcon: const Icon(
              Icons.close,
              color: Colors.grey,
            ),
            searchStyle: TextStyle(color: Colors.grey),
            cursorColor: Colors.grey,
            textInputAction: TextInputAction.done,
            searchDecoration: const InputDecoration(
              hintText: "Найти",
              alignLabelWithHint: true,
              fillColor: Colors.grey,
              focusColor: Colors.grey,
              hintStyle: TextStyle(color: Colors.grey),
              border: InputBorder.none,
            ),
            onChanged: (value) {
              setState(() {
                searchText = value;
                print(searchText);
              });
            },
            onFieldSubmitted: (value) {
              setState(() {
                searchText = value;
                print(searchText);
              });
            }),
      ),
      body: ListView(
        padding: const EdgeInsets.all(8),
        children: <Widget>[
          Padding(
            padding: EdgeInsets.only(top: 20, bottom: 5),
            child: Text('Списки курсов'),
          ),
          for (int i = 0; i < 25; i++) row_curses(context, i),
        ],
      ),
    );
  }

// Третья страница

  Widget page_3(BuildContext context) {
    return ListView(
      children: <Widget>[
        Column(
          children: [
            Container(
              width: MediaQuery.of(context).size.width,
              child: Column(
                children: [
                  Container(
                    width: double.infinity,
                    height: 150,
                    child: Container(
                      alignment: Alignment(0.0, 0.003),
                      child: profiles(context, 'Rajat Palankar'),
                    ),
                  ),
                  Text(
                    "Rajat Palankar",
                    style: TextStyle(
                        fontSize: 25.0,
                        color: Colors.blueGrey,
                        letterSpacing: 2.0,
                        fontWeight: FontWeight.w400),
                  ),
                ],
              ),
            ),
            Column(
              children: [
                Padding(
                  padding: EdgeInsets.only(top: 10, bottom: 10),
                  child: Container(
                    height: 1,
                    width: MediaQuery.of(context).size.width,
                    color: Colors.grey,
                  ),
                ),
                const Text('Смотрю'),
                for (int i = 0; i < extractedChildren.length; i++)
                  extractedChildren[i],
                Padding(
                  padding: EdgeInsets.only(top: 10, bottom: 10),
                  child: Container(
                    height: 1,
                    width: MediaQuery.of(context).size.width,
                    color: Colors.grey,
                  ),
                ),
                const Text('Посмотрю позже '),
                for (int i = 0; i < extractedChildren2.length; i++)
                  extractedChildren2[i],
              ],
            ),
          ],
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(controller: pageController, children: [
        page_one(context),
        page_2(context),
        page_3(context),
      ]),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(icon: Icon(Icons.search), label: 'Search'),
          BottomNavigationBarItem(
              icon: Icon(Icons.account_circle_outlined), label: 'Account'),
        ],
        currentIndex: _currentIndex,
        onTap: onTabTapped,
      ),
    );
  }
}
