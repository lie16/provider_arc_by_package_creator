import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_arc_by_package_creator/core/constant/app_constant.dart';
import 'package:provider_arc_by_package_creator/core/models/user.dart';
import 'package:provider_arc_by_package_creator/ui/views/base_widget.dart';
import 'package:provider_arc_by_package_creator/core/viemodels/widgets/post_model.dart';
import 'package:provider_arc_by_package_creator/ui/widgets/postlist_item.dart';

class Posts extends StatelessWidget {
  const Posts({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BaseWidget<PostsModel>(
        model: PostsModel(api: Provider.of(context)),
        onModelReady: (model) => model.getPosts(Provider.of<User>(context).id),
        builder: (context, model, child) => model.busy
            ? Center(
                child: CircularProgressIndicator(),
              )
            : ListView.builder(
                itemCount: model.posts.length,
                itemBuilder: (context, index) => PostListItem(
                  post: model.posts[index],
                  onTap: () {
                    Navigator.pushNamed(
                      context,
                      RoutePaths.Post,
                      arguments: model.posts[index],
                    );
                  },
                ),
              ));
  }
}
