import 'package:flutter/foundation.dart';
import 'package:provider_arc_by_package_creator/core/models/post.dart';
import 'package:provider_arc_by_package_creator/core/services/api.dart';
import 'package:provider_arc_by_package_creator/core/viemodels/base_model.dart';

class PostsModel extends BaseModel {
  Api _api;

  PostsModel({
    @required Api api,
  }) : _api = api;

  List<Post> posts;

  Future getPosts(int userId) async {
    setBusy(true);
    posts = await _api.getPostsForUser(userId);
    setBusy(false);
  }
}
