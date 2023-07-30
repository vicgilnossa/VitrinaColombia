import 'dart:convert';

import 'package:flutter/foundation.dart';

import 'package:vitrina_colombia/models/project.dart';

class Designer {
  final String? name;
  final String? description;
  final String? city;
  List<Project>? projects;
  Designer({
    this.name,
    this.description,
    this.city,
    this.projects,
  });

  Designer copyWith({
    String? name,
    String? description,
    String? city,
    List<Project>? projects,
  }) {
    return Designer(
      name: name ?? this.name,
      description: description ?? this.description,
      city: city ?? this.city,
      projects: projects ?? this.projects,
    );
  }
}
