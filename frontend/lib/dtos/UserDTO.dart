import 'dart:convert';

class UserDTO {
  final int id;
  final String firstName;
  final String lastName;
  final String email;
  final String phoneNumber;
  final Set<int> landIds; // Reference to land IDs

  UserDTO({
    required this.id,
    required this.firstName,
    required this.lastName,
    required this.email,
    required this.phoneNumber,
    required this.landIds,
  });

  factory UserDTO.fromJson(Map<String, dynamic> json) {
    return UserDTO(
      id: json['id'],
      firstName: json['firstName'],
      lastName: json['lastName'],
      email: json['email'],
      phoneNumber: json['phoneNumber'],
      landIds: (json['landIds'] as List<dynamic>).map((e) => e as int).toSet(),
    );
  }

  Map<String, dynamic> toJson() => {
    'id': id,
    'firstName': firstName,
    'lastName': lastName,
    'email': email,
    'phoneNumber': phoneNumber,
    'landIds': landIds.toList(),
  };
}
