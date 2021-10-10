import 'package:flutter/material.dart';
import 'package:hacker_news/app/models/story_display_model.dart';
import 'package:simple_url_preview/simple_url_preview.dart';

/// Stateless class creates Story UI
/// Returns a List with name, text, url meta scrape card and time ago
class Story extends StatelessWidget {
  const Story({Key key, this.data}) : super(key: key);

  final StoryDisplayModel data;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Icon(Icons.person),
              Container(
                margin: EdgeInsets.only(left: 10),
                child: Text(
                  this.data.by,
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                ),
              )
            ],
          ),
          SizedBox(
            height: 5,
          ),
          Text(this.data.text),
          if (this.data.hasUrl)
            SimpleUrlPreview(
              url: this.data.url,
              bgColor: Colors.white,
              titleStyle: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                  fontSize: 16),
              siteNameStyle: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                  fontSize: 16),
              descriptionStyle: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.normal,
                  fontSize: 14),
            ),
          Container(
            alignment: Alignment.bottomRight,
            margin: EdgeInsets.only(top: 5),
            child: Text(
              this.data.time,
              style: TextStyle(color: Colors.black45, fontSize: 14),
            ),
          ),
          Divider(
            thickness: 2,
          )
        ],
      ),
    );
  }
}
