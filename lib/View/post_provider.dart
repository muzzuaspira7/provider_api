// post_provider.dart
import 'package:flutter/material.dart';
import '../Model/post.dart';
import '../Service/remote_services.dart';

class PostProvider extends ChangeNotifier {
  List<Post>? _posts;
  List<Post>? get posts => _posts;

  bool _isLoading = false;
  bool get isLoading => _isLoading;

  Future<void> fetchPosts() async {
    _isLoading = true;
    notifyListeners();
    _posts = await RemoteService().getPosts();
    _isLoading = false;
    notifyListeners();
  }
}
