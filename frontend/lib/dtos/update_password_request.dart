class UpdatePasswordRequest {
  final int userId;
  final String oldPassword;
  final String newPassword;

  UpdatePasswordRequest({
    required this.userId,
    required this.oldPassword,
    required this.newPassword,
  });

  Map<String, dynamic> toJson() {
    return {
      'userId': userId,
      'oldPassword': oldPassword,
      'newPassword': newPassword,
    };
  }
}