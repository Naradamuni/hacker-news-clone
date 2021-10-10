/// Data model for comment
/// returns [CommentModel] from [Map] JSON
class CommentModel {
  CommentModel.fromJson(obj) {
    this.id = obj['id'];
    this.by = obj['by'];
    this.kids = obj['kids'];
    this.parent = obj['parent'];
    this.time = obj['time'];
    this.text = obj['text'];
  }

  String by;
  int id;
  List kids;
  int parent;
  String text;
  int time;
}
