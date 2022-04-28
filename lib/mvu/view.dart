import 'package:bloc_mvu_app/mvu/messaging.dart';
import 'package:bloc_mvu_app/mvu/update.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

/// Allows to describe a view by only accessing [MDL]
abstract class View<MSG extends UpdateMessage, MDL,
    UPD extends Update<MSG, MDL>> extends StatelessWidget {
  const View({Key? key}) : super(key: key);

  /// An override of this method describes an MVU-View
  Widget buildView(MDL model);

  Widget _blockWidgetBuilder(BuildContext context, MDL model) =>
      buildView(model);

  @override
  Widget build(BuildContext context) =>
      BlocBuilder<UPD, MDL>(builder: _blockWidgetBuilder);
}
