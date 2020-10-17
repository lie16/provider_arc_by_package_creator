import 'package:flutter/material.dart';
import 'package:provider_arc_by_package_creator/core/models/post.dart';
import 'package:provider_arc_by_package_creator/ui/shared/app_colors.dart';

class PostView extends StatelessWidget {
  final Post post;
  const PostView({Key key, this.post}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: backgroundColor,
        body: Center(child: Text('Post View')));
  }
}
