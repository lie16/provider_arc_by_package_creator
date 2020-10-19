import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_arc_by_package_creator/core/models/user.dart';
import 'package:provider_arc_by_package_creator/ui/shared/app_colors.dart';
import 'package:provider_arc_by_package_creator/ui/shared/text_styles.dart';
import 'package:provider_arc_by_package_creator/ui/shared/ui_helpers.dart';
import 'package:provider_arc_by_package_creator/ui/widgets/posts.dart';

class HomeView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          UIHelper.verticalSpaceLarge,
          Padding(
            padding: const EdgeInsets.only(left: 20.0),
            child: Text(
              // consume UserStream
              'Welcome ${Provider.of<User>(context).name}',
              style: headerStyle,
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 20.0),
            child: Text('Here are all your posts', style: subHeaderStyle),
          ),
          UIHelper.verticalSpaceSmall,
          Expanded(
            child: Posts(),
          )
        ],
      ),
    );
  }
}
