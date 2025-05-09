import 'dart:io';

import 'package:flutter/widgets.dart';

class AddProjectModel {
  final String projectTitle;
  final String projectDescp;
  final String projectLink;
  final Widget image;
  final File projectFile;

  AddProjectModel({
    required this.projectTitle,
    required this.projectDescp,
    required this.projectLink,
    required this.image,
    required this.projectFile,
  });
}
