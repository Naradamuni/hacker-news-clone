/// class for poll data model
class PollModel {
  PollModel.fromJson(obj) {
    this.id = obj['id'];
    this.descendants = obj['descendants'];
    this.by = obj['by'];
    this.kids = obj['kids'];
    this.parts = obj['parts'];
    this.score = obj['score'];
    this.text = obj['text'];
    this.time = obj['time'];
    this.title = obj['title'];
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
}
