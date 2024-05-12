class UserResponse {
  bool success;
  List<String> messages; 
  UserData data;
  int status;

  UserResponse({required this.success, required this.messages, required this.data, required this.status});

  factory UserResponse.fromJson(Map<String, dynamic> json) {
    return UserResponse(
      success: json['success'],
      messages: json['messages'] != null ? List<String>.from(json['messages']) : [],
      data: UserData.fromJson(json['data']),
      status: json['status'],
    );
  }
}

class UserData {
  List<User> users;

  UserData({required this.users});

  factory UserData.fromJson(Map<String, dynamic> json) {
    return UserData(
      users: List<User>.from(json['users'].map((user) => User.fromJson(user))),
    );
  }
}

class User {
  String id;
  DateTime createdAt;
  String firstName;
  String lastName;
  String phoneNumber;
  String profileImageUrl;

  User({
    required this.id,
    required this.createdAt,
    required this.firstName,
    required this.lastName,
    required this.phoneNumber,
    required this.profileImageUrl,
  });

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      id: json['id'],
      createdAt: DateTime.parse(json['createdAt']),
      firstName: json['firstName'],
      lastName: json['lastName'],
      phoneNumber: json['phoneNumber'],
      profileImageUrl: json['profileImageUrl'],
    );
  }
}
