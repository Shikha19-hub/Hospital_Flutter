class Patient {
  final String id;
  final String name;
  final String email;
  final String password;
  final int age;
  final String gender;

  Patient({
    required this.id,
    required this.name,
    required this.email,
    required this.password,
    required this.age,
    required this.gender,
  });

  factory Patient.fromJson(Map<String, dynamic> json) {
    return Patient(
      id: json['id'],
      name: json['name'],
      email: json['email'],
      password: json['password'],
      age: json['age'],
      gender: json['gender'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'email': email,
      'password': password,
      'age': age,
      'gender': gender,
    };
  }
}
