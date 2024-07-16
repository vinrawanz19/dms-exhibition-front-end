class ContentModel {
  final String name;
  final String logoPath;
  final int? id;

  ContentModel({
    required this.name,
    required this.logoPath,
    required this.id,
  });

  ContentModel copyWith({
    String? name,
    String? logoPath,
    int? id,
  }) =>
      ContentModel(
        name: name ?? this.name,
        logoPath: logoPath ?? this.logoPath,
        id: id ?? this.id,
      );

  factory ContentModel.fromJson(Map<String, dynamic> json) => ContentModel(
        name: json["name"],
        logoPath: json["logo_path"],
        id: json["id"],
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "logo_path": logoPath,
        "id": id,
      };
}
