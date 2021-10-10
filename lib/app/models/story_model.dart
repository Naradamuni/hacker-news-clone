/// The type story data model
class StoryModel {
  StoryModel.fromJson(obj) {
    this.id = obj['id'];
    this.descendants = obj['descendants'];
    this.by = obj['by'];
    this.kids = obj['kids'];
    this.parts = obj['parts'];
    this.score = obj['score'];
    this.time = obj['time'];
    this.title = obj['title'];
    this.url = obj['url'];
    this.text = obj['text'];
  }

  String by;
  int descendants;
  int id;
  List kids;
  List parts;
  int score;
  String text;
  int time;
  String title;
  String url;
}
