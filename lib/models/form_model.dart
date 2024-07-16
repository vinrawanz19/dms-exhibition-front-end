class FormModel {
  final int? id;
  final String name;
  final String email;
  final String phoneNumber;
  final String? remark;
  final String company;

  FormModel({
    required this.id,
    required this.name,
    required this.email,
    required this.phoneNumber,
    required this.remark,
    required this.company,
  });

  FormModel copyWith({
    int? id,
    String? name,
    String? email,
    String? phoneNumber,
    String? remark,
    String? company,
  }) =>
      FormModel(
        id: id ?? this.id,
        name: name ?? this.name,
        email: email ?? this.email,
        phoneNumber: phoneNumber ?? this.phoneNumber,
        remark: remark ?? this.remark,
        company: company ?? this.company,
      );

  factory FormModel.fromJson(Map<String, dynamic> json) => FormModel(
        id: json["id"],
        name: json["name"],
        email: json["email"],
        phoneNumber: json["phone_number"],
        remark: json["remark"],
        company: json["company"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "email": email,
        "phone_number": phoneNumber,
        "remark": remark,
        "company": company,
      };
}
