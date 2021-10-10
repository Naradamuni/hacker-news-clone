import 'package:flutter/material.dart';
import 'package:hacker_news/app/page/latest/lastest.dart';
import 'package:hacker_news/app/page/trending/trending.dart';

/// The home page
class MyHomePage extends StatefulWidget {
  MyHomePage({Key key}) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage>
    with SingleTickerProviderStateMixin {
  /// index to tab view
  int _tabIndex = 0;

  /// the page controller instance
  final PageController pageController = PageController();

  // list of tab widgets
  final List<Widget> _tabsChildren = [LatestPage(), TrendingPage()];
  void onTabTapped(int index) {
    setState(() {
      _tabIndex = index;
    });
    pageController.jumpToPage(index);
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 4,
      child: Scaffold(
          appBar: AppBar(
            title: Text('Hacker news'),
          ),
          body: PageView(
            children: _tabsChildren,
            controller: pageController,
            onPageChanged: (index) {
              onTabTapped(index);
            },
          ),
          bottomNavigationBar: BottomNavigationBar(
            currentIndex: _tabIndex,
            items: [
              new BottomNavigationBarItem(
                icon: Icon(Icons.home),
                label: 'new',
              ),
              new BottomNavigationBarItem(
                icon: Icon(Icons.trending_up),
                label: 'top news',
              ),
            ],
          )),
    );
  }
}
