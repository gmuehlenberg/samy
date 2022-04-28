import 'package:bloc_mvu_app/config/config_messages.dart';
import 'package:bloc_mvu_app/config/config_model.dart';
import 'package:bloc_mvu_app/mvu/update.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';

class ConfigUpdate extends Update<ConfigMessage, ConfigModel> {
  ConfigUpdate(ConfigModel initialModel) : super(initialModel);

  // ignore: avoid_unused_constructor_parameters
  factory ConfigUpdate.of(BuildContext context) => ConfigUpdate(ConfigModel.createUsingSystemEnvironment());

  @override
  Option<ConfigModel> processMessage(ConfigMessage message, ConfigModel model) => const None();
}
