class CustomerModel {
  String name;
  String email;

  Map<String, dynamic> toJson() {
    return {'name': name, 'email': email};
  }

  CustomerModel({required this.name, required this.email});
}
