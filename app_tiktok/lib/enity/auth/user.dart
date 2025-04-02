class User {
  int id;
  String firstName;
  String lastName;
  String maidenName;
  int age;
  String gender;
  String email;
  String phone;
  String username;
  String password;
  String birthDate;
  String image;
  String bloodGroup;
  double height;
  double weight;
  String eyeColor;
  String ip;
  String macAddress;
  String university;
  String ein;
  String ssn;
  String userAgent;
  String role;
  String following;
  String followers;
  String likes;

  User({
    required this.id,
    required this.firstName,
    required this.lastName,
    required this.maidenName,
    required this.age,
    required this.gender,
    required this.email,
    required this.phone,
    required this.username,
    required this.password,
    required this.birthDate,
    required this.image,
    required this.bloodGroup,
    required this.height,
    required this.weight,
    required this.eyeColor,
    required this.ip,
    required this.macAddress,
    required this.university,
    required this.ein,
    required this.ssn,
    required this.userAgent,
    required this.role,
    required this.followers,
    required this.following,
    required this.likes,
  });

  // Hàm fromJson để chuyển đổi từ JSON sang đối tượng User
  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      id: json['id'] ?? 0,
      firstName: json['firstName'] ?? '',
      lastName: json['lastName'] ?? '',
      maidenName: json['maidenName'] ?? '',
      age: json['age'] ?? 0,
      gender: json['gender'] ?? '',
      email: json['email'] ?? '',
      phone: json['phone'] ?? '',
      username: json['username'] ?? '',
      password: json['password'] ?? '',
      birthDate: json['birthDate'] ?? '',
      image: json['image'] ?? '',
      bloodGroup: json['bloodGroup'] ?? '',
      height: (json['height'] ?? 0.0).toDouble(),
      weight: (json['weight'] ?? 0.0).toDouble(),
      eyeColor: json['eyeColor'] ?? '',
      ip: json['ip'] ?? '',
      macAddress: json['macAddress'] ?? '',
      university: json['university'] ?? '',
      ein: json['ein'] ?? '',
      ssn: json['ssn'] ?? '',
      userAgent: json['userAgent'] ?? '',
      role: json['role'] ?? '',
      following:
          json['following'] ?? '0', // Ensure these fields are mapped correctly
      followers: json['followers'] ?? '0',
      likes: json['likes'] ?? '0',
    );
  }
}
