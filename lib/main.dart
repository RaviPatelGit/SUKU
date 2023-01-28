import 'package:flutter/material.dart';
import 'package:logger/logger.dart';
import 'package:suku/messages/messages_page.dart';
import 'package:suku/notification/notification_page.dart';
import 'package:suku/search/search_page.dart';
import 'package:suku/home/user_feed_page.dart';

var logger = Logger();
void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  var selectedPageIndex = 0;

  var pages = [
    const UserFeedPage(),
    const SearchPage(),
    const NotificationPage(),
    const MessagesPage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: pages[selectedPageIndex],
      // body: pages[0],
      bottomNavigationBar: BottomNavigationBar(
        onTap: (index) {
          setState(() {
            selectedPageIndex = index;
          });
        },
        currentIndex: selectedPageIndex,
        items: [
          BottomNavigationBarItem(
            icon: Icon(
              Icons.home,
              color: selectedPageIndex == 0 ? Colors.blue : Colors.blueGrey,
            ),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.search,
                color: selectedPageIndex == 1 ? Colors.blue : Colors.blueGrey),
            label: 'Search',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.notifications,
                color: selectedPageIndex == 2 ? Colors.blue : Colors.blueGrey),
            label: 'Notifications',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.message,
                color: selectedPageIndex == 3 ? Colors.blue : Colors.blueGrey),
            label: 'Messages',
          ),
        ],
      ),
    );
  }
}
