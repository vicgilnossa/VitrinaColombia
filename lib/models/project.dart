class Project {
  final String name;
  final String postDate;
  final String category;
  final String client;
  final String tool;

  final String description;
  List<String> pictures;

  final int likesQuantity;
  final int commentsQuantity;
  final int viewsQuantity;

  Project(
    this.name,
    this.postDate,
    this.category,
    this.client,
    this.tool,
    this.description,
    this.pictures,
    this.likesQuantity,
    this.commentsQuantity,
    this.viewsQuantity,
  );

  Project copyWith({
    String? name,
    String? postDate,
    String? category,
    String? client,
    String? tool,
    String? description,
    List<String>? pictures,
    int? likesQuantity,
    int? commentsQuantity,
    int? viewsQuantity,
  }) {
    return Project(
      name ?? this.name,
      postDate ?? this.postDate,
      category ?? this.category,
      client ?? this.client,
      tool ?? this.tool,
      description ?? this.description,
      pictures ?? this.pictures,
      likesQuantity ?? this.likesQuantity,
      commentsQuantity ?? this.commentsQuantity,
      viewsQuantity ?? this.viewsQuantity,
    );
  }
}
