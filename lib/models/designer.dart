import 'dart:convert';

import 'package:flutter/foundation.dart';

import 'package:vitrina_colombia/models/project.dart';

class Designer {
  final String name;
  final String description;
  final String city;
  List<Project> projects;
  Designer({
    required this.name,
    required this.description,
    required this.city,
    required this.projects,
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

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'description': description,
      'city': city,
      'projects': projects.map((x) => x.toMap()).toList(),
    };
  }

  factory Designer.fromMap(Map<String, dynamic> map) {
    return Designer(
      name: map['name'] ?? '',
      description: map['description'] ?? '',
      city: map['city'] ?? '',
      projects: List<Project>.from(map['projects']?.map((x) => Project.fromMap(x))),
    );
  }

  String toJson() => json.encode(toMap());

  factory Designer.fromJson(String source) => Designer.fromMap(json.decode(source));

  @override
  String toString() {
    return 'Designer(name: $name, description: $description, city: $city, projects: $projects)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
  
    return other is Designer &&
      other.name == name &&
      other.description == description &&
      other.city == city &&
      listEquals(other.projects, projects);
  }

  @override
  int get hashCode {
    return name.hashCode ^
      description.hashCode ^
      city.hashCode ^
      projects.hashCode;
  }
}
