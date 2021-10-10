import 'package:flutter/material.dart';
import 'package:hacker_news/app/api_provider/api_provider.dart';
import 'package:hacker_news/app/components/circular_loading_indicator.dart';
import 'package:hacker_news/app/containers/item_container.dart';

/// Class for top news
class TrendingPage extends StatefulWidget {
  TrendingPage({Key key}) : super(key: key);

  @override
  _TrendingPageState createState() => _TrendingPageState();
}

class _TrendingPageState extends State<TrendingPage> {
  bool isLoading = true;
  List<int> latestSotires;
  @override
  void initState() {
    loadData();
    super.initState();
  }

  loadData() {
    ApiProvider().topStories().then((value) {
      latestSotires = value;
      setState(() {
        isLoading = false;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return isLoading
        ? LoadingIndicator()
        : Container(
            child: ListView(
              children: latestSotires
                  .map((e) => ItemContainer(
                        itemCode: e,
                      ))
                  .toList(),
            ),
          );
  }
}
