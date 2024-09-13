class UserDTO {
  final String firstName;
  final String lastName;
  final String email;
  final String phoneNumber;

  UserDTO({
    required this.firstName,
    required this.lastName,
    required this.email,
    required this.phoneNumber,
  });

  factory UserDTO.fromJson(Map<String, dynamic> json) {
    return UserDTO(
      firstName: json['firstName'],
      lastName: json['lastName'],
      email: json['email'],
      phoneNumber: json['phoneNumber'],
    );
  }

  Map<String, dynamic> toJson() => {
    'firstName': firstName,
    'lastName': lastName,
    'email': email,
    'phoneNumber': phoneNumber,
  };
}
