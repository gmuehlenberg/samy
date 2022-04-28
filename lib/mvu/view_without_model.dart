import 'package:flutter/material.dart';

/// Allows to describe a view with static content
abstract class ViewWithoutModel extends StatelessWidget {
  const ViewWithoutModel({Key? key}) : super(key: key);

  Widget buildView();

  @override
  Widget build(BuildContext context) => buildView();
}
