/// Class for Pollopt data model
class PolloptModel {
  PolloptModel.fromJson(obj) {
    this.id = obj['id'];
    this.by = obj['by'];
    this.polll = obj['polll'];
    this.score = obj['score'];
    this.text = obj['text'];
    this.time = obj['time'];
  }

  String by;
  int id;
  int polll;
  int score;
  String text;
  int time;
}
