class CustomerModel {
  final String? id;
  final String name;
  final String email;

  CustomerModel({
    this.id,
    required this.name,
    required this.email,
  });

  Map<String, dynamic> toJson() => {
        'name': name,
        'email': email,
      };

  factory CustomerModel.fromJson(Map<String, dynamic> json, String id) {
    return CustomerModel(
      id: id,
      name: json['name'],
      email: json['email'],
    );
  }
}
