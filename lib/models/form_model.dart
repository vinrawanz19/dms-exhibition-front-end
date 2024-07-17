class FormModel {
  final int? id;
  final String name;
  final String email;
  final String phoneNumber;
  final String domisili;
  final String company;

  FormModel({
    required this.id,
    required this.name,
    required this.email,
    required this.phoneNumber,
    required this.domisili,
    required this.company,
  });

  FormModel copyWith({
    int? id,
    String? name,
    String? email,
    String? phoneNumber,
    String? domisili,
    String? company,
  }) =>
      FormModel(
        id: id ?? this.id,
        name: name ?? this.name,
        email: email ?? this.email,
        phoneNumber: phoneNumber ?? this.phoneNumber,
        domisili: domisili ?? this.domisili,
        company: company ?? this.company,
      );

  factory FormModel.fromJson(Map<String, dynamic> json) => FormModel(
        id: json["id"],
        name: json["name"],
        email: json["email"],
        phoneNumber: json["phone_number"],
        domisili: json["domisili"],
        company: json["company"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "email": email,
        "phone_number": phoneNumber,
        "domisili": domisili,
        "company": company,
      };
}
