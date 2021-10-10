import 'package:hacker_news/app/models/comment_model.dart';
import 'package:hacker_news/app/models/job_model.dart';
import 'package:hacker_news/app/models/poll_model.dart';
import 'package:hacker_news/app/models/pollopt_model.dart';
import 'package:hacker_news/app/models/story_model.dart';

/// Data model class for news item
class ItemModel {
  ItemModel.fromJson(obj) {
    this.type = enumFromString<ItemType>(ItemType.values, obj["type"]);
    data = getDatamodelFromType(this.type, obj);
  }
  ItemType type;
  var data;
  getDatamodelFromType(ItemType type, obj) {
    switch (type) {
      case ItemType.job:
        return JobModel.fromJson(obj);
        break;
      case ItemType.story:
        return StoryModel.fromJson(obj);
        break;
      case ItemType.poll:
        return PollModel.fromJson(obj);
        break;
      case ItemType.pollopt:
        return PolloptModel.fromJson(obj);
        break;
      case ItemType.comment:
        return CommentModel.fromJson(obj);
        break;
    }
  }
}

enum ItemType { story, job, poll, pollopt, comment }

T enumFromString<T>(Iterable<T> values, String value) {
  return values.firstWhere((type) => type.toString().split(".").last == value);
}
