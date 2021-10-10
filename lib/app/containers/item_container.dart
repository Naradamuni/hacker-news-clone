import 'package:flutter/material.dart';
import 'package:hacker_news/app/api_provider/api_provider.dart';
import 'package:hacker_news/app/components/circular_loading_indicator.dart';
import 'package:hacker_news/app/components/story.dart';
import 'package:hacker_news/app/models/display_factory.dart';
import 'package:hacker_news/app/models/item_model.dart';

/// Class to create a news item UI
/// this class gets item details from api and reders UI
/// uses [itemCode] as [int]
class ItemContainer extends StatefulWidget {
  const ItemContainer({Key key, this.itemCode}) : super(key: key);

  final int itemCode;

  @override
  _ItemContainerState createState() => _ItemContainerState();
}

class _ItemContainerState extends State<ItemContainer>
    with SingleTickerProviderStateMixin {
  ItemModel data;
  bool isLoading = true;

  @override
  void initState() {
    load();
    super.initState();
  }

  ///Function to load the data from api
  load() {
    ApiProvider().getStoryDtails(widget.itemCode).then((value) {
      data = value;
      if (!mounted) return;
      setState(() {
        isLoading = false;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return (isLoading)
        ? LoadingIndicator()
        : Story(
            data: DispalyFactory.makeStoryDisplayModel(data),
          );
  }
}
