import 'dart:convert';

import 'package:hacker_news/app/models/item_model.dart';
import 'package:http/http.dart' show Client;

/// The api provider class
/// This class all required api connection functions
class ApiProvider {
  Client client = Client();

  /// API function to get new stories
  /// returns [List] of id's
  Future<List<int>> newStories() async {
    final response = await client.get(
      Uri.parse(
          'https://hacker-news.firebaseio.com/v0/newstories.json?print=pretty'),
    );

    return json.decode(response.body).cast<int>();
  }

  /// API function to get top stories
  /// returns [List] of id's
  Future<List<int>> topStories() async {
    final response = await client.get(
      Uri.parse(
          'https://hacker-news.firebaseio.com/v0/topstories.json?print=pretty'),
    );

    return json.decode(response.body).cast<int>();
  }

  /// API function to get a story details
  /// returns a record
  Future<ItemModel> getStoryDtails(int id) async {
    final response = await client.get(
      Uri.parse(
          'https://hacker-news.firebaseio.com/v0/item/${id.toString()}.json?print=pretty'),
    );

    return ItemModel.fromJson(json.decode(response.body));
  }
}
