import 'package:hacker_news/app/models/item_model.dart';
import 'package:hacker_news/app/models/story_display_model.dart';
import 'package:timeago/timeago.dart' as timeago;

/// The Factory class to create display models
class DispalyFactory {
  ///Function to createStory display model

  static StoryDisplayModel makeStoryDisplayModel(ItemModel model) {
    StoryDisplayModel storyDisplayModel = StoryDisplayModel();
    DateTime date = new DateTime.fromMicrosecondsSinceEpoch(model.data.time);
    storyDisplayModel.by = model.data.by;
    switch (model.type) {
      case ItemType.story:
        storyDisplayModel.text = model.data.text ?? model.data.title;
        storyDisplayModel.hasUrl = hasUrl(model.data.url);
        storyDisplayModel.url = model.data.url;
        storyDisplayModel.time = timeago.format(date);
        break;
      case ItemType.job:
        storyDisplayModel.text = model.data.text;
        storyDisplayModel.hasUrl = hasUrl(model.data.url);
        storyDisplayModel.url = model.data.url;
        break;
      case ItemType.poll:
        storyDisplayModel.text = model.data.text ?? model.data.title;
        storyDisplayModel.hasUrl = hasUrl(model.data.url);
        break;
      case ItemType.pollopt:
        storyDisplayModel.text = model.data.text;
        storyDisplayModel.hasUrl = hasUrl(model.data.url);
        break;
      case ItemType.comment:
        storyDisplayModel.text = model.data.text;
        storyDisplayModel.hasUrl = hasUrl(model.data.url);
        break;
    }
    return storyDisplayModel;
  }

  static bool hasUrl(String url) {
    return (url != null && url.length > 0);
  }
}
