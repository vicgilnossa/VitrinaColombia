import 'package:vitrina_colombia/models/project.dart';

class Designer {
  final String? name;
  final String? profilePicture;
  final String? description;
  final String? city;
  List<Project>? projects;
  Designer({
    this.name,
    this.profilePicture,
    this.description,
    this.city,
    this.projects,
  });

  Designer copyWith({
    String? name,
    String? profilePicture,
    String? description,
    String? city,
    List<Project>? projects,
  }) {
    return Designer(
      name: name ?? this.name,
      profilePicture: profilePicture ?? this.profilePicture,
      description: description ?? this.description,
      city: city ?? this.city,
      projects: projects ?? this.projects,
    );
  }
}
