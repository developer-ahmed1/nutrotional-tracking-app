class UserModel {
  final String uid;
  final String name;
  final String email;
  final String phone;
  final String weight;
  final String profileImageBase64;

  UserModel({
    required this.uid,
    required this.name,
    required this.email,
    required this.phone,
    required this.weight,
    required this.profileImageBase64,
  });

  Map<String, dynamic> toMap() {
    return {
      'uid': uid,
      'name': name,
      'email': email,
      'phone': phone,
      'weight': weight,
      'profileImageBase64': profileImageBase64,
    };
  }

  factory UserModel.fromMap(Map<String, dynamic> map) {
    return UserModel(
      uid: map['uid'] ?? '',
      name: map['name'] ?? '',
      email: map['email'] ?? '',
      phone: map['phone'] ?? '',
      weight: map['weight'] ?? '',
      profileImageBase64: map['profileImageBase64'] ?? '',
    );
  }
}