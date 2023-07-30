import 'dart:convert';

import 'package:flutter/foundation.dart';

class Project {
  final String name;
  final String postDate;
  final String category;
  final String client;
  final String tool;
  final String viewsQuantity;
  final String description;
  List<String> pictures;

  final int likesQuantity;
  final int commentsQuantity;

  Project(
    this.name,
    this.postDate,
    this.category,
    this.client,
    this.tool,
    this.viewsQuantity,
    this.description,
    this.pictures,
    this.likesQuantity,
    this.commentsQuantity,
  );

  Project copyWith({
    String? name,
    String? postDate,
    String? category,
    String? client,
    String? tool,
    String? viewsQuantity,
    String? description,
    List<String>? pictures,
    int? likesQuantity,
    int? commentsQuantity,
  }) {
    return Project(
      name ?? this.name,
      postDate ?? this.postDate,
      category ?? this.category,
      client ?? this.client,
      tool ?? this.tool,
      viewsQuantity ?? this.viewsQuantity,
      description ?? this.description,
      pictures ?? this.pictures,
      likesQuantity ?? this.likesQuantity,
      commentsQuantity ?? this.commentsQuantity,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'postDate': postDate,
      'category': category,
      'client': client,
      'tool': tool,
      'viewsQuantity': viewsQuantity,
      'description': description,
      'pictures': pictures,
      'likesQuantity': likesQuantity,
      'commentsQuantity': commentsQuantity,
    };
  }

  factory Project.fromMap(Map<String, dynamic> map) {
    return Project(
      map['name'] ?? '',
      map['postDate'] ?? '',
      map['category'] ?? '',
      map['client'] ?? '',
      map['tool'] ?? '',
      map['viewsQuantity'] ?? '',
      map['description'] ?? '',
      List<String>.from(map['pictures']),
      map['likesQuantity']?.toInt() ?? 0,
      map['commentsQuantity']?.toInt() ?? 0,
    );
  }

  String toJson() => json.encode(toMap());

  factory Project.fromJson(String source) =>
      Project.fromMap(json.decode(source));

  @override
  String toString() {
    return 'Project(name: $name, postDate: $postDate, category: $category, client: $client, tool: $tool, viewsQuantity: $viewsQuantity, description: $description, pictures: $pictures, likesQuantity: $likesQuantity, commentsQuantity: $commentsQuantity)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is Project &&
        other.name == name &&
        other.postDate == postDate &&
        other.category == category &&
        other.client == client &&
        other.tool == tool &&
        other.viewsQuantity == viewsQuantity &&
        other.description == description &&
        listEquals(other.pictures, pictures) &&
        other.likesQuantity == likesQuantity &&
        other.commentsQuantity == commentsQuantity;
  }

  @override
  int get hashCode {
    return name.hashCode ^
        postDate.hashCode ^
        category.hashCode ^
        client.hashCode ^
        tool.hashCode ^
        viewsQuantity.hashCode ^
        description.hashCode ^
        pictures.hashCode ^
        likesQuantity.hashCode ^
        commentsQuantity.hashCode;
  }
}
