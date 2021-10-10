///Class for job data model
class JobModel {
  JobModel.fromJson(obj) {
    this.id = obj['id'];
    this.by = obj['by'];
    this.score = obj['score'];
    this.text = obj['text'];
    this.time = obj['time'];
    this.url = obj['url'];
  }

  String by;
  int id;
  int score;
  String text;
  int time;
  String url;
}
