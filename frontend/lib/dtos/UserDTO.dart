class UserDTO {
  final String firstName;
  final String lastName;
  final String email;
  final String phoneNumber;
  final String password;

  UserDTO({
    required this.firstName,
    required this.lastName,
    required this.email,
    required this.phoneNumber,
    required this.password
  });

  factory UserDTO.fromJson(Map<String, dynamic> json) {
    return UserDTO(
      firstName: json['firstName'],
      lastName: json['lastName'],
      email: json['email'],
      phoneNumber: json['phoneNumber'],
      password: json['password'],
    );
  }

  Map<String, dynamic> toJson() => {
    'firstName': firstName,
    'lastName': lastName,
    'email': email,
    'phoneNumber': phoneNumber,
    'password': password,
  };
}
